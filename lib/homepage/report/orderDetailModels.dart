// To parse this JSON data, do
//
//     final selectOrderReportModels = selectOrderReportModelsFromJson(jsonString);

import 'dart:convert';

List<SelectOrderReportModels> selectOrderReportModelsFromJson(String str) => List<SelectOrderReportModels>.from(json.decode(str).map((x) => SelectOrderReportModels.fromJson(x)));

String selectOrderReportModelsToJson(List<SelectOrderReportModels> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelectOrderReportModels {
    int ordId;
    int orId;
    String productId;
    int qty;
    int amount;
    DateTime ordDate;
    int tableId;
    String productName;

    SelectOrderReportModels({
        required this.ordId,
        required this.orId,
        required this.productId,
        required this.qty,
        required this.amount,
        required this.ordDate,
        required this.tableId,
        required this.productName,
    });

    factory SelectOrderReportModels.fromJson(Map<String, dynamic> json) => SelectOrderReportModels(
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
}
