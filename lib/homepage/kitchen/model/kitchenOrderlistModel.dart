// To parse this JSON data, do
//
//     final orderStatusModel = orderStatusModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<OrderForKitchen> orderforktchenModelFromJson(String str) => List<OrderForKitchen>.from(json.decode(str).map((x) => OrderForKitchen.fromJson(x)));

String orderStatusModelToJson(List<OrderForKitchen> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderForKitchen {
    int orId;
    DateTime orDate;
    int orQty;
    int orAmount;
    int orStatus;
    int tableId;

    OrderForKitchen({
        required this.orId,
        required this.orDate,
        required this.orQty,
        required this.orAmount,
        required this.orStatus,
        required this.tableId,
    });

    factory OrderForKitchen.fromJson(Map<String, dynamic> json) => OrderForKitchen(
        orId: json["or_id"],
        orDate: DateTime.parse(json["or_date"]),
        orQty: json["or_qty"],
        orAmount: json["or_amount"],
        orStatus: json["or_status"],
        tableId: json["table_id"],
    );

    Map<String, dynamic> toJson() => {
        "or_id": orId,
        "or_date": orDate.toIso8601String(),
        "or_qty": orQty,
        "or_amount": orAmount,
        "or_status": orStatus,
        "table_id": tableId,
    };
}
