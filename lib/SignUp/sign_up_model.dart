// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  SignUpModel({
    required this.message,
    required this.user,
  });

  String message;
  User user;

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    message: json["message"],
    user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "user": user.toJson(),
  };
}

class User {
  User({
    required this.publish,
    required this.username,
    required this.activationLink,
    required this.otp,
    required this.name,
    required this.email,
    required this.phoneNum,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  int publish;
  String username;
  String activationLink;
  int otp;
  String name;
  String email;
  String phoneNum;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory User.fromJson(Map<String, dynamic> json) => User(
    publish: json["publish"],
    username: json["username"],
    activationLink: json["activation_link"],
    otp: json["otp"],
    name: json["name"],
    email: json["email"],
    phoneNum: json["phone_num"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "publish": publish,
    "username": username,
    "activation_link": activationLink,
    "otp": otp,
    "name": name,
    "email": email,
    "phone_num": phoneNum,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
