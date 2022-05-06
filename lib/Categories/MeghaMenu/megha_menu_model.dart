import 'package:meta/meta.dart';
import 'dart:convert';

class CategoryListModel {
  final String title;
  CategoryListModel({required this.title});
}

// To parse this JSON data, do
//
//     final meghaMenuModel = meghaMenuModelFromJson(jsonString);

List<MeghaMenuModel> meghaMenuModelFromJson(String str) => List<MeghaMenuModel>.from(json.decode(str).map((x) => MeghaMenuModel.fromJson(x)));

String meghaMenuModelToJson(List<MeghaMenuModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MeghaMenuModel {
  MeghaMenuModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageUrl,
    required this.isFeatured,
    required this.subcategory,
  });

  int id;
  String name;
  String slug;
  String imageUrl;
  dynamic isFeatured;
  List<Subcategory> subcategory;

  factory MeghaMenuModel.fromJson(Map<String, dynamic> json) => MeghaMenuModel(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    imageUrl: json["image_url"],
    isFeatured: json["is_featured"],
    subcategory: List<Subcategory>.from(json["subcategory"].map((x) => Subcategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image_url": imageUrl,
    "is_featured": isFeatured,
    "subcategory": List<dynamic>.from(subcategory.map((x) => x.toJson())),
  };
}

class Subcategory {
  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.categoryId,
    required this.image,
    required this.productCategory,
  });

  int id;
  String name;
  String slug;
  int categoryId;
  String image;
  List<ProductCategory> productCategory;

  factory Subcategory.fromJson(Map<String, dynamic> json) => Subcategory(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    categoryId: json["category_id"],
    image: json["image"] == null ? null : json["image"],
    productCategory: List<ProductCategory>.from(json["product_category"].map((x) => ProductCategory.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "category_id": categoryId,
    "image": image == null ? null : image,
    "product_category": List<dynamic>.from(productCategory.map((x) => x.toJson())),
  };
}

class ProductCategory {
  ProductCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.subcategoryId,
    required this.image,
  });

  int id;
  String name;
  String slug;
  int subcategoryId;
  dynamic image;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    subcategoryId: json["subcategory_id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "subcategory_id": subcategoryId,
    "image": image,
  };
}
