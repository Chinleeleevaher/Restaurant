// To parse this JSON data, do
//
//     final getOrderDetailModel = getOrderDetailModelFromJson(jsonString);

import 'dart:convert';

List<GetOrderDetailModel> getOrderDetailModelFromJson(String str) => List<GetOrderDetailModel>.from(json.decode(str).map((x) => GetOrderDetailModel.fromJson(x)));

String getOrderDetailModelToJson(List<GetOrderDetailModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetOrderDetailModel {
    int ordId;
    int orId;
    String productId;
    int qty;
    int amount;
    DateTime ordDate;
    int tableId;
    DateTime orDate;
    String productName;

    GetOrderDetailModel({
        required this.ordId,
        required this.orId,
        required this.productId,
        required this.qty,
        required this.amount,
        required this.ordDate,
        required this.tableId,
        required this.orDate,
        required this.productName,
    });

    factory GetOrderDetailModel.fromJson(Map<String, dynamic> json) => GetOrderDetailModel(
        ordId: json["ord_id"],
        orId: json["or_id"],
        productId: json["product_id"],
        qty: json["qty"],
        amount: json["amount"],
        ordDate: DateTime.parse(json["ord_date"]),
        tableId: json["table_id"],
        orDate: DateTime.parse(json["or_date"]),
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
        "or_date": orDate.toIso8601String(),
        "product_name": productName,
    };
}
