// To parse this JSON data, do
//
//     final blogDetailsModel = blogDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BlogDetailsModel blogDetailsModelFromJson(String str) => BlogDetailsModel.fromJson(json.decode(str));

String blogDetailsModelToJson(BlogDetailsModel data) => json.encode(data.toJson());

class BlogDetailsModel {
  BlogDetailsModel({
    required this.data,
  });

  Data data;

  factory BlogDetailsModel.fromJson(Map<String, dynamic> json) => BlogDetailsModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.title,
    required this.slug,
    required this.author,
    required this.shortDescription,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  int id;
  String title;
  String slug;
  dynamic author;
  String shortDescription;
  String description;
  String imageUrl;
  DateTime createdAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    author: json["author"],
    shortDescription: json["short_description"],
    description: json["description"],
    imageUrl: json["image_url"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "author": author,
    "short_description": shortDescription,
    "description": description,
    "image_url": imageUrl,
    "created_at": createdAt.toIso8601String(),
  };
}
