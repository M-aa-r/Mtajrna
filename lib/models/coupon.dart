//import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Coupon {
  final String id;
  final String coupon;
  final String store;
  final String description;
  final String url;
  final double discount;
  final DateTime date;
  const Coupon({
    required this.id,
    required this.coupon,
    required this.store,
    required this.discount,
    required this.url,
    required this.description,
    required this.date,
  });

  factory Coupon.fromJson(Map<String, dynamic> json,id) {
    Timestamp timestamp =json["date"] as Timestamp;
    final DateTime dateTime = timestamp.toDate();
    return Coupon(
      id: id,
      coupon: json["coupon"],
      store: json["store"],
      description: json["description"],
      url: json["url"],
      discount: double.parse(json["discount"].toString()),
      date: DateTime.parse(dateTime.toString()),
    );
  }
//

//
}
