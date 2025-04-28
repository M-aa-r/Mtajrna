/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtjry/screens/category/cubit/category_cubit.dart';
//import 'package:mtjry/screens/category/cubit/category_cubit.dart';
import 'package:mtjry/screens/store_screen/cubit/store_cubit.dart';
//mport '../../app_data.dart';
import '../../widgets/category_item.dart';
import '../../widgets/store_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    CategoryCubit.get(context).getCategoryData();
    StoreCubit.get(context).getStoreData();
    StoreCubit.get(context).getCouponData();
    StoreCubit.get(context).getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //title: Text('اسم التطبيق '),
      //), // AppBar
      body: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var coupon = StoreCubit.get(context).couponData;
          var searchedData = StoreCubit.get(context).researchedData;
          if (state is CategoryLoading || searchedData == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorOccurred) {
            return const Text("حدث خطأ");
          }
          return BlocConsumer<CategoryCubit, CategoryState>(
            listener: (context, state) {
              // TODO: implement listener
            },
            builder: (context, state) {
              var category = CategoryCubit.get(context).categoryData;
              if (state is CategoryLoading || category == null) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorOccurred) {
                return const Text("حدث خطأ");
              }
              List filterdSearchedCoupon = [];
              for (var storeElement in searchedData) {
                filterdSearchedCoupon.addAll(coupon
                    .where((element) => element.store == storeElement.id));
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 500,
                      height: 45,
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        controller: StoreCubit.get(context).searchController,
                        decoration: InputDecoration(
                          labelText: "بحث",

                          // hintText: "بحث",

                          // prefixIcon: Icon(Icons.search ),

                          prefixIcon: GestureDetector(
                            onTap: () {},
                            child: Container(
                              margin: EdgeInsets.all(6),
                              padding: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      width: 2,
                                      color: const Color.fromRGBO(
                                          63, 81, 181, 1))),
                              child: Icon(
                                Icons.search,
                                color: const Color.fromRGBO(63, 81, 181, 1),
                                size: 15,
                              ),
                            ),
                          ),

                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.5),
                            borderSide: BorderSide(
                              color: Colors.grey,
                              // Set to white to match the container background
                            ),
                          ),

                          /*  suffixIcon: InkWell(
                    child: Icon(Icons.search),
                  ),*/
                        ),
                        onChanged: (value) {
                          StoreCubit.get(context).searchStore(
                              StoreCubit.get(context).searchController.text);
                        },

                        /*
                      child: TextFormField(
                        controller: StoreCubit.get(context).searchController,
                        decoration: const InputDecoration(
                            labelText: "بحث", border: OutlineInputBorder()),
                        onChanged: (value) {
                          StoreCubit.get(context).searchStore(
                              StoreCubit.get(context).searchController.text);
                        },
                      ),*/
                      ),
                    ),
                  ),
                  StoreCubit.get(context).searchController.text.isEmpty
                      ? Expanded(
                          child: GridView(
                            padding: const EdgeInsets.all(10),
                            //gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,),
                            gridDelegate:
                                const SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent: 150,
                              childAspectRatio: 7 / 8,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                            ),

                            children: category
                                .map(
                                  (categoryData) => CategoryItem(
                                      categoryData.id,
                                      categoryData.name,
                                      categoryData.image),
                                )
                                .toList(),
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            itemBuilder: (ctx, index) {
                              // ignore: deprecated_member_use_from_same_package
                              final storeDate = searchedData
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
          );
        },
      ),
    );
  }
}
*/




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtjry/screens/category/cubit/category_cubit.dart';
import 'package:mtjry/screens/store_screen/cubit/store_cubit.dart';
import '../../widgets/category_item.dart';
import '../../widgets/store_item.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    super.initState();
    StoreCubit.get(context).scrollController.addListener(_scrollListener);
    CategoryCubit.get(context).getCategoryData();
    StoreCubit.get(context).getStoreData();
    StoreCubit.get(context).getCouponData();
    StoreCubit.get(context).getUserData();
  }

  void _scrollListener() {
    FocusScope.of(context).unfocus();
  }

  @override
  void dispose() {
    StoreCubit.get(context).scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storeCubit = StoreCubit.get(context);

    return Scaffold(
      appBar: AppBar(
        title: storeCubit.searchController.text.isEmpty
            ? null
            : const Text('نتائج البحث'),
        leading: storeCubit.searchController.text.isNotEmpty
            ? IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            storeCubit.searchFocusNode.unfocus();
            storeCubit.searchController.clear();
            storeCubit.clearSearch();
            setState(() {});
          },
        )
            : null,
      ),
      body: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CategoryLoading || storeCubit.researchedData == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorOccurred) {
            return const Text("حدث خطأ");
          }

          return BlocConsumer<CategoryCubit, CategoryState>(
            listener: (context, state) {},
            builder: (context, state) {
              final categoryCubit = CategoryCubit.get(context);
              final category = categoryCubit.categoryData;

              if (state is CategoryLoading || category == null) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ErrorOccurred) {
                return const Text("حدث خطأ");
              }

              List filterdSearchedCoupon = [];
              for (var storeElement in storeCubit.researchedData!) {
                filterdSearchedCoupon.addAll(
                    storeCubit.couponData.where(
                            (element) => element.store == storeElement.id
                    )
                );
              }

              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: 500,
                      height: 45,
                      child: TextField(
                        focusNode: storeCubit.searchFocusNode,
                        controller: storeCubit.searchController,
                        autofocus: false,

                        decoration: InputDecoration(

                          labelText: "بحث",
                          labelStyle: TextStyle(
              fontFamily: 'ElMessiri',
              ),
                          prefixIcon: const Icon(Icons.search, color: Color.fromRGBO(63, 81, 181, 1),),
                          suffixIcon: _buildClearButton(storeCubit),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.5),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.5),
                            borderSide: const BorderSide(color: Colors.blue),
                          ),
                        ),
                        onChanged: (value) {
                          storeCubit.searchStore(value);
                          setState(() {});
                        },
                        onTap: () => setState(() {}),
                      ),
                    ),
                  ),
                  Expanded(
                    child: storeCubit.searchController.text.isEmpty
                        ? _buildCategoriesGrid(category) // إصلاح هنا
                        : _buildSearchResults(filterdSearchedCoupon, storeCubit),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildCategoriesGrid(List<dynamic> category) {
    return GridView(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 150,
        childAspectRatio: 7 / 8,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),
      children: category
          .map((categoryData) => CategoryItem(
        categoryData.id,
        categoryData.name,
        categoryData.image,
      ))
          .toList(),
    );
  }

  Widget _buildSearchResults(List results, StoreCubit storeCubit) {
    return results.isEmpty
        ? const Center(child: Text('لا يوجد نتائج',style: TextStyle(
      fontFamily: 'ElMessiri',
    ),))
        : ListView.builder(
      controller: storeCubit.scrollController,
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      itemCount: results.length,
      itemBuilder: (ctx, index) {
        final storeDate = storeCubit.researchedData!.firstWhere(
              (element) => element.id == results[index].store,
        );
        return StoreItem(
          title: storeDate.name,
          imageUrl: storeDate.image,
          id: results[index].id,
          SiteUrl: results[index].url,
          copoun: results[index].coupon,
          Specialization: results[index].description,
          discount: results[index].discount,
        );
      },
    );
  }

  Widget? _buildClearButton(StoreCubit storeCubit) {
    if (storeCubit.searchFocusNode.hasFocus ||
        storeCubit.searchController.text.isNotEmpty) {
      return IconButton(
        icon: const Icon(Icons.close, color: Colors.grey),
        onPressed: () {
          storeCubit.searchController.clear();
          storeCubit.searchFocusNode.unfocus();
          storeCubit.clearSearch();
          setState(() {});
        },
      );
    }
    return null;
  }
}


