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
    String productName;
    int qty;
    int amount;
    DateTime ordDate;

    GetOrderDetailModel({
        required this.ordId,
        required this.orId,
        required this.productId,
        required this.productName,
        required this.qty,
        required this.amount,
        required this.ordDate,
    });

    factory GetOrderDetailModel.fromJson(Map<String, dynamic> json) => GetOrderDetailModel(
        ordId: json["ord_id"],
        orId: json["or_id"],
        productId: json["product_id"],
        productName: json["product_name"],
        qty: json["qty"],
        amount: json["amount"],
        ordDate: DateTime.parse(json["ord_date"]),
    );

    Map<String, dynamic> toJson() => {
        "ord_id": ordId,
        "or_id": orId,
        "product_id": productId,
        "product_name": productName,
        "qty": qty,
        "amount": amount,
        "ord_date": ordDate.toIso8601String(),
    };
}
