// To parse this JSON data, do
//
//     final caegoryDetailModel = caegoryDetailModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';


CaegoryDetailModel caegoryDetailModelFromJson(String str) => CaegoryDetailModel.fromJson(json.decode(str));

String caegoryDetailModelToJson(CaegoryDetailModel data) => json.encode(data.toJson());

class CaegoryDetailModel {
  CaegoryDetailModel({
    required this.data,
  });

  Datum data;
  //Data getById(int id) => data.;


  factory CaegoryDetailModel.fromJson(Map<String, dynamic> json) => CaegoryDetailModel(
    data: Datum.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
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
    required this.highlight,
    required this.description,
    required this.metaTitle,
    required this.metaKeyword,
    required this.metaDescription,
    required this.metaKeyphrase,
    required this.productCategory,
    required this.ranges,
    required this.priceRange,
    required this.minOrder,
    required this.images,
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
  dynamic shippingCharge;
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
  dynamic highlight;
  dynamic description;
  dynamic metaTitle;
  dynamic metaKeyword;
  dynamic metaDescription;
  dynamic metaKeyphrase;
  ProductCategory productCategory;
  List<Range> ranges;
  String priceRange;
  String minOrder;
  List<Images> images;
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
    highlight: json["highlight"],
    description: json["description"],
    metaTitle: json["meta_title"],
    metaKeyword: json["meta_keyword"],
    metaDescription: json["meta_description"],
    metaKeyphrase: json["meta_keyphrase"],
    productCategory: ProductCategory.fromJson(json["product_category"]),
    ranges: List<Range>.from(json["ranges"].map((x) => Range.fromJson(x))),
    priceRange: json["price_range"],
    minOrder: json["min_order"],
    images: List<Images>.from(json["images"].map((x) => Images.fromJson(x))),
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
    "product_category": productCategory.toJson(),
    "ranges": List<dynamic>.from(ranges.map((x) => x.toJson())),
    "price_range": priceRange,
    "min_order": minOrder,
    "images": List<dynamic>.from(images.map((x) => x.toJson())),
    "overview": overview.toJson(),
  };
}

class Images {
  Images({
    required this.id,
    required this.image,
    required this.imageUrl,
    required this.imageUrlThumbnail,
  });

  int id;
  String image;
  String imageUrl;
  String imageUrlThumbnail;

  factory Images.fromJson(Map<String, dynamic> json) => Images(
    id: json["id"],
    image: json["image"],
    imageUrl: json["image_url"],
    imageUrlThumbnail: json["image_url_thumbnail"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "image_url": imageUrl,
    "image_url_thumbnail": imageUrlThumbnail,
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

  dynamic use;
  String size;
  String brand;
  String colors;
  dynamic gender;
  dynamic feature;
  String warranty;
  dynamic ageGroup;
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
  dynamic to;
  dynamic sku;
  dynamic stock;
  int price;
  int productId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Range.fromJson(Map<String, dynamic> json) => Range(
    id: json["id"],
    from: json["from"],
    to: json["to"],
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
    "to": to,
    "sku": sku,
    "stock": stock,
    "price": price,
    "product_id": productId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}

// class Cart with ChangeNotifier {
//   List<Product> products = [];
//
//   double get total {
//     return products.fold(0.0, (double currentTotal, Product nextProduct) {
//       return currentTotal + nextProduct.cost;
//     });
//   }
//
//   void addToCart(Product product) => products.add(product);
//   void removeFromCart(Product product) {
//     products.remove(product);
//     notifyListeners();
//   }
// }