// To parse this JSON data, do
//
//     final sliderModel = sliderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SliderModel sliderModelFromJson(String str) => SliderModel.fromJson(json.decode(str));

String sliderModelToJson(SliderModel data) => json.encode(data.toJson());

class SliderModel {
  SliderModel({
    required this.data,
  });

  List<SliderData> data;

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    data: List<SliderData>.from(json["data"].map((x) => SliderData.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class SliderData {
  SliderData({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.status,
  });

  int id;
  dynamic title;
  dynamic description;
  String imageUrl;
  String status;

  factory SliderData.fromJson(Map<String, dynamic> json) => SliderData(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    imageUrl: json["image_url"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image_url": imageUrl,
    "status": status,
  };
}
