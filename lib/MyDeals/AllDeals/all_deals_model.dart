// To parse this JSON data, do
//
//     final allDealModel = allDealModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

AllDealModel allDealModelFromJson(String str) => AllDealModel.fromJson(json.decode(str));

String allDealModelToJson(AllDealModel data) => json.encode(data.toJson());

class AllDealModel {
  AllDealModel({
    required this.data,
    required this.links,
    required this.meta,
  });

  List<Datum> data;
  Links links;
  Meta meta;

  factory AllDealModel.fromJson(Map<String, dynamic> json) => AllDealModel(
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
    required this.customerId,
    required this.vendorUserId,
    required this.expireAt,
    required this.completedAt,
    required this.subtotalPrice,
    required this.shippingCharge,
    required this.totalPrice,
    required this.isAvailable,
    required this.dealProducts,
    required this.vendor,
    required this.vendorShop,
    required this.note,
  });

  String id;
  int customerId;
  int vendorUserId;
  DateTime expireAt;
  dynamic completedAt;
  int subtotalPrice;
  int shippingCharge;
  int totalPrice;
  bool isAvailable;
  List<DealProduct> dealProducts;
  Vendor vendor;
  VendorShop vendorShop;
  dynamic note;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    customerId: json["customer_id"],
    vendorUserId: json["vendor_user_id"],
    expireAt: DateTime.parse(json["expire_at"]),
    completedAt: json["completed_at"],
    subtotalPrice: json["subtotal_price"],
    shippingCharge: json["shipping_charge"],
    totalPrice: json["total_price"],
    isAvailable: json["is_available"],
    dealProducts: List<DealProduct>.from(json["deal_products"].map((x) => DealProduct.fromJson(x))),
    vendor: Vendor.fromJson(json["vendor"]),
    vendorShop: VendorShop.fromJson(json["vendor_shop"]),
    note: json["note"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "customer_id": customerId,
    "vendor_user_id": vendorUserId,
    "expire_at": expireAt.toIso8601String(),
    "completed_at": completedAt,
    "subtotal_price": subtotalPrice,
    "shipping_charge": shippingCharge,
    "total_price": totalPrice,
    "is_available": isAvailable,
    "deal_products": List<dynamic>.from(dealProducts.map((x) => x.toJson())),
    "vendor": vendor.toJson(),
    "vendor_shop": vendorShop.toJson(),
    "note": note,
  };
}

class DealProduct {
  DealProduct({
    required this.id,
    required this.productId,
    required this.productQty,
    required this.unitPrice,
    required this.subtotalPrice,
    required this.shippingCharge,
    required this.totalPrice,
    required this.title,
    required this.product,
  });

  int id;
  int productId;
  int productQty;
  int unitPrice;
  int subtotalPrice;
  String shippingCharge;
  int totalPrice;
  String title;
  Product product;

  factory DealProduct.fromJson(Map<String, dynamic> json) => DealProduct(
    id: json["id"],
    productId: json["product_id"],
    productQty: json["product_qty"],
    unitPrice: json["unit_price"],
    subtotalPrice: json["subtotal_price"],
    shippingCharge: json["shipping_charge"],
    totalPrice: json["total_price"],
    title: json["title"],
    product: Product.fromJson(json["product"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "product_id": productId,
    "product_qty": productQty,
    "unit_price": unitPrice,
    "subtotal_price": subtotalPrice,
    "shipping_charge": shippingCharge,
    "total_price": totalPrice,
    "title": title,
    "product": product.toJson(),
  };
}

class Product {
  Product({
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
    required this.highlight,
    required this.description,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDescription,
    required this.metaKeyphrase,
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
  String highlight;
  dynamic description;
  dynamic metaTitle;
  String metaKeyword;
  dynamic metaDescription;
  dynamic metaKeyphrase;
  String priceRange;
  String minOrder;
  Overview overview;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
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
    highlight: json["highlight"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaKeyword: json["meta_keyword"],
    metaDescription: json["meta_description"],
    metaKeyphrase: json["meta_keyphrase"],
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
    "highlight": highlight,
    "description": description,
    "meta_title": metaTitle,
    "meta_keyword": metaKeyword,
    "meta_description": metaDescription,
    "meta_keyphrase": metaKeyphrase,
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
    "use": use,
    "size": size,
    "brand": brand,
    "colors": colors,
    "gender": gender,
    "feature": feature,
    "warranty": warranty,
    "age_group": ageGroup,
    "payment_mode": paymentMode,
    "country_of_origin": countryOfOrigin,
  };
}

class Vendor {
  Vendor({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNum,
    required this.birthday,
    required this.gender,
    required this.imageUrl,
    required this.imageUrlThumbnail,
    required this.address,
  });

  int id;
  String name;
  String email;
  String phoneNum;
  dynamic birthday;
  dynamic gender;
  String imageUrl;
  String imageUrlThumbnail;
  Address address;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneNum: json["phone_num"],
    birthday: json["birthday"],
    gender: json["gender"],
    imageUrl: json["image_url"],
    imageUrlThumbnail: json["image_url_thumbnail"],
    address: Address.fromJson(json["address"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone_num": phoneNum,
    "birthday": birthday,
    "gender": gender,
    "image_url": imageUrl,
    "image_url_thumbnail": imageUrlThumbnail,
    "address": address.toJson(),
  };
}

class Address {
  Address();

  factory Address.fromJson(Map<String, dynamic> json) => Address(
  );

  Map<String, dynamic> toJson() => {
  };
}

class VendorShop {
  VendorShop({
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
    required this.description,
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
  dynamic description;
  DateTime createdAt;
  dynamic shippingInfo;

  factory VendorShop.fromJson(Map<String, dynamic> json) => VendorShop(
    id: json["id"],
    userId: json["user_id"],
    category: json["category"],
    businessType: json["business_type"],
    plan: json["plan"],
    shopName: json["shop_name"],
    companyName: json["company_name"],
    image: json["image"],
    imageUrl: json["image_url"],
    imageUrlThumbnail: json["image_url_thumbnail"],
    description: json["description"],
    createdAt: DateTime.parse(json["created_at"]),
    shippingInfo: json["shipping_info"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category": category,
    "business_type": businessType,
    "plan": plan,
    "shop_name": shopName,
    "company_name": companyName,
    "image": image,
    "image_url": imageUrl,
    "image_url_thumbnail": imageUrlThumbnail,
    "description": description,
    "created_at": createdAt.toIso8601String(),
    "shipping_info": shippingInfo,
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
