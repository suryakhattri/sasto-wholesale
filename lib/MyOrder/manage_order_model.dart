// To parse this JSON data, do
//
//     final manageOrderModel = manageOrderModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ManageOrderModel manageOrderModelFromJson(String str) => ManageOrderModel.fromJson(json.decode(str));

String manageOrderModelToJson(ManageOrderModel data) => json.encode(data.toJson());

class ManageOrderModel {
  ManageOrderModel({
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
    required this.soldBy,
    required this.statusNumber,
    required this.canCancelOrder,
    required this.orderLists,
    required this.vendor,
    required this.shippingAddress,
    required this.billingAddress,
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
  dynamic cancelReason;
  dynamic connectipsTxnId;
  String soldBy;
  int statusNumber;
  bool canCancelOrder;
  List<OrderList> orderLists;
  Vendor vendor;
  ShippingAddress shippingAddress;
  ShippingAddress billingAddress;

  factory ManageOrderModel.fromJson(Map<String, dynamic> json) => ManageOrderModel(
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
    cancelReason: json["cancel_reason"],
    connectipsTxnId: json["connectips_txn_id"],
    soldBy: json["sold_by"],
    statusNumber: json["status_number"],
    canCancelOrder: json["can_cancel_order"],
    orderLists: List<OrderList>.from(json["order_lists"].map((x) => OrderList.fromJson(x))),
    vendor: Vendor.fromJson(json["vendor"]),
    shippingAddress: ShippingAddress.fromJson(json["shipping_address"]),
    billingAddress: ShippingAddress.fromJson(json["billing_address"]),
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
    "cancel_reason": cancelReason,
    "connectips_txn_id": connectipsTxnId,
    "sold_by": soldBy,
    "status_number": statusNumber,
    "can_cancel_order": canCancelOrder,
    "order_lists": List<dynamic>.from(orderLists.map((x) => x.toJson())),
    "vendor": vendor.toJson(),
    "shipping_address": shippingAddress.toJson(),
    "billing_address": billingAddress.toJson(),
  };
}

class ShippingAddress {
  ShippingAddress({
    required this.id,
    required this.addressableType,
    required this.addressableId,
    required this.type,
    required this.fullName,
    required this.companyName,
    required this.vat,
    required this.country,
    required this.city,
    required this.streetAddress,
    required this.nearestLandmark,
    required this.phone,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String addressableType;
  int addressableId;
  String type;
  String fullName;
  String companyName;
  String vat;
  String country;
  String city;
  String streetAddress;
  String nearestLandmark;
  String phone;
  dynamic email;
  DateTime createdAt;
  DateTime updatedAt;

  factory ShippingAddress.fromJson(Map<String, dynamic> json) => ShippingAddress(
    id: json["id"],
    addressableType: json["addressable_type"],
    addressableId: json["addressable_id"],
    type: json["type"],
    fullName: json["full_name"],
    companyName: json["company_name"],
    vat: json["vat"],
    country: json["country"],
    city: json["city"],
    streetAddress: json["street_address"],
    nearestLandmark: json["nearest_landmark"],
    phone: json["phone"],
    email: json["email"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "addressable_type": addressableType,
    "addressable_id": addressableId,
    "type": type,
    "full_name": fullName,
    "company_name": companyName,
    "vat": vat,
    "country": country,
    "city": city,
    "street_address": streetAddress,
    "nearest_landmark": nearestLandmark,
    "phone": phone,
    "email": email,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
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

class Vendor {
  Vendor({
    required this.id,
    required this.userId,
    required this.shopName,
  });

  int id;
  int userId;
  String shopName;

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
    id: json["id"],
    userId: json["user_id"],
    shopName: json["shop_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "shop_name": shopName,
  };
}
