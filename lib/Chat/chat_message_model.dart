// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

MessageModel messageModelFromJson(String str) =>
    MessageModel.fromJson(json.decode(str));

String messageModelToJson(MessageModel data) => json.encode(data.toJson());

class MessageModel {
  MessageModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        links: Links.fromJson(json["links"]),
        meta: Meta.fromJson(json["meta"]),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "links": links.toJson(),
        "meta": meta.toJson(),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.chatRoomId,
    required this.senderId,
    required this.readAt,
    required this.key,
    required this.createdAt,
    required this.type,
    required this.message,
    required this.product,
    required this.fileUrl,
    required this.isImage,
  });

  int id;
  String chatRoomId;
  int senderId;
  dynamic readAt;
  String key;
  DateTime createdAt;
  String type;
  String message;
  Product product;
  String fileUrl;
  bool isImage;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        chatRoomId: json["chat_room_id"],
        senderId: json["sender_id"],
        readAt: json["read_at"],
        key: json["key"] == null ? null : json["key"],
        createdAt: DateTime.parse(json["created_at"]),
        type: json["type"] == null ? null : json["type"],
        message: json["message"],
        product: Product.fromJson(json["product"]),
        fileUrl: json["file_url"] == null ? null : json["file_url"],
        isImage: json["is_image"] == null ? null : json["is_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "chat_room_id": chatRoomId,
        "sender_id": senderId,
        "read_at": readAt,
        "key": key == null ? null : key,
        "created_at": createdAt.toIso8601String(),
        "type": type == null ? null : type,
        "message": message,
        "product": product == null ? null : product.toJson(),
        "file_url": fileUrl == null ? null : fileUrl,
        "is_image": isImage == null ? null : isImage,
      };
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.slug,
    required this.productCategoryId,
    required this.price,
    required this.unit,
    required this.shippingCharge,
    required this.moq,
    required this.image,
    required this.imageUrl,
    required this.imageUrlThumbnail,
    required this.status,
    required this.productType,
    required this.type,
    required this.userId,
    required this.vendorId,
    required this.priceRange,
    required this.minOrder,
  });

  int id;
  String title;
  String slug;
  int productCategoryId;
  dynamic price;
  String unit;
  int shippingCharge;
  dynamic moq;
  String image;
  String imageUrl;
  String imageUrlThumbnail;
  bool status;
  dynamic productType;
  dynamic type;
  int userId;
  int vendorId;
  String priceRange;
  String minOrder;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        slug: json["slug"],
        productCategoryId: json["product_category_id"],
        price: json["price"],
        unit: json["unit"],
        shippingCharge: json["shipping_charge"],
        moq: json["moq"],
        image: json["image"],
        imageUrl: json["image_url"],
        imageUrlThumbnail: json["image_url_thumbnail"],
        status: json["status"],
        productType: json["product_type"],
        type: json["type"],
        userId: json["user_id"],
        vendorId: json["vendor_id"],
        priceRange: json["price_range"],
        minOrder: json["min_order"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "slug": slug,
        "product_category_id": productCategoryId,
        "price": price,
        "unit": unit,
        "shipping_charge": shippingCharge,
        "moq": moq,
        "image": image,
        "image_url": imageUrl,
        "image_url_thumbnail": imageUrlThumbnail,
        "status": status,
        "product_type": productType,
        "type": type,
        "user_id": userId,
        "vendor_id": vendorId,
        "price_range": priceRange,
        "min_order": minOrder,
      };
}

class Links {
  Links({
    required this.first,
    required this.last,
    required this.prev,
    required this.next,
  });

  dynamic first;
  dynamic last;
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
    required this.path,
    required this.perPage,
  });

  String path;
  int perPage;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        path: json["path"],
        perPage: json["per_page"],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "per_page": perPage,
      };
}
