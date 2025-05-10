//import 'package:flutter/material.dart';

class Store {
  final String id;
  final List categories;
  final String name;
  final String image;
  final String url;

  const Store({
    required this.id,
    required this.categories,
    required this.name,
    required this.image,
    required this.url,
  });

  factory Store.fromJson(Map<String, dynamic> json, id) {
    return Store(
      id: id,
      categories: List.of(json["category"]).map((i) => i).toList(),
      name: json["name"],
      image: json["image"],
      url: json["url"],
    );
  }
//
}
