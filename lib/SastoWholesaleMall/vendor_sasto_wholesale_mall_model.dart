import 'package:meta/meta.dart';
import 'dart:convert';

VendorModel vendorModelFromJson(String str) => VendorModel.fromJson(json.decode(str));

String vendorModelToJson(VendorModel data) => json.encode(data.toJson());

class VendorModel {
  VendorModel({
    required this.data,
  });

  Data data;

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.userId,
    required this.category,
    required this.businessType,
    required this.plan,
    required this.shopName,
    required this.companyName,
    required this.image,
    required this.imageUrl,
    required this.imageUrlThumbnail,
    required this.description,
    required this.createdAt,
    required this.user,
    required this.shippingInfo,
  });

  int id;
  int userId;
  String category;
  String businessType;
  String plan;
  String shopName;
  dynamic companyName;
  String image;
  String imageUrl;
  String imageUrlThumbnail;
  dynamic description;
  DateTime createdAt;
  User user;
  dynamic shippingInfo;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    userId: json["user_id"],
    category: json["category"],
    businessType: json["business_type"],
    plan: json["plan"],
    shopName: json["shop_name"],
    companyName: json["company_name"],
    image: json["image"],
    imageUrl: json["image_url"],
    imageUrlThumbnail: json["image_url_thumbnail"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    user: User.fromJson(json["user"]),
    shippingInfo: json["shipping_info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category": category,
    "business_type": businessType,
    "plan": plan,
    "shop_name": shopName,
    "company_name": companyName,
    "image": image,
    "image_url": imageUrl,
    "image_url_thumbnail": imageUrlThumbnail,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "user": user.toJson(),
    "shipping_info": shippingInfo,
  };
}

class User {
  User({
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
  dynamic birthday;
  dynamic gender;
  String imageUrl;
  String imageUrlThumbnail;
  Address address;

  factory User.fromJson(Map<String, dynamic> json) => User(
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
