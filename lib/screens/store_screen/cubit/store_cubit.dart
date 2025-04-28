/*import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mtjry/models/coupon.dart';
import 'package:mtjry/models/store.dart';

import '../../../models/user_model.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  static StoreCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  List<Store> storeData = [];

  Future getStoreData() async {
    storeData = [];
    emit(StoreLoading());
    try {
      var dataList = await FirebaseFirestore.instance
          .collection('stores')
          .orderBy("isPopular", descending: true)
          .get();
      dataList.docs.forEach((element) {
        log(element.data().toString());
        storeData.add(Store.fromJson(element.data(), element.id));
      });
      emit(StoreSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  List<Store>? researchedData = [];

  searchStore(String searchText) {
    researchedData =
        storeData.where((data) => data.name.startsWith(searchText)).toList();
    emit(SearchStoreSuccess());
  }

  List<Coupon> couponData = [];

  Future getCouponData() async {
    couponData = [];
    emit(StoreLoading());
    try {
      var dataList =
          await FirebaseFirestore.instance.collection('coupons').get();
      dataList.docs.forEach((element) {
        log(element.data().toString());
        couponData.add(Coupon.fromJson(element.data(), element.id));
      });
      emit(StoreSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  UserModel? userData;

  Future getUserData() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .get();
      log('+++++++++++++++++++++++++++++');
      log(response.toString());
      userData = UserModel.fromJson(response.data()!);
      favoriteSelected = userData!.favorite;
      log('+++++++++++++++++++++++++++++');
      emit(UserDataSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  bool isFavorite(String storeId) {
    return favoriteSelected.contains(storeId);
  }

  List favoriteSelected = [];

  addFavorite(String id) async {
    try {
      favoriteSelected.add(id);
      emit(FavoritesLoading());
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "favorite": favoriteSelected,
      });
      emit(FavoriteSelected());
    } on Exception catch (e) {
      favoriteSelected.remove(id);
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  removeFavorite(String id) async {
    try {
      favoriteSelected.remove(id);
      emit(FavoritesLoading());
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "favorite": favoriteSelected,
      });
      emit(FavoriteSelected());
    } on Exception catch (e) {
      favoriteSelected.add(id);
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  void clearSearch() {}
}
*/
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // تأكد من استيراد هذه المكتبة
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:mtjry/models/coupon.dart';
import 'package:mtjry/models/store.dart';
import '../../../models/user_model.dart';

part 'store_state.dart';

class StoreCubit extends Cubit<StoreState> {
  StoreCubit() : super(StoreInitial());

  static StoreCubit get(context) => BlocProvider.of(context);
  TextEditingController searchController = TextEditingController();
  FocusNode searchFocusNode = FocusNode(); // <-- التعديل: إضافة FocusNode
  ScrollController scrollController = ScrollController(); // <-- التعديل: إضافة ScrollController
  List<Store> storeData = [];

  Future getStoreData() async {
    storeData = [];
    emit(StoreLoading());
    try {
      var dataList = await FirebaseFirestore.instance
          .collection('stores')
          .orderBy("isPopular", descending: true)
          .get();
      dataList.docs.forEach((element) {
        log(element.data().toString());
        storeData.add(Store.fromJson(element.data(), element.id));
      });
      emit(StoreSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  List<Store>? researchedData = [];

  searchStore(String searchText) {
    researchedData = storeData
        .where((data) => data.name.toLowerCase().startsWith(searchText.toLowerCase()))
        .toList();
    emit(SearchStoreSuccess());
  }

  List<Coupon> couponData = [];

  Future getCouponData() async {
    couponData = [];
    emit(StoreLoading());
    try {
      var dataList =
      await FirebaseFirestore.instance.collection('coupons').get();
      dataList.docs.forEach((element) {
        log(element.data().toString());
        couponData.add(Coupon.fromJson(element.data(), element.id));
      });
      emit(StoreSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  UserModel? userData;

  Future getUserData() async {
    try {
      var response = await FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser?.uid ?? '')
          .get();
      log('+++++++++++++++++++++++++++++');
      log(response.toString());
      userData = UserModel.fromJson(response.data()!);
      favoriteSelected = userData!.favorite;
      log('+++++++++++++++++++++++++++++');
      emit(UserDataSuccess());
    } on Exception catch (e) {
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  bool isFavorite(String storeId) {
    return favoriteSelected.contains(storeId);
  }

  List favoriteSelected = [];

  addFavorite(String id) async {
    try {
      favoriteSelected.add(id);
      emit(FavoritesLoading());
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "favorite": favoriteSelected,
      });
      emit(FavoriteSelected());
    } on Exception catch (e) {
      favoriteSelected.remove(id);
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  removeFavorite(String id) async {
    try {
      favoriteSelected.remove(id);
      emit(FavoritesLoading());
      await FirebaseFirestore.instance
          .collection("user")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        "favorite": favoriteSelected,
      });
      emit(FavoriteSelected());
    } on Exception catch (e) {
      favoriteSelected.add(id);
      print(e.toString());
      emit(ErrorOccurred(error: e.toString()));
    }
  }

  void clearSearch() {
    searchController.clear();
    researchedData = [];
    emit(SearchStoreSuccess());
  }
}





