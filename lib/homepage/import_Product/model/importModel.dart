
// ignore_for_file: camel_case_types, file_names

import 'dart:convert';
import 'package:flutter/material.dart';

List<improtBillModel> importBillidModelFromJson(String str) => List<improtBillModel>.from(json.decode(str).map((x) => improtBillModel.fromJson(x)));

String importBillidModelToJson(List<improtBillModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class improtBillModel {
  int orpId;
  String productId;
  TextEditingController orpNameController;
  TextEditingController orpQtyController;
  TextEditingController orpPriceController;
  int orCost;
  int status;
  String billnumber;
  DateTime orpDate;
  String image;

  improtBillModel({
    required this.orpId,
    required this.productId,
    required this.orpNameController,
    required this.orpQtyController,
    required this.orpPriceController,
    required this.orCost,
    required this.status,
    required this.billnumber,
    required this.orpDate,
    required this.image,
  });

  factory improtBillModel.fromJson(Map<String, dynamic> json) => improtBillModel(
    orpId: json["orp_id"],
    productId: json["product_id"],
    orpNameController: TextEditingController(text: json["orpName"]),
    orpQtyController: TextEditingController(text: json["orpQty"].toString()),
    orpPriceController: TextEditingController(text: json["orpPrice"].toString()),
    orCost: json["orCost"],
    status: json["status"],
    billnumber: json["billnumber"],
    orpDate: DateTime.parse(json["orp_date"]),
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "orp_id": orpId,
    "product_id": productId,
    "orpName": orpNameController.text,
    "orpQty": int.tryParse(orpQtyController.text) ?? 0,
    "orpPrice": int.tryParse(orpPriceController.text) ?? 0,
    "orCost": orCost,
    "status": status,
    "billnumber": billnumber,
    "orp_date": orpDate.toIso8601String(),
    "image": image,
  };

  void disposeControllers() {
    orpNameController.dispose();
    orpQtyController.dispose();
    orpPriceController.dispose();
  }
}
