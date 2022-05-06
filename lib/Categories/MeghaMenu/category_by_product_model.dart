// To parse this JSON data, do
//
//     final productByCategoryModel = productByCategoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<ProductByCategoryModel> productByCategoryModelFromJson(String str) => List<ProductByCategoryModel>.from(json.decode(str).map((x) => ProductByCategoryModel.fromJson(x)));

String productByCategoryModelToJson(List<ProductByCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductByCategoryModel {
  ProductByCategoryModel({
    required this.id,
    required this.subcategoryId,
    required this.name,
    required this.slug,
    required this.imageUrl,
    required this.isFeatured,
  });

  int id;
  int subcategoryId;
  String name;
  String slug;
  String imageUrl;
  int isFeatured;

  factory ProductByCategoryModel.fromJson(Map<String, dynamic> json) => ProductByCategoryModel(
    id: json["id"],
    subcategoryId: json["subcategory_id"],
    name: json["name"],
    slug: json["slug"],
    imageUrl: json["image_url"],
    isFeatured: json["is_featured"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "subcategory_id": subcategoryId,
    "name": name,
    "slug": slug,
    "image_url": imageUrl,
    "is_featured": isFeatured,
  };
}
