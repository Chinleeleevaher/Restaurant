// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<OrderproductModelMenu> orderproductFromJson(String str) =>
    List<OrderproductModelMenu>.from(
        json.decode(str).map((x) => OrderproductModelMenu.fromJson(x)));

String productToJson(List<OrderproductModelMenu> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OrderproductModelMenu {
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

  OrderproductModelMenu({
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

  factory OrderproductModelMenu.fromJson(Map<String, dynamic> json) =>
      OrderproductModelMenu(
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
