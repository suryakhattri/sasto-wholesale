// To parse this JSON data, do
//
//     final manageOrderModel = manageOrderModelFromJson(jsonString);

import 'dart:convert';

AllOrderModel manageOrderModelFromJson(String str) => AllOrderModel.fromJson(json.decode(str));

String manageOrderModelToJson(AllOrderModel data) => json.encode(data.toJson());

class AllOrderModel {
  AllOrderModel({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.links,
    required this.nextPageUrl,
    required this.path,
    required this.perPage,
    required this.prevPageUrl,
    required this.to,
    required this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  dynamic nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory AllOrderModel.fromJson(Map<String, dynamic> json) => AllOrderModel(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.userId,
    required this.vendorId,
    required this.subtotalPrice,
    required this.shippingCharge,
    required this.totalPrice,
    required this.dealId,
    required this.orderNote,
    required this.trackNo,
    required this.paymentType,
    required this.status,
    required this.paymentStatus,
    required this.esewaRefId,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.productDetails,
    required this.cancelReason,
    required this.connectipsTxnId,
    required this.orderLists,
  });

  int id;
  int userId;
  int vendorId;
  int subtotalPrice;
  int shippingCharge;
  int totalPrice;
  dynamic dealId;
  dynamic orderNote;
  dynamic trackNo;
  String paymentType;
  String status;
  String paymentStatus;
  dynamic esewaRefId;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic productDetails;
  String cancelReason;
  dynamic connectipsTxnId;
  List<OrderList> orderLists;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    userId: json["user_id"],
    vendorId: json["vendor_id"],
    subtotalPrice: json["subtotal_price"],
    shippingCharge: json["shipping_charge"],
    totalPrice: json["total_price"],
    dealId: json["deal_id"],
    orderNote: json["order_note"],
    trackNo: json["track_no"],
    paymentType: json["payment_type"],
    status: json["status"],
    paymentStatus: json["payment_status"],
    esewaRefId: json["esewa_ref_id"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productDetails: json["product_details"],
    cancelReason: json["cancel_reason"] == null ? null : json["cancel_reason"],
    connectipsTxnId: json["connectips_txn_id"],
    orderLists: List<OrderList>.from(json["order_lists"].map((x) => OrderList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "vendor_id": vendorId,
    "subtotal_price": subtotalPrice,
    "shipping_charge": shippingCharge,
    "total_price": totalPrice,
    "deal_id": dealId,
    "order_note": orderNote,
    "track_no": trackNo,
    "payment_type": paymentType,
    "status": status,
    "payment_status": paymentStatus,
    "esewa_ref_id": esewaRefId,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_details": productDetails,
    "cancel_reason": cancelReason == null ? null : cancelReason,
    "connectips_txn_id": connectipsTxnId,
    "order_lists": List<dynamic>.from(orderLists.map((x) => x.toJson())),
  };
}

class OrderList {
  OrderList({
    required this.id,
    required this.orderId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.unit,
    required this.unitPrice,
    required this.subtotalPrice,
    required this.shippingCharge,
    required this.totalPrice,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
    required this.productImageUrl,
  });

  int id;
  String orderId;
  int productId;
  String productName;
  int quantity;
  dynamic unit;
  int unitPrice;
  int subtotalPrice;
  int shippingCharge;
  int totalPrice;
  dynamic deletedAt;
  DateTime createdAt;
  DateTime updatedAt;
  String productImageUrl;

  factory OrderList.fromJson(Map<String, dynamic> json) => OrderList(
    id: json["id"],
    orderId: json["order_id"],
    productId: json["product_id"],
    productName: json["product_name"],
    quantity: json["quantity"],
    unit: json["unit"],
    unitPrice: json["unit_price"],
    subtotalPrice: json["subtotal_price"],
    shippingCharge: json["shipping_charge"],
    totalPrice: json["total_price"],
    deletedAt: json["deleted_at"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    productImageUrl: json["product_image_url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "order_id": orderId,
    "product_id": productId,
    "product_name": productName,
    "quantity": quantity,
    "unit": unit,
    "unit_price": unitPrice,
    "subtotal_price": subtotalPrice,
    "shipping_charge": shippingCharge,
    "total_price": totalPrice,
    "deleted_at": deletedAt,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "product_image_url": productImageUrl,
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
