// To parse this JSON data, do
//
//     final connectIpsModel = connectIpsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ConnectIpsModel connectIpsModelFromJson(String str) => ConnectIpsModel.fromJson(json.decode(str));

String connectIpsModelToJson(ConnectIpsModel data) => json.encode(data.toJson());

class ConnectIpsModel {
  ConnectIpsModel({
    required this.gatewayUrl,
    required this.merchantId,
    required this.appId,
    required this.appName,
    required this.txnId,
    required this.txnDate,
    required this.txnCrncy,
    required this.txnAmt,
    required this.referenceId,
    required this.remarks,
    required this.particulars,
    required this.token,
  });

  String gatewayUrl;
  String merchantId;
  String appId;
  String appName;
  String txnId;
  String txnDate;
  String txnCrncy;
  String txnAmt;
  String referenceId;
  String remarks;
  String particulars;
  String token;

  factory ConnectIpsModel.fromJson(Map<String, dynamic> json) => ConnectIpsModel(
    gatewayUrl: json["gateway_url"],
    merchantId: json["merchant_id"],
    appId: json["app_id"],
    appName: json["app_name"],
    txnId: json["txn_id"],
    txnDate: json["txn_date"],
    txnCrncy: json["txn_crncy"],
    txnAmt: json["txn_amt"],
    referenceId: json["reference_id"],
    remarks: json["remarks"],
    particulars: json["particulars"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "gateway_url": gatewayUrl,
    "merchant_id": merchantId,
    "app_id": appId,
    "app_name": appName,
    "txn_id": txnId,
    "txn_date": txnDate,
    "txn_crncy": txnCrncy,
    "txn_amt": txnAmt,
    "reference_id": referenceId,
    "remarks": remarks,
    "particulars": particulars,
    "token": token,
  };
}
