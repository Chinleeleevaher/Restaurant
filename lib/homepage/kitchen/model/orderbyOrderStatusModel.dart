// To parse this JSON data, do
//
//     final orderStatusModel = orderStatusModelFromJson(jsonString);

import 'dart:convert';

List<OrderStatusModel> orderStatusModelFromJson(String str) => List<OrderStatusModel>.from(json.decode(str).map((x) => OrderStatusModel.fromJson(x)));

String orderStatusModelToJson(List<OrderStatusModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderStatusModel {
    int orId;
    DateTime orDate;
    int orQty;
    int orAmount;
    int orStatus;
    int tableId;

    OrderStatusModel({
        required this.orId,
        required this.orDate,
        required this.orQty,
        required this.orAmount,
        required this.orStatus,
        required this.tableId,
    });

    factory OrderStatusModel.fromJson(Map<String, dynamic> json) => OrderStatusModel(
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
