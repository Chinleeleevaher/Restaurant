// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

List<OrderproductModel> orderproductFromJson(String str) =>
    List<OrderproductModel>.from(
        json.decode(str).map((x) => OrderproductModel.fromJson(x)));

String productToJson(List<OrderproductModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderproductModel {
  String productId;
  String productName;
  int protypeId;
  int unitId;
  int qty;
  double total;
  double amount;
  double price;
  double cost;
  String image;

  OrderproductModel({
    required this.productId,
    required this.productName,
    required this.protypeId,
    required this.unitId,
    required this.qty,
    required this.total,
    required this.amount,
    required this.price,
    required this.cost,
    required this.image,
  });

  factory OrderproductModel.fromJson(Map<String, dynamic> json) =>
      OrderproductModel(
        productId: json["product_id"],
        productName: json["product_name"],
        protypeId: json["protype_id"],
        unitId: json["unit_id"],
        qty: json["qty"],
        total: json["total"],
        amount: json["amount"],
        price: json["price"]?.toDouble(),
        cost: json["cost"]?.toDouble(),
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "product_name": productName,
        "protype_id": protypeId,
        "unit_id": unitId,
        "qty": qty,
        "total": total,
        "amount": amount,
        "price": price,
        "cost": cost,
        "image": image,
      };
}
