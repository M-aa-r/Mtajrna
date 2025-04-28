//import 'package:flutter/material.dart';

class Category {
  final String id;
  final String name;
  final String image;

  const Category({required this.id, required this.name, required this.image});

  factory Category.fromJson(Map<String, dynamic> json,id) {
    return Category(
      id: id,
      name: json["name"],
      image: json["image"],
    );
  }
//
}
