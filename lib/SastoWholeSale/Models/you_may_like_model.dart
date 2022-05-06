// To parse this JSON data, do
//
//     final youMayLikeModel = youMayLikeModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

YouMayLikeModel youMayLikeModelFromJson(String str) => YouMayLikeModel.fromJson(json.decode(str));

String youMayLikeModelToJson(YouMayLikeModel data) => json.encode(data.toJson());

class YouMayLikeModel {
  YouMayLikeModel({
    required this.data,
  });

  List<Datum> data;

  factory YouMayLikeModel.fromJson(Map<String, dynamic> json) => YouMayLikeModel(
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

// enum MinOrder { THE_1_PCS_MIN_ORDER, THE_1_PAIR_MIN_ORDER }
//
// final minOrderValues = EnumValues({
//   "1Pair (Min. Order)": MinOrder.THE_1_PAIR_MIN_ORDER,
//   "1pcs (Min. Order)": MinOrder.THE_1_PCS_MIN_ORDER
// });

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
    gender: json["gender"],
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

// enum Brand { NO, BRAND_NO }
//
// final brandValues = EnumValues({
//   "NO": Brand.BRAND_NO,
//   "No": Brand.NO
//});

// enum CountryOfOrigin { CHINA }
//
// final countryOfOriginValues = EnumValues({
//   "China": CountryOfOrigin.CHINA
// });
//
// enum Gender { FEMALE, MALE }
//
// final genderValues = EnumValues({
//   "Female": Gender.FEMALE,
//   "Male": Gender.MALE
// });
//
// enum PaymentMode { COD, COD_ESEWA_CONNECT_I_PS }
//
// final paymentModeValues = EnumValues({
//   "COD": PaymentMode.COD,
//   "COD/Esewa/Connect IPs": PaymentMode.COD_ESEWA_CONNECT_I_PS
// });
//
// enum Use { FORMAL, FORMAL_PARTY, CHILD }
//
// final useValues = EnumValues({
//   "Child": Use.CHILD,
//   "Formal": Use.FORMAL,
//   "Formal, Party": Use.FORMAL_PARTY
// });

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

//enum Unit { PCS, PAIR }

// final unitValues = EnumValues({
//   "Pair": Unit.PAIR,
//   "pcs": Unit.PCS
// });

// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
