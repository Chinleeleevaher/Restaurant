// To parse this JSON data, do
//
//     final rejectOrderModel = rejectOrderModelFromJson(jsonString);

import 'dart:convert';

List<RejectOrderModel> rejectOrderModelFromJson(String str) => List<RejectOrderModel>.from(json.decode(str).map((x) => RejectOrderModel.fromJson(x)));

String rejectOrderModelToJson(List<RejectOrderModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RejectOrderModel {
    int rejectId;
    int orId;
    String productId;
    int qty;
    int amount;
    int status;
    int tableId;
    String productName;

    RejectOrderModel({
        required this.rejectId,
        required this.orId,
        required this.productId,
        required this.qty,
        required this.amount,
        required this.status,
        required this.tableId,
        required this.productName,
    });

    factory RejectOrderModel.fromJson(Map<String, dynamic> json) => RejectOrderModel(
        rejectId: json["reject_id"],
        orId: json["or_id"],
        productId: json["product_id"],
        qty: json["qty"],
        amount: json["amount"],
        status: json["status"],
        tableId: json["table_id"],
        productName: json["product_name"],
    );

    Map<String, dynamic> toJson() => {
        "reject_id": rejectId,
        "or_id": orId,
        "product_id": productId,
        "qty": qty,
        "amount": amount,
        "status": status,
        "table_id": tableId,
        "product_name": productName,
    };
}
