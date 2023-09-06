// To parse this JSON data, do
//
//     final selectOrderByTableModel = selectOrderByTableModelFromJson(jsonString);

import 'dart:convert';

List<SelectOrderByTableModel> selectOrderByTableModelFromJson(String str) => List<SelectOrderByTableModel>.from(json.decode(str).map((x) => SelectOrderByTableModel.fromJson(x)));

String selectOrderByTableModelToJson(List<SelectOrderByTableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelectOrderByTableModel {
    int ordId;
    int qty;
    int amount;
    String productName;
    int price;
    DateTime orDate;
    int orAmount;
    int tableId;

    SelectOrderByTableModel({
        required this.ordId,
        required this.qty,
        required this.amount,
        required this.productName,
        required this.price,
        required this.orDate,
        required this.orAmount,
        required this.tableId,
    });

    factory SelectOrderByTableModel.fromJson(Map<String, dynamic> json) => SelectOrderByTableModel(
        ordId: json["ord_id"],
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
        "qty": qty,
        "amount": amount,
        "product_name": productName,
        "price": price,
        "or_date": orDate.toIso8601String(),
        "or_amount": orAmount,
        "table_id": tableId,
    };
}
