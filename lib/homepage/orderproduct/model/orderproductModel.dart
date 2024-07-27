// To parse this JSON data, do
//
//     final orderProductModel = orderProductModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<OrderProductModel> orderProductModelFromJson(String str) => List<OrderProductModel>.from(json.decode(str).map((x) => OrderProductModel.fromJson(x)));

String orderProductModelToJson(List<OrderProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderProductModel {
    String productId;
    String productName;
    int protypeId;
    int unitId;
    int quantity;
    int price;
    int cost;
    String image;

    OrderProductModel({
        required this.productId,
        required this.productName,
        required this.protypeId,
        required this.unitId,
        required this.quantity,
        required this.price,
        required this.cost,
        required this.image,
    });

    factory OrderProductModel.fromJson(Map<String, dynamic> json) => OrderProductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        protypeId: json["protype_id"],
        unitId: json["unit_id"],
        quantity: json["quantity"],
        price: json["price"],
        cost: json["cost"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "protype_id": protypeId,
        "unit_id": unitId,
        "quantity": quantity,
        "price": price,
        "cost": cost,
        "image": image,
    };
}
