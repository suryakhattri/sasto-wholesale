import 'package:meta/meta.dart';
import 'dart:convert';

class WholesaleMarketItems {
  final String name;
  final String url;
  final String description;
  final double price;

  WholesaleMarketItems({required this.name, required this.url, required this.description, required this.price});
}


// To parse this JSON data, do
//
//     final latestSuppliers = latestSuppliersFromJson(jsonString);


List<LatestSuppliers> latestSuppliersFromJson(String str) => List<LatestSuppliers>.from(json.decode(str).map((x) => LatestSuppliers.fromJson(x)));

String latestSuppliersToJson(List<LatestSuppliers> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LatestSuppliers {
  LatestSuppliers({
    required this.id,
    required this.shopName,
    required this.imageUrl,
  });

  int id;
  String shopName;
  String imageUrl;

  factory LatestSuppliers.fromJson(Map<String, dynamic> json) => LatestSuppliers(
    id: json["id"],
    shopName: json["shop_name"],
    imageUrl: json["image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "shop_name": shopName,
    "image_url": imageUrl,
  };
}
