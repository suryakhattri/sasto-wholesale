import 'package:meta/meta.dart';
import 'dart:convert';

class SuppliersModel {
  final String title;
  final String url;
  SuppliersModel({required this.title, required this.url});
}

// To parse this JSON data, do
//
//     final supplierModel = supplierModelFromJson(jsonString);

SupplierModel supplierModelFromJson(String str) => SupplierModel.fromJson(json.decode(str));

String supplierModelToJson(SupplierModel data) => json.encode(data.toJson());

class SupplierModel {
  SupplierModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<SuppliersDataModel> data;
  Links links;
  Meta meta;

  factory SupplierModel.fromJson(Map<String, dynamic> json) => SupplierModel(
    data: List<SuppliersDataModel>.from(json["data"].map((x) => SuppliersDataModel.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class SuppliersDataModel {
  SuppliersDataModel({
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
    required this.createdAt,
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
  DateTime createdAt;
  dynamic shippingInfo;

  factory SuppliersDataModel.fromJson(Map<String, dynamic> json) => SuppliersDataModel(
    id: json["id"],
    userId: json["user_id"],
    category: json["category"],
    businessType: json["business_type"],
    plan: json["plan"],
    shopName: json["shop_name"],
    companyName: json["company_name"],
    image: json["image"] == null ? null : json["image"],
    imageUrl: json["image_url"],
    imageUrlThumbnail: json["image_url_thumbnail"],
    createdAt: DateTime.parse(json["created_at"]),
    shippingInfo: json["shipping_info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category": categoryValues.reverse[category],
    "business_type": businessType,
    "plan": planValues.reverse[plan],
    "shop_name": shopName,
    "company_name": companyName,
    "image": image == null ? null : image,
    "image_url": imageUrl,
    "image_url_thumbnail": imageUrlThumbnail,
    "created_at": createdAt.toIso8601String(),
    "shipping_info": shippingInfo,
  };
}

enum Category { LOCAL_SELLER }

final categoryValues = EnumValues({
  "local_seller": Category.LOCAL_SELLER
});

enum Plan { PREMIUM_PLAN, STANDARD_PLAN, BASIC_PLAN }

final planValues = EnumValues({
  "basic_plan": Plan.BASIC_PLAN,
  "premium_plan": Plan.PREMIUM_PLAN,
  "standard_plan": Plan.STANDARD_PLAN
});

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

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}
