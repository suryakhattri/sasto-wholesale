// To parse this JSON data, do
//
//     final allBlogModel = allBlogModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BlogListModel allBlogModelFromJson(String str) => BlogListModel.fromJson(json.decode(str));

String blogListModelToJson(BlogListModel data) => json.encode(data.toJson());

class BlogListModel {
  BlogListModel({
    required this.data,
  });

  List<Datum> data;

  factory BlogListModel.fromJson(Map<String, dynamic> json) => BlogListModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.title,
    required this.slug,
    required this.author,
    required this.shortDescription,
    required this.imageUrl,
    required this.createdAt,
  });

  String title;
  String slug;
  dynamic author;
  String shortDescription;
  String imageUrl;
  DateTime createdAt;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    title: json["title"],
    slug: json["slug"],
    author: json["author"],
    shortDescription: json["short_description"],
    imageUrl: json["image_url"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "slug": slug,
    "author": author,
    "short_description": shortDescription,
    "image_url": imageUrl,
    "created_at": createdAt.toIso8601String(),
  };
}
