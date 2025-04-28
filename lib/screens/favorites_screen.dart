import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtjry/models/coupon.dart';
import 'package:mtjry/screens/store_screen/cubit/store_cubit.dart';
import '../models/store.dart';
import '../widgets/store_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Store> favoriteStores;

  const FavoritesScreen(this.favoriteStores, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    StoreCubit.get(context).getUserData();
    StoreCubit.get(context).getStoreData();
    StoreCubit.get(context).getCouponData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(

      ),*/
      body: BlocConsumer<StoreCubit, StoreState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var store = StoreCubit.get(context).storeData;
          var coupon = StoreCubit.get(context).couponData;
          var user = StoreCubit.get(context).userData;
          if (state is StoreLoading || user == null) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ErrorOccurred) {
            return Center(child: const Text("حدث خطأ"));
          }

          List<Coupon> favoriteCoupon = [];
          for (var item in coupon) {
            if (user.favorite.contains(item.id)) {
              favoriteCoupon.add(item);
            }
          }

          if (favoriteCoupon.isEmpty) {
            return Center(
              child: Text(
                'لايوجد متاجر في المفضلة',
                style: TextStyle(fontSize: 18,
                fontFamily: 'ElMessiri'),
              ),
            );
          }

          return ListView.builder(
            itemBuilder: (ctx, index) {
              final storeDate = store
                  .where((element) => element.id == favoriteCoupon[index].store)
                  .firstOrNull;

              return StoreItem(
                title: storeDate!.name,
                imageUrl: storeDate.image,
                id: favoriteCoupon[index].id,
                SiteUrl: favoriteCoupon[index].url,
                copoun: favoriteCoupon[index].coupon,
                Specialization: favoriteCoupon[index].description,
                discount: favoriteCoupon[index].discount,
              );
            },
            itemCount: favoriteCoupon.length,
          );
        },
      ),
    );
  }
}



























/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtjry/models/coupon.dart';
import 'package:mtjry/screens/store_screen/cubit/store_cubit.dart';

//import 'package:flutter/material.dart';
//import '../widgets/store_item.dart';
import '../models/store.dart';
import '../widgets/store_item.dart';

class FavoritesScreen extends StatefulWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);

  final List<Store> favoriteStores;

  const FavoritesScreen(this.favoriteStores, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    StoreCubit.get(context).getUserData();
    StoreCubit.get(context).getStoreData();
    StoreCubit.get(context).getCouponData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<StoreCubit, StoreState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var store = StoreCubit.get(context).storeData;
        var coupon = StoreCubit.get(context).couponData;
        var user = StoreCubit.get(context).userData;
        if (state is StoreLoading ||
            //   store == null ||
            //    coupon == null ||
            user == null) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ErrorOccurred) {
          return Center(child: const Text("حدث خطأ"));
        }
        List<Coupon> favoriteCoupon = [];

        for (var item in coupon) {
          if (user.favorite.contains(item.id)) {
            favoriteCoupon.add(item);
          }
        }
        print(store.length);
        return ListView.builder(
          itemBuilder: (ctx, index) {
            final storeDate = store
                .where((element) => element.id == favoriteCoupon[index].store)
                .firstOrNull;

            return StoreItem(
              title: storeDate!.name,
              imageUrl: storeDate.image,
              id: favoriteCoupon[index].id,
              SiteUrl: favoriteCoupon[index].url,
              copoun: favoriteCoupon[index].coupon,
              Specialization: favoriteCoupon[index].description,
              discount: favoriteCoupon[index].discount,
            );
          },
          itemCount: favoriteCoupon.length,
        );
      },
    ));
  }
}
*/





















/*

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtjry/models/coupon.dart';
import 'package:mtjry/screens/store_screen/cubit/store_cubit.dart';

//import 'package:flutter/material.dart';
//import '../widgets/store_item.dart';
import '../models/store.dart';
import '../widgets/store_item.dart';

class FavoritesScreen extends StatefulWidget {
  //const FavoritesScreen({Key? key}) : super(key: key);

  final List<Store> favoriteStores;

  const FavoritesScreen(this.favoriteStores, {Key? key}) : super(key: key);

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  void initState() {
    StoreCubit.get(context).getUserData();StoreCubit.get(context).getStoreData();
    StoreCubit.get(context).getCouponData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocConsumer<StoreCubit, StoreState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            var store = StoreCubit.get(context).storeData;
            var coupon = StoreCubit.get(context).couponData;
            var user = StoreCubit.get(context).userData;
            if (state is StoreLoading ||
                //   store == null ||
                //    coupon == null ||
                user == null) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is ErrorOccurred) {
              return Center(child: const Text("حدث خطأ"));
            }
            List<Coupon> favoriteCoupon = [];

            for (var item in coupon) {
              if (user.favorite.contains(item.id)) {
                favoriteCoupon.add(item);}
            }
            print(store.length);
            return ListView.builder(
              itemCount: favoriteCoupon.length,
              itemBuilder: (ctx, index) {
                final storeDate = store.firstWhere(
                      (element) => element.id == favoriteCoupon[index].store,
                  orElse: () => Store( // Return a dummy Store object here
                    id: '',
                    name: '',
                    image: '', categories: [], url: '',
                    // ... initialize other properties as needed
                  ), // Provide a default value if no match is found
                );

                // Check if storeDate is not null before using it
                if (storeDate != null) {
                  return StoreItem(
                    title: storeDate.name,
                    imageUrl: storeDate.image,
                    id: favoriteCoupon[index].id,
                    SiteUrl: favoriteCoupon[index].url,
                    copoun: favoriteCoupon[index].coupon,
                    Specialization: favoriteCoupon[index].description,
                    discount: favoriteCoupon[index].discount,
                  );
                } else {
                  // Handle the case where no matching store is found
                  return Center(
                    child: Text('No store found for this coupon'),
                  );
                }
              },
            );
          },
        ));
  }
}
*/