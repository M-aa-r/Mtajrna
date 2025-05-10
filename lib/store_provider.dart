//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mtjry/models/store.dart';
import 'package:flutter/cupertino.dart';

class ProductsProvider with ChangeNotifier {
  static List<Store> _productsList = [];

  List<Store> get getProducts {
    return _productsList;
  }
/*
  List<Store> get getOnSaleProducts {
    return _productsList.where((element) => element.isOnSale).toList();
  }*/

  /* Future<void> fetchProducts() async {
    await FirebaseFirestore.instance
        .collection('stores')
        .get()
        .then((QuerySnapshot productSnapshot) {
      _productsList = [];
      // _productsList.clear();
      for (var element in productSnapshot.docs) {
        _productsList.insert(
            0,
            Store(
              id: element.get('id'),
              title: element.get('title'),
              imageUrl: element.get('imageUrl'),
              Specialization: element.get('Specialization'),
              categories: element.get('categories'),
              discount: element.get('discount'),
              SiteUrl: element.get('SiteUrl'),
              copoun: element.get('copoun'),

              // price: double.parse(
              // element.get('price'),
              //),
              // salePrice: element.get('salePrice'),
              // isOnSale: element.get('isOnSale'),
            ));
      }
    });
    notifyListeners();
  }*/

  Store findProdById(String productId) {
    return _productsList.firstWhere((element) => element.id == productId);
  }

  List<Store> findByCategory(String categoryName) {
    List<Store> categoryList = _productsList
        .where((element) => element.categories
            // .toLowerCase()
            .contains(categoryName.toLowerCase()))
        .toList();
    return categoryList;
  }

/*  List<Store> searchQuery(String searchText) {
    List<Store> searchList = _productsList
        .where(
          (element) => element.title.toLowerCase().contains(
                searchText.toLowerCase(),
              ),
        )
        .toList();
    return searchList;
  }*/
}
