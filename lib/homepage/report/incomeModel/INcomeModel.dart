// To parse this JSON data, do
//
//     final incomeModel = incomeModelFromJson(jsonString);

import 'dart:convert';

List<IncomeModel> incomeModelFromJson(String str) => List<IncomeModel>.from(json.decode(str).map((x) => IncomeModel.fromJson(x)));

String incomeModelToJson(List<IncomeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IncomeModel {
    int ordId;
    int orId;
    String productId;
    int qty;
    int amount;
    DateTime ordDate;
    int tableId;

    IncomeModel({
        required this.ordId,
        required this.orId,
        required this.productId,
        required this.qty,
        required this.amount,
        required this.ordDate,
        required this.tableId,
    });

    factory IncomeModel.fromJson(Map<String, dynamic> json) => IncomeModel(
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
