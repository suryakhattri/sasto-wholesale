// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProfileModel profileModelFromJson(String str) => ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    required this.data,
  });

  Data data;

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNum,
    required this.birthday,
    required this.gender,
    required this.imageUrl,
    required this.imageUrlThumbnail,
    required this.address,
  });

  int id;
  String name;
  String email;
  String phoneNum;
  String birthday;
  String gender;
  String imageUrl;
  String imageUrlThumbnail;
  Address address;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneNum: json["phone_num"],
    birthday: json["birthday"],
    gender: json["gender"],
    imageUrl: json["image_url"],
    imageUrlThumbnail: json["image_url_thumbnail"],
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone_num": phoneNum,
    "birthday": birthday,
    "gender": gender,
    "image_url": imageUrl,
    "image_url_thumbnail": imageUrlThumbnail,
    "address": address.toJson(),
  };
}

class Address {
  Address();

  factory Address.fromJson(Map<String, dynamic> json) => Address(
  );

  Map<String, dynamic> toJson() => {
  };
}
