// To parse this JSON data, do
//
//     final blogDetailsModel = blogDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

PartnerListModel blogDetailsModelFromJson(String str) => PartnerListModel.fromJson(json.decode(str));

String partnerListModelModelToJson(PartnerListModel data) => json.encode(data.toJson());

class PartnerListModel {
  PartnerListModel({
    required this.data,
  });

  List<Datum> data;

  factory PartnerListModel.fromJson(Map<String, dynamic> json) => PartnerListModel(
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
    required this.partners,
  });

  int id;
  String name;
  List<Partner> partners;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    partners: List<Partner>.from(json["partners"].map((x) => Partner.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "partners": List<dynamic>.from(partners.map((x) => x.toJson())),
  };
}

class Partner {
  Partner({
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

  factory Partner.fromJson(Map<String, dynamic> json) => Partner(
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
