// To parse this JSON data, do
//
//     final newArrivalAllProductModel = newArrivalAllProductModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NewArrivalAllProductModel newArrivalAllProductModelFromJson(String str) => NewArrivalAllProductModel.fromJson(json.decode(str));

String newArrivalAllProductModelToJson(NewArrivalAllProductModel data) => json.encode(data.toJson());

class NewArrivalAllProductModel {
  NewArrivalAllProductModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<NewArrivalAllData> data;
  Links links;
  Meta meta;

  factory NewArrivalAllProductModel.fromJson(Map<String, dynamic> json) => NewArrivalAllProductModel(
    data: List<NewArrivalAllData>.from(json["data"].map((x) => NewArrivalAllData.fromJson(x))),
    links: Links.fromJson(json["links"]),
    meta: Meta.fromJson(json["meta"]),
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "links": links.toJson(),
    "meta": meta.toJson(),
  };
}

class NewArrivalAllData {
  NewArrivalAllData({
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
    required this.productCategory,
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
  ProductCategory productCategory;
  List<Range> ranges;
  String priceRange;
  String minOrder;
  Overview overview;

  factory NewArrivalAllData.fromJson(Map<String, dynamic> json) => NewArrivalAllData(
    id: json["id"],
    title: json["title"],
    slug: json["slug"],
    productCategoryId: json["product_category_id"],
    offerId: json["offer_id"],
    brandId: json["brand_id"],
    price: json["price"],
    unit: json["unit"],
    shippingCharge: json["shipping_charge"] == null ? null : json["shipping_charge"],
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
    productCategory: ProductCategory.fromJson(json["product_category"]),
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
    "unit": unit == null ? null : unitValues.reverse[unit],
    "shipping_charge": shippingCharge == null ? null : shippingCharge,
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
    "product_category": productCategory.toJson(),
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
    gender: json["gender"],
    feature: json["feature"],
    warranty: json["warranty"],
    ageGroup: json["age_group"],
    paymentMode: json["payment_mode"],
    countryOfOrigin: json["country_of_origin"],
  );

  Map<String, dynamic> toJson() => {
    "use": use == null ? null : useValues.reverse[use],
    "size": size == null ? null : size,
    "brand": brand == null ? null : brandValues.reverse[brand],
    "colors": colors,
    "gender": genderValues.reverse[gender],
    "feature": feature == null ? null : feature,
    "warranty": warranty == null ? null : warrantyValues.reverse[warranty],
    "age_group": ageGroup,
    "payment_mode": paymentModeValues.reverse[paymentMode],
    "country_of_origin": countryOfOriginValues.reverse[countryOfOrigin],
  };
}

enum Brand { SKMEI, NO, BRAND_NO }

final brandValues = EnumValues({
  "NO": Brand.BRAND_NO,
  "No": Brand.NO,
  "Skmei": Brand.SKMEI
});

enum CountryOfOrigin { CHINESE, CHINA }

final countryOfOriginValues = EnumValues({
  "China": CountryOfOrigin.CHINA,
  "Chinese": CountryOfOrigin.CHINESE
});

enum Gender { BOTH_MALE_AND_FEMALE, MALE, FEMALE }

final genderValues = EnumValues({
  "Both Male and Female.": Gender.BOTH_MALE_AND_FEMALE,
  "Female": Gender.FEMALE,
  "Male": Gender.MALE
});

enum PaymentMode { CASH_CHEQUE_BANK_TRANSFER, COD_ESEWA_CONNECT_I_PS, ESEWA_CONNECT_IPS_COD }

final paymentModeValues = EnumValues({
  "Cash , Cheque , Bank Transfer": PaymentMode.CASH_CHEQUE_BANK_TRANSFER,
  "COD/Esewa/Connect IPs": PaymentMode.COD_ESEWA_CONNECT_I_PS,
  "Esewa, Connect Ips, COD": PaymentMode.ESEWA_CONNECT_IPS_COD
});

enum Use { FORMAL_PARTY, FORMAL }

final useValues = EnumValues({
  "Formal": Use.FORMAL,
  "Formal, Party": Use.FORMAL_PARTY
});

enum Warranty { THE_1_YEAR, NO, WARRANTY_NO }

final warrantyValues = EnumValues({
  "No": Warranty.NO,
  "1 Year": Warranty.THE_1_YEAR,
  "NO": Warranty.WARRANTY_NO
});

class ProductCategory {
  ProductCategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.image,
    required this.isFeatured,
    required this.publish,
    required this.subcategoryId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String slug;
  dynamic image;
  int isFeatured;
  int publish;
  int subcategoryId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;

  factory ProductCategory.fromJson(Map<String, dynamic> json) => ProductCategory(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    image: json["image"],
    isFeatured: json["is_featured"],
    publish: json["publish"],
    subcategoryId: json["subcategory_id"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "image": image,
    "is_featured": isFeatured,
    "publish": publish,
    "subcategory_id": subcategoryId,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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

enum Unit { PCS, PAIR, UNIT_PCS }

final unitValues = EnumValues({
  "Pair": Unit.PAIR,
  "Pcs": Unit.PCS,
  "pcs": Unit.UNIT_PCS
});

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
