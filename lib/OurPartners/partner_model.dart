// To parse this JSON data, do
//
//     final partnersModel = partnersModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PartnersModel partnersModelFromJson(String str) => PartnersModel.fromJson(json.decode(str));

String partnersModelToJson(PartnersModel data) => json.encode(data.toJson());

class PartnersModel {
  PartnersModel({
    required this.data,
  });

  List<Datum> data;

  factory PartnersModel.fromJson(Map<String, dynamic> json) => PartnersModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.slug,
    required this.path,
    required this.imageUrl,
    required this.publish,
  });

  int id;
  String name;
  String slug;
  String path;
  String imageUrl;
  int publish;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    path: json["path"],
    imageUrl: json["image_url"],
    publish: json["publish"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "path": path,
    "image_url": imageUrl,
    "publish": publish,
  };
}
