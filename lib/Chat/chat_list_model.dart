import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

// class ChatUsers{
//   String name;
//   String messageText;
//   String imageURL;
//   String time;
//   ChatUsers({required this.name,required this.messageText,required this.imageURL,required this.time});
// }
//
// class ChatMessage{
//   String messageContent;
//   String messageType;
//   ChatMessage({required this.messageContent, required this.messageType});
// }


// To parse this JSON data, do
//
//     final chatListModel = chatListModelFromJson(jsonString);

ChatListModel chatListModelFromJson(String str) => ChatListModel.fromJson(json.decode(str));

String chatListModelToJson(ChatListModel data) => json.encode(data.toJson());

class ChatListModel {
  ChatListModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<ChatData> data;
  Links links;
  Meta meta;

  factory ChatListModel.fromJson(Map<String, dynamic> json) => ChatListModel(
    data: List<ChatData>.from(json["data"].map((x) => ChatData.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

ChatData testFromJson(String str) => ChatData.fromJson(json.decode(str));
String testToJson(ChatData data) => json.encode(data.toJson());

class ChatData {
  ChatData({
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
  dynamic hasUnseenMessages;
  dynamic lastMessageId;

  factory ChatData.fromJson(Map<String, dynamic> json) => ChatData(
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

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  String first;
  String last;
  dynamic prev;
  dynamic next;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    first: json["first"],
    last: json["last"],
    prev: json["prev"],
    next: json["next"],
  );

  Map<String, dynamic> toJson() => {
    "first": first,
    "last": last,
    "prev": prev,
    "next": next,
  };
}

class Meta {
  Meta({
    required this.currentPage,
    required this.from,
    required this.lastPage,
    required this.links,
    required this.path,
    required this.perPage,
    required this.to,
    required this.total,
  });

  int currentPage;
  int from;
  int lastPage;
  List<Link> links;
  String path;
  int perPage;
  int to;
  int total;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    currentPage: json["current_page"],
    from: json["from"],
    lastPage: json["last_page"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    path: json["path"],
    perPage: json["per_page"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "from": from,
    "last_page": lastPage,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "path": path,
    "per_page": perPage,
    "to": to,
    "total": total,
  };
}

class Link {
  Link({
    required this.url,
    required this.label,
    required this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}
