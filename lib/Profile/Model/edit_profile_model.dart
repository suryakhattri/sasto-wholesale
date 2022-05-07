// To parse this JSON data, do
//
//     final editProfileModel = editProfileModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

EditProfileModel editProfileModelFromJson(String str) => EditProfileModel.fromJson(json.decode(str));

String editProfileModelToJson(EditProfileModel data) => json.encode(data.toJson());

class EditProfileModel {
  EditProfileModel({
    required this.message,
    required this.data,
  });

  String message;
  Data data;

  factory EditProfileModel.fromJson(Map<String, dynamic> json) => EditProfileModel(
    message: json["message"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.phoneNum,
    required this.image,
    required this.designation,
    required this.activationLink,
    required this.otp,
    required this.accessLevel,
    required this.publish,
    required this.isActive,
    required this.verified,
    required this.vendorType,
    required this.rememberPassword,
    required this.termsCondition,
    required this.username,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.birthday,
    required this.string,
    required this.gender,
    required this.oauthId,
    required this.oauthType,
    required this.avatar,
    required this.roles,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String phoneNum;
  String image;
  dynamic designation;
  String activationLink;
  dynamic otp;
  dynamic accessLevel;
  int publish;
  int isActive;
  int verified;
  String vendorType;
  int rememberPassword;
  int termsCondition;
  String username;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic birthday;
  dynamic string;
  String gender;
  dynamic oauthId;
  dynamic oauthType;
  dynamic avatar;
  List<Role> roles;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phoneNum: json["phone_num"],
    image: json["image"],
    designation: json["designation"],
    activationLink: json["activation_link"],
    otp: json["otp"],
    accessLevel: json["access_level"],
    publish: json["publish"],
    isActive: json["is_active"],
    verified: json["verified"],
    vendorType: json["vendor_type"],
    rememberPassword: json["remember_password"],
    termsCondition: json["terms_condition"],
    username: json["username"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    birthday: json["birthday"],
    string: json["string"],
    gender: json["gender"],
    oauthId: json["oauth_id"],
    oauthType: json["oauth_type"],
    avatar: json["avatar"],
    roles: List<Role>.from(json["roles"].map((x) => Role.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone_num": phoneNum,
    "image": image,
    "designation": designation,
    "activation_link": activationLink,
    "otp": otp,
    "access_level": accessLevel,
    "publish": publish,
    "is_active": isActive,
    "verified": verified,
    "vendor_type": vendorType,
    "remember_password": rememberPassword,
    "terms_condition": termsCondition,
    "username": username,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "birthday": birthday,
    "string": string,
    "gender": gender,
    "oauth_id": oauthId,
    "oauth_type": oauthType,
    "avatar": avatar,
    "roles": List<dynamic>.from(roles.map((x) => x.toJson())),
  };
}

class Role {
  Role({
    required this.id,
    required this.name,
    required this.slug,
    required this.publish,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String name;
  String slug;
  int publish;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    publish: json["publish"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "publish": publish,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    required this.userId,
    required this.roleId,
  });

  int userId;
  int roleId;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    userId: json["user_id"],
    roleId: json["role_id"],
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "role_id": roleId,
  };
}
