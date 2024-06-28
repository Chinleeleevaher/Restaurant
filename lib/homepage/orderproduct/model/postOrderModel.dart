// To parse this JSON data, do
//
//     final postorderProductModel = postorderProductModelFromJson(jsonString);

import 'dart:convert';

List<PostorderProductModel> postorderProductModelFromJson(String str) => List<PostorderProductModel>.from(json.decode(str).map((x) => PostorderProductModel.fromJson(x)));

String postorderProductModelToJson(List<PostorderProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostorderProductModel {
    int orpId;
    String productId;
    String orpName;
    int orpQty;
    int orpPrice;
    int status;
    String image;

    PostorderProductModel({
        required this.orpId,
        required this.productId,
        required this.orpName,
        required this.orpQty,
        required this.orpPrice,
        required this.status,
        required this.image,
    });

    factory PostorderProductModel.fromJson(Map<String, dynamic> json) => PostorderProductModel(
        orpId: json["orp_id"],
        productId: json["product_id"],
        orpName: json["orpName"],
        orpQty: json["orpQty"],
        orpPrice: json["orpPrice"],
        status: json["status"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "orp_id": orpId,
        "product_id": productId,
        "orpName": orpName,
        "orpQty": orpQty,
        "orpPrice": orpPrice,
        "status": status,
        "image": image,
    };
}
