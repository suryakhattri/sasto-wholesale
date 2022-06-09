// To parse this JSON data, do
//
//     final checkOutRequestModel = checkOutRequestModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

CheckOutRequestModel checkOutRequestModelFromJson(String str) => CheckOutRequestModel.fromJson(json.decode(str));

String checkOutRequestModelToJson(CheckOutRequestModel data) => json.encode(data.toJson());

class CheckOutRequestModel {
  CheckOutRequestModel({
    required this.checkoutMode,
    required this.cart,
    required this.paymentType,
    required this.address,
    required this.shipToDifferentAddress,
    required this.venderId,
  });

  String checkoutMode;
  List<Cart> cart;
  String paymentType;
  Address address;
  bool shipToDifferentAddress;
  int venderId;

  factory CheckOutRequestModel.fromJson(Map<String, dynamic> json) => CheckOutRequestModel(
    checkoutMode: json["checkout_mode"],
    cart: List<Cart>.from(json["cart"].map((x) => Cart.fromJson(x))),
    paymentType: json["payment_type"],
    address: Address.fromJson(json["address"]),
    shipToDifferentAddress: json["ship_to_different_address"],
    venderId: json["vender_id"],
  );

  Map<String, dynamic> toJson() => {
    "checkout_mode": checkoutMode,
    "cart": List<dynamic>.from(cart.map((x) => x.toJson())),
    "payment_type": paymentType,
    "address": address.toJson(),
    "ship_to_different_address": shipToDifferentAddress,
    "vender_id": venderId,
  };
}

class Address {
  Address({
    required this.billing,
    required this.shipping,
  });

  Ing billing;
  Ing shipping;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    billing: Ing.fromJson(json["billing"]),
    shipping: Ing.fromJson(json["shipping"]),
  );

  Map<String, dynamic> toJson() => {
    "billing": billing.toJson(),
    "shipping": shipping.toJson(),
  };
}

class Ing {
  Ing({
    required this.fullName,
    required this.companyName,
    required this.vat,
    required this.country,
    required this.city,
    required this.streetAddress,
    required this.nearestLandmark,
    required this.phone,
    required this.email,
  });

  String fullName;
  String companyName;
  String vat;
  String country;
  String city;
  String streetAddress;
  String nearestLandmark;
  String phone;
  String email;

  factory Ing.fromJson(Map<String, dynamic> json) => Ing(
    fullName: json["full_name"],
    companyName: json["company_name"],
    vat: json["vat"],
    country: json["country"],
    city: json["city"],
    streetAddress: json["street_address"],
    nearestLandmark: json["nearest_landmark"],
    phone: json["phone"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "company_name": companyName,
    "vat": vat,
    "country": country,
    "city": city,
    "street_address": streetAddress,
    "nearest_landmark": nearestLandmark,
    "phone": phone,
    "email": email,
  };
}

class Cart {
  Cart({
    required this.productId,
    required this.productQty,
  });

  int productId;
  int productQty;

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
    productId: json["product_id"],
    productQty: json["product_qty"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "product_qty": productQty,
  };
}
