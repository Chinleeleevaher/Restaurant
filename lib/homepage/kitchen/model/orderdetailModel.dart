// // To parse this JSON data, do
// //
// //     final orderDetailModel = orderDetailModelFromJson(jsonString);

// // ignore_for_file: file_names

// import 'dart:convert';

// List<OrderDetailModel> orderDetailModelFromJson(String str) => List<OrderDetailModel>.from(json.decode(str).map((x) => OrderDetailModel.fromJson(x)));

// String orderDetailModelToJson(List<OrderDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class OrderDetailModel {
//     int ordId;
//     int orId;
//     String productId;
//     int qty;
//     int amount;
//     DateTime ordDate;
//     int tableId;
//     String productName;

//     OrderDetailModel({
//         required this.ordId,
//         required this.orId,
//         required this.productId,
//         required this.qty,
//         required this.amount,
//         required this.ordDate,
//         required this.tableId,
//         required this.productName,
//     });

//     factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
//         ordId: json["ord_id"],
//         orId: json["or_id"],
//         productId: json["product_id"],
//         qty: json["qty"],
//         amount: json["amount"],
//         ordDate: DateTime.parse(json["ord_date"]),
//         tableId: json["table_id"],
//         productName: json["product_name"],
//     );

//     Map<String, dynamic> toJson() => {
//         "ord_id": ordId,
//         "or_id": orId,
//         "product_id": productId,
//         "qty": qty,
//         "amount": amount,
//         "ord_date": ordDate.toIso8601String(),
//         "table_id": tableId,
//         "product_name": productName,
//     };
// }


import 'dart:convert';

import 'package:myproject/homepage/kitchen/model/rejectModel.dart';

// JSON parsing functions
List<OrderDetailModel> orderDetailModelFromJson(String str) => List<OrderDetailModel>.from(json.decode(str).map((x) => OrderDetailModel.fromJson(x)));
String orderDetailModelToJson(List<OrderDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderDetailModel {
  int ordId;
  int orId;
  String productId;
  int qty;
  int amount;
  DateTime ordDate;
  int tableId;
  String productName;

  OrderDetailModel({
    required this.ordId,
    required this.orId,
    required this.productId,
    required this.qty,
    required this.amount,
    required this.ordDate,
    required this.tableId,
    required this.productName,
  });

  factory OrderDetailModel.fromJson(Map<String, dynamic> json) => OrderDetailModel(
    ordId: json["ord_id"],
    orId: json["or_id"],
    productId: json["product_id"],
    qty: json["qty"],
    amount: json["amount"],
    ordDate: DateTime.parse(json["ord_date"]),
    tableId: json["table_id"],
    productName: json["product_name"],
  );

  Map<String, dynamic> toJson() => {
    "ord_id": ordId,
    "or_id": orId,
    "product_id": productId,
    "qty": qty,
    "amount": amount,
    "ord_date": ordDate.toIso8601String(),
    "table_id": tableId,
    "product_name": productName,
  };

  // Conversion method to RejectModel
  RejectModel toRejectModel() {
    return RejectModel(
      ordId: this.ordId,
      orId: this.orId,
      productId: this.productId,
      qty: this.qty,
      amount: this.amount,
      ordDate: this.ordDate,
      tableId: this.tableId,
      productName: this.productName,
    );
  }
}
