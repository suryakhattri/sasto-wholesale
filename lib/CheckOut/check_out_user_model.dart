// To parse this JSON data, do
//
//     final checkOutUserModel = checkOutUserModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckOutUserModel checkOutUserModelFromJson(String str) => CheckOutUserModel.fromJson(json.decode(str));

String checkOutUserModelToJson(CheckOutUserModel data) => json.encode(data.toJson());

class CheckOutUserModel {
  CheckOutUserModel({
    required this.data,
  });

  Data data;

  factory CheckOutUserModel.fromJson(Map<String, dynamic> json) => CheckOutUserModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.addressableType,
    required this.addressableId,
    required this.type,
    required this.fullName,
    required this.companyName,
    required this.vat,
    required this.country,
    required this.city,
    required this.streetAddress,
    required this.nearestLandmark,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String addressableType;
  int addressableId;
  dynamic type;
  String fullName;
  String companyName;
  String vat;
  String country;
  String city;
  String streetAddress;
  String nearestLandmark;
  String phone;
  dynamic email;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    addressableType: json["addressable_type"],
    addressableId: json["addressable_id"],
    type: json["type"],
    fullName: json["full_name"],
    companyName: json["company_name"],
    vat: json["vat"],
    country: json["country"],
    city: json["city"],
    streetAddress: json["street_address"],
    nearestLandmark: json["nearest_landmark"],
    phone: json["phone"],
    email: json["email"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "addressable_type": addressableType,
    "addressable_id": addressableId,
    "type": type,
    "full_name": fullName,
    "company_name": companyName,
    "vat": vat,
    "country": country,
    "city": city,
    "street_address": streetAddress,
    "nearest_landmark": nearestLandmark,
    "phone": phone,
    "email": email,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
