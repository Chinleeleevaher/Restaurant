// To parse this JSON data, do
//
//     final getProductModel = getProductModelFromJson(jsonString);

import 'dart:convert';

List<GetProductModel> getProductModelFromJson(String str) => List<GetProductModel>.from(json.decode(str).map((x) => GetProductModel.fromJson(x)));

String getProductModelToJson(List<GetProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetProductModel {
    String productId;
    String productName;
    int protypeId;
    int unitId;
    int price;
    int cost;
    int quantity;
    String image;

    GetProductModel({
        required this.productId,
        required this.productName,
        required this.protypeId,
        required this.unitId,
        required this.price,
        required this.cost,
        required this.quantity,
        required this.image,
    });

    factory GetProductModel.fromJson(Map<String, dynamic> json) => GetProductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        protypeId: json["protype_id"],
        unitId: json["unit_id"],
        price: json["price"],
        cost: json["cost"],
        quantity: json["quantity"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "protype_id": protypeId,
        "unit_id": unitId,
        "price": price,
        "cost": cost,
        "quantity": quantity,
        "image": image,
    };
}
