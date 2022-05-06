// To parse this JSON data, do
//
//     final topProductModel = topProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

TopProductModel topProductModelFromJson(String str) => TopProductModel.fromJson(json.decode(str));

String topProductModelToJson(TopProductModel data) => json.encode(data.toJson());

class TopProductModel {
  TopProductModel({
    required this.data,
  });

  List<Datum> data;

  factory TopProductModel.fromJson(Map<String, dynamic> json) => TopProductModel(
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
    required this.slug,
    required this.productCategoryId,
    required this.offerId,
    required this.brandId,
    required this.price,
    required this.unit,
    required this.shippingCharge,
    required this.discount,
    required this.moq,
    required this.deliveryCharge,
    required this.essential,
    required this.bestSeller,
    required this.image,
    required this.imageUrl,
    required this.imageUrlThumbnail,
    required this.quantity,
    required this.status,
    required this.productType,
    required this.type,
    required this.userId,
    required this.vendorId,
    required this.summary,
    required this.ranges,
    required this.priceRange,
    required this.minOrder,
    required this.overview,
  });

  int id;
  String title;
  String slug;
  int productCategoryId;
  dynamic offerId;
  dynamic brandId;
  dynamic price;
  String unit;
  int shippingCharge;
  dynamic discount;
  dynamic moq;
  dynamic deliveryCharge;
  dynamic essential;
  dynamic bestSeller;
  String image;
  String imageUrl;
  String imageUrlThumbnail;
  dynamic quantity;
  bool status;
  dynamic productType;
  dynamic type;
  int userId;
  int vendorId;
  dynamic summary;
  List<Range> ranges;
  String priceRange;
  String minOrder;
  Overview overview;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    productCategoryId: json["product_category_id"],
    offerId: json["offer_id"],
    brandId: json["brand_id"],
    price: json["price"],
    unit: json["unit"],
    shippingCharge: json["shipping_charge"],
    discount: json["discount"],
    moq: json["moq"],
    deliveryCharge: json["delivery_charge"],
    essential: json["essential"],
    bestSeller: json["best_seller"],
    image: json["image"],
    imageUrl: json["image_url"],
    imageUrlThumbnail: json["image_url_thumbnail"],
    quantity: json["quantity"],
    status: json["status"],
    productType: json["product_type"],
    type: json["type"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    summary: json["summary"],
    ranges: List<Range>.from(json["ranges"].map((x) => Range.fromJson(x))),
    priceRange: json["price_range"],
    minOrder: json["min_order"],
    overview: Overview.fromJson(json["overview"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "slug": slug,
    "product_category_id": productCategoryId,
    "offer_id": offerId,
    "brand_id": brandId,
    "price": price,
    "unit": unit,
    "shipping_charge": shippingCharge,
    "discount": discount,
    "moq": moq,
    "delivery_charge": deliveryCharge,
    "essential": essential,
    "best_seller": bestSeller,
    "image": image,
    "image_url": imageUrl,
    "image_url_thumbnail": imageUrlThumbnail,
    "quantity": quantity,
    "status": status,
    "product_type": productType,
    "type": type,
    "user_id": userId,
    "vendor_id": vendorId,
    "summary": summary,
    "ranges": List<dynamic>.from(ranges.map((x) => x.toJson())),
    "price_range": priceRange,
    "min_order": minOrder,
    "overview": overview.toJson(),
  };
}

class Overview {
  Overview({
    required this.use,
    required this.size,
    required this.brand,
    required this.colors,
    required this.gender,
    required this.feature,
    required this.warranty,
    required this.ageGroup,
    required this.paymentMode,
    required this.countryOfOrigin,
  });

  String use;
  String size;
  String brand;
  String colors;
  String gender;
  String feature;
  String warranty;
  String ageGroup;
  String paymentMode;
  String countryOfOrigin;

  factory Overview.fromJson(Map<String, dynamic> json) => Overview(
    use: json["use"],
    size: json["size"],
    brand: json["brand"],
    colors: json["colors"],
    gender: json["gender"] == null ? null : json["gender"],
    feature: json["feature"],
    warranty: json["warranty"],
    ageGroup: json["age_group"],
    paymentMode: json["payment_mode"],
    countryOfOrigin: json["country_of_origin"],
  );

  Map<String, dynamic> toJson() => {
    "use": use,
    "size": size,
    "brand": brand,
    "colors": colors,
    "gender": gender == null ? null : gender,
    "feature": feature,
    "warranty": warranty,
    "age_group": ageGroup,
    "payment_mode": paymentMode,
    "country_of_origin": countryOfOrigin,
  };
}

class Range {
  Range({
    required this.id,
    required this.from,
    required this.to,
    required this.sku,
    required this.stock,
    required this.price,
    required this.productId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String from;
  String to;
  dynamic sku;
  dynamic stock;
  int price;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Range.fromJson(Map<String, dynamic> json) => Range(
    id: json["id"],
    from: json["from"],
    to: json["to"] == null ? null : json["to"],
    sku: json["sku"],
    stock: json["stock"],
    price: json["price"],
    productId: json["product_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "from": from,
    "to": to == null ? null : to,
    "sku": sku,
    "stock": stock,
    "price": price,
    "product_id": productId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
