import 'package:flutter/material.dart';
import 'package:sasto_wholesale/DBHelper/db_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartModel {
  late final int? id;
  final String? name;
  final String? imageUrl;
  final String? price;
  final int? quantity;
  final String? totalPrice;
  final String? shippingCharge;
  final String? vendorId;

  CartModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.quantity,
    required this.totalPrice,
    required this.shippingCharge,
    required this.vendorId,
  });

  CartModel.fromMap(Map<dynamic, dynamic> res)
      : id = res['id'],
        name = res['name'],
        imageUrl = res['imageUrl'],
        price = res['price'],
        quantity = res['quantity'],
        totalPrice = res['totalPrice'],
        shippingCharge = res['shippingCharge'],
        vendorId = res['vendorId'];

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'totalPrice': totalPrice,
      'shippingCharge': shippingCharge,
      'vendorId': vendorId,
    };
  }
}
