// To parse this JSON data, do
//
//     final chatDetailsModel = chatDetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class ChatDetailsModel {
  ChatDetailsModel({
    required this.data,
  });

  Data data;

  factory ChatDetailsModel.fromRawJson(String str) => ChatDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatDetailsModel.fromJson(Map<String, dynamic> json) => ChatDetailsModel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    required this.id,
    required this.customerUserId,
    required this.vendorUserId,
    required this.lastMessageAt,
    required this.updatedAt,
    required this.opponent,
    required this.hasUnseenMessages,
    required this.lastMessageId,
  });

  String id;
  int customerUserId;
  int vendorUserId;
  String lastMessageAt;
  DateTime updatedAt;
  Opponent opponent;
  bool hasUnseenMessages;
  int lastMessageId;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    customerUserId: json["customer_user_id"],
    vendorUserId: json["vendor_user_id"],
    lastMessageAt: json["last_message_at"],
    updatedAt: DateTime.parse(json["updated_at"]),
    opponent: Opponent.fromJson(json["opponent"]),
    hasUnseenMessages: json["has_unseen_messages"],
    lastMessageId: json["last_message_id"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_user_id": customerUserId,
    "vendor_user_id": vendorUserId,
    "last_message_at": lastMessageAt,
    "updated_at": updatedAt.toIso8601String(),
    "opponent": opponent.toJson(),
    "has_unseen_messages": hasUnseenMessages,
    "last_message_id": lastMessageId,
  };
}

class Opponent {
  Opponent({
    required this.id,
    required this.name,
    required this.avatarUrl,
  });

  int id;
  String name;
  String avatarUrl;

  factory Opponent.fromRawJson(String str) => Opponent.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Opponent.fromJson(Map<String, dynamic> json) => Opponent(
    id: json["id"],
    name: json["name"],
    avatarUrl: json["avatar_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "avatar_url": avatarUrl,
  };
}
