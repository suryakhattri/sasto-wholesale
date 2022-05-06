
// To parse this JSON data, do
//
//     final hotCategory = hotCategoryFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<HotCategory> hotCategoryFromJson(String str) => List<HotCategory>.from(json.decode(str).map((x) => HotCategory.fromJson(x)));

String hotCategoryToJson(List<HotCategory> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HotCategory {
  HotCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.imageUrl,
    required this.isFeatured,
  });

  int id;
  String name;
  String slug;
  String imageUrl;
  bool isFeatured;

  factory HotCategory.fromJson(Map<String, dynamic> json) => HotCategory(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    imageUrl: json["image_url"],
    isFeatured: json["is_featured"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image_url": imageUrl,
    "is_featured": isFeatured,
  };
}
