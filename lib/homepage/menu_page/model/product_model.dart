// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productFromJson(String str) => List<ProductModel>.from(
    json.decode(str).map((x) => ProductModel.fromJson(x)));

String productToJson(List<ProductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
  String productId;
  String productName;
  int protypeId;
  int unitId;
  double price;
  double cost;
  String image;

  ProductModel({
    required this.productId,
    required this.productName,
    required this.protypeId,
    required this.unitId,
    required this.price,
    required this.cost,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        protypeId: json["protype_id"],
        unitId: json["unit_id"],
        price: json["price"]?.toDouble(),
        cost: json["cost"]?.toDouble(),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "protype_id": protypeId,
        "unit_id": unitId,
        "price": price,
        "cost": cost,
        "image": image,
      };
}
