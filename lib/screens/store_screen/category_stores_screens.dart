import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtjry/screens/store_screen/cubit/store_cubit.dart';

//import 'package:mtjry/models/store.dart';
import '../../widgets/store_item.dart';
//import '../../app_data.dart';

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/categroy-stores';

  //CategoryTripsScreen(void Function(String storeId) manageFavorite,
  // bool Function(String id) isFavorite);
  //final Function manageFavorite;
  //final Function isFavorite;
  //CategoryTripsScreen(void Function(String storeId) manageFavorite, isFavorite);
  const CategoryTripsScreen(this.manageFavorite, this.isFavorite, {Key? key})
      : super(key: key);

  //final String categoryId;
  // final String categoryTitle;
  final Function manageFavorite;
  final Function isFavorite;

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  @override
  void initState() {
    StoreCubit.get(context).getStoreData();
    StoreCubit.get(context).getCouponData();
    StoreCubit.get(context).getUserData();
    super.initState();
  }

  // const CategoryTripsScreen(this.categoryId, this.categoryTitle);
  void doSomething() {
    print('Hello man');
  }

  @override
  Widget build(BuildContext context) {
    final routeArgument =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['name'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? ""),
      ),
      body: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var store = StoreCubit.get(context).storeData;
          var coupon = StoreCubit.get(context).couponData;
          var searchedData = StoreCubit.get(context).researchedData;
          if (state is StoreLoading ||
              //  store == null ||
              // coupon == null ||
              searchedData == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorOccurred) {
            return const Text("حدث خطأ");
          }
          final filterdStore = store.where((Store) {
            return Store.categories.contains(categoryId);
          }).toList();
          List filterdCoupon = [];
          for (var storeElement in filterdStore) {
            filterdCoupon.addAll(
                coupon.where((element) => element.store == storeElement.id));
          }

          final fileterdSeachedStore = searchedData.where((Store) {
            return Store.categories.contains(categoryId);
          }).toList();
          List filterdSearchedCoupon = [];
          for (var storeElement in fileterdSeachedStore) {
            filterdSearchedCoupon.addAll(
                coupon.where((element) => element.store == storeElement.id));
          }
          return Column(
            children: [
              // بحث خاص بالمتاجر المعروض في نفس التصنيف فقط

              /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: StoreCubit.get(context).searchController,
                  decoration: const InputDecoration(
                      labelText: "بحث", border: OutlineInputBorder()),
                  onChanged: (value) {
                    StoreCubit.get(context).searchStore(
                        StoreCubit.get(context).searchController.text);
                  },
                ),
              ),*/
              StoreCubit.get(context).searchController.text.isEmpty
                  ? Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          // ignore: deprecated_member_use_from_same_package
                          final storeDate = filterdStore
                              .where((element) =>
                                  element.id == filterdCoupon[index].store)
                              .firstOrNull;
                          return StoreItem(
                            title: storeDate!.name,
                            imageUrl: storeDate.image,
                            id: filterdCoupon[index].id,
                            SiteUrl: filterdCoupon[index].url,
                            copoun: filterdCoupon[index].coupon,
                            Specialization: filterdCoupon[index].description,
                            discount: filterdCoupon[index].discount,
                          );
                        },
                        itemCount: filterdCoupon.length,
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemBuilder: (ctx, index) {
                          // ignore: deprecated_member_use_from_same_package
                          final storeDate = fileterdSeachedStore
                              .where((element) =>
                                  element.id ==
                                  filterdSearchedCoupon[index].store)
                              .firstOrNull;
                          return StoreItem(
                            title: storeDate!.name,
                            imageUrl: storeDate.image,
                            id: filterdSearchedCoupon[index].id,
                            SiteUrl: filterdSearchedCoupon[index].url,
                            copoun: filterdSearchedCoupon[index].coupon,
                            Specialization:
                                filterdSearchedCoupon[index].description,
                            discount: filterdSearchedCoupon[index].discount,
                          );
                        },
                        itemCount: filterdSearchedCoupon.length,
                      ),
                    ),
            ],
          );
        },
      ),
    );
  }
}

















/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtjry/screens/store_screen/cubit/store_cubit.dart';
import '../../widgets/store_item.dart';
import 'package:mtjry/models/store.dart'; // تأكد من استيراد نموذج Store إذا لم يكن مستوردًا

class CategoryTripsScreen extends StatefulWidget {
  static const screenRoute = '/categroy-stores';

  const CategoryTripsScreen(this.manageFavorite, this.isFavorite, {Key? key})
      : super(key: key);

  final Function manageFavorite;
  final Function isFavorite;

  @override
  State<CategoryTripsScreen> createState() => _CategoryTripsScreenState();
}

class _CategoryTripsScreenState extends State<CategoryTripsScreen> {
  @override
  void initState() {
    super.initState();
    print("Initializing CategoryTripsScreen");
    StoreCubit.get(context).getStoreData();
    StoreCubit.get(context).getCouponData();
    StoreCubit.get(context).getUserData();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgument =
    ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    final categoryId = routeArgument['id'];
    final categoryTitle = routeArgument['name'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle ?? ""),
      ),
      body: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {
          // تتبع الاستماع للتغيرات في الحالة
          print("State changed: $state");
        },
        builder: (context, state) {
          var store = StoreCubit.get(context).storeData;
          var coupon = StoreCubit.get(context).couponData;
          var searchedData = StoreCubit.get(context).researchedData;
          var user = StoreCubit.get(context).userData;

          print("Current State: $state");
          print("User Data: $user");
          print("Store Data: $store");
          print("Coupon Data: $coupon");

          if (state is StoreLoading ||
              user == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorOccurred) {
            return const Text("حدث خطأ");
          }

          final filteredStore = store.where((store) {
            return store.categories.contains(categoryId);
          }).toList();

          List filteredCoupon = [];
          for (var storeElement in filteredStore) {
            filteredCoupon.addAll(
                coupon.where((element) => element.store == storeElement.id));
          }

          final filteredSearchedStore = searchedData!.where((store) {
            return store.categories.contains(categoryId);
          }).toList();

          List filteredSearchedCoupon = [];
          for (var storeElement in filteredSearchedStore) {
            filteredSearchedCoupon.addAll(
                coupon.where((element) => element.store == storeElement.id));
          }

          return Column(
            children: [
              StoreCubit.get(context).searchController.text.isEmpty
                  ? Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    final storeData = filteredStore.firstWhere(
                          (element) =>
                      element.id == filteredCoupon[index].store,
                      orElse: () => Store(
                        id: 'not_found',
                        name: 'متجر غير موجود',
                        image: '',

                        categories: [], url: '',
                      ),
                    );

                    if (storeData.id == 'not_found') {
                      return const ListTile(
                        title: Text('متجر غير موجود'),
                        subtitle: Text('قد يكون المتجر قد تم حذفه.'),
                      );
                    }

                    return StoreItem(
                      title: storeData.name,
                      imageUrl: storeData.image,
                      id: filteredCoupon[index].id,
                      SiteUrl: filteredCoupon[index].url,
                      copoun: filteredCoupon[index].coupon,
                      Specialization: filteredCoupon[index].description,
                      discount: filteredCoupon[index].discount,
                    );
                  },
                  itemCount: filteredCoupon.length,
                ),
              )
                  : Expanded(
                child: ListView.builder(
                  itemBuilder: (ctx, index) {
                    final storeData = filteredSearchedStore.firstWhere(
                          (element) =>
                      element.id ==
                          filteredSearchedCoupon[index].store,
                      orElse: () => Store(
                        id: 'not_found',
                        name: 'متجر غير موجود',
                        image: '',

                        categories: [], url: '',
                      ),
                    );

                    if (storeData.id == 'not_found') {
                      return const ListTile(
                        title: Text('متجر غير موجود'),
                        subtitle: Text('قد يكون المتجر قد تم حذفه.'),
                      );
                    }

                    return StoreItem(
                      title: storeData.name,
                      imageUrl: storeData.image,
                      id: filteredSearchedCoupon[index].id,
                      SiteUrl: filteredSearchedCoupon[index].url,
                      copoun: filteredSearchedCoupon[index].coupon,
                      Specialization:
                      filteredSearchedCoupon[index].description,
                      discount: filteredSearchedCoupon[index].discount,
                    );
                  },
                  itemCount: filteredSearchedCoupon.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}*/
























