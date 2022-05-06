// To parse this JSON data, do
//
//     final subCategoryModel = subCategoryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<SubCategoryModel> subCategoryModelFromJson(String str) => List<SubCategoryModel>.from(json.decode(str).map((x) => SubCategoryModel.fromJson(x)));

String subCategoryModelToJson(List<SubCategoryModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryModel {
  SubCategoryModel({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.imageUrl,
    required this.isFeatured,
  });

  int id;
  int categoryId;
  String name;
  String slug;
  String imageUrl;
  bool isFeatured;

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    id: json["id"],
    categoryId: json["category_id"],
    name: json["name"],
    slug: json["slug"],
    imageUrl: json["image_url"],
    isFeatured: json["is_featured"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "category_id": categoryId,
    "name": name,
    "slug": slug,
    "image_url": imageUrl,
    "is_featured": isFeatured,
  };
}
