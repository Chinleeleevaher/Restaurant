// To parse this JSON data, do
//
//     final selectOrderDetailReportModel = selectOrderDetailReportModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<SelectOrderDetailReportModel> selectOrderDetailReportModelFromJson(String str) => List<SelectOrderDetailReportModel>.from(json.decode(str).map((x) => SelectOrderDetailReportModel.fromJson(x)));

String selectOrderDetailReportModelToJson(List<SelectOrderDetailReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelectOrderDetailReportModel {
    int ordId;
    String productId;
    int orId;
    int qty;
    int amount;
    String productName;
    int price;
    DateTime orDate;
    int orAmount;
    int tableId;

    SelectOrderDetailReportModel({
        required this.ordId,
        required this.productId,
        required this.orId,
        required this.qty,
        required this.amount,
        required this.productName,
        required this.price,
        required this.orDate,
        required this.orAmount,
        required this.tableId,
    });

    factory SelectOrderDetailReportModel.fromJson(Map<String, dynamic> json) => SelectOrderDetailReportModel(
        ordId: json["ord_id"],
        productId: json["product_id"],
        orId: json["or_id"],
        qty: json["qty"],
        amount: json["amount"],
        productName: json["product_name"],
        price: json["price"],
        orDate: DateTime.parse(json["or_date"]),
        orAmount: json["or_amount"],
        tableId: json["table_id"],
    );

    Map<String, dynamic> toJson() => {
        "ord_id": ordId,
        "product_id": productId,
        "or_id": orId,
        "qty": qty,
        "amount": amount,
        "product_name": productName,
        "price": price,
        "or_date": orDate.toIso8601String(),
        "or_amount": orAmount,
        "table_id": tableId,
    };
}
