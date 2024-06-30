

import 'dart:convert';

OrderproductImprotsModel orderproductImprotsModelFromJson(String str) => OrderproductImprotsModel.fromJson(json.decode(str));

String orderproductImprotsModelToJson(OrderproductImprotsModel data) => json.encode(data.toJson());

class OrderproductImprotsModel {
    int orpId;
    String productId;
    String orpName;
    int orpQty;
    int orpPrice;
    int orCost;
    int status;
    String image;

    OrderproductImprotsModel({
        required this.orpId,
        required this.productId,
        required this.orpName,
        required this.orpQty,
        required this.orpPrice,
        required this.orCost,
        required this.status,
        required this.image,
    });

    factory OrderproductImprotsModel.fromJson(Map<String, dynamic> json) => OrderproductImprotsModel(
        orpId: json["orp_id"],
        productId: json["product_id"],
        orpName: json["orpName"],
        orpQty: json["orpQty"],
        orpPrice: json["orpPrice"],
        orCost: json["orCost"],
        status: json["status"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "orp_id": orpId,
        "product_id": productId,
        "orpName": orpName,
        "orpQty": orpQty,
        "orpPrice": orpPrice,
        "orCost": orCost,
        "status": status,
        "image": image,
    };
}
