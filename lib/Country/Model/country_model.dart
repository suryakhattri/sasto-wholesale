// To parse this JSON data, do
//
//     final countryModel = countryModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CountryModel countryModelFromJson(String str) => CountryModel.fromJson(json.decode(str));

String countryModelToJson(CountryModel data) => json.encode(data.toJson());

class CountryModel {
  CountryModel({
    required this.data,
  });

  List<Datum> data;

  factory CountryModel.fromJson(Map<String, dynamic> json) => CountryModel(
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
    required this.flagUrl,
    required this.publish,
  });

  int id;
  String name;
  String slug;
  String path;
  String flagUrl;
  int publish;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    path: json["path"],
    flagUrl: json["flag_url"],
    publish: json["publish"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "path": path,
    "flag_url": flagUrl,
    "publish": publish,
  };
}
