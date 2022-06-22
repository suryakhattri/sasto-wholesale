// To parse this JSON data, do
//
//     final chatRoomModel = chatRoomModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ChatRoomModel chatRoomModelFromJson(String str) => ChatRoomModel.fromJson(json.decode(str));

String chatRoomModelToJson(ChatRoomModel data) => json.encode(data.toJson());

class ChatRoomModel {
  ChatRoomModel({
    required this.ts,
    required this.data,
  });

  String ts;
  ChatRoomData data;

  factory ChatRoomModel.fromJson(Map<String, dynamic> json) => ChatRoomModel(
    ts: json["ts"],
    data: ChatRoomData.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "ts": ts,
    "data": data.toJson(),
  };
}

class ChatRoomData {
  ChatRoomData({
    required this.id,
    required this.chatRoomId,
    required this.senderId,
    required this.readAt,
    required this.key,
    required this.createdAt,
    required this.type,
    required this.message,
  });

  int id;
  String chatRoomId;
  int senderId;
  String readAt;
  String key;
  String createdAt;
  String type;
  String message;

  factory ChatRoomData.fromJson(Map<String, dynamic> json) => ChatRoomData(
    id: json["id"],
    chatRoomId: json["chat_room_id"],
    senderId: json["sender_id"],
    readAt: json["read_at"],
    key: json["key"],
    createdAt: json["created_at"],
    type: json["type"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "chat_room_id": chatRoomId,
    "sender_id": senderId,
    "read_at": readAt,
    "key": key,
    "created_at": createdAt,
    "type": type,
    "message": message,
  };
}
