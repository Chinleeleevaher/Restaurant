// To parse this JSON data, do
//
//     final incomeYearModel = incomeYearModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<IncomeYearModel> incomeYearModelFromJson(String str) => List<IncomeYearModel>.from(json.decode(str).map((x) => IncomeYearModel.fromJson(x)));

String incomeYearModelToJson(List<IncomeYearModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncomeYearModel {
    int ordId;
    int orId;
    String productId;
    int qty;
    int amount;
    DateTime ordDate;
    int tableId;

    IncomeYearModel({
        required this.ordId,
        required this.orId,
        required this.productId,
        required this.qty,
        required this.amount,
        required this.ordDate,
        required this.tableId,
    });

    factory IncomeYearModel.fromJson(Map<String, dynamic> json) => IncomeYearModel(
        ordId: json["ord_id"],
        orId: json["or_id"],
        productId: json["product_id"],
        qty: json["qty"],
        amount: json["amount"],
        ordDate: DateTime.parse(json["ord_date"]),
        tableId: json["table_id"],
    );

    Map<String, dynamic> toJson() => {
        "ord_id": ordId,
        "or_id": orId,
        "product_id": productId,
        "qty": qty,
        "amount": amount,
        "ord_date": ordDate.toIso8601String(),
        "table_id": tableId,
    };
}
