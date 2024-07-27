// To parse this JSON data, do
//
//     final postorderProductModel = postorderProductModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<PostorderProductModel> postorderProductModelFromJson(String str) => List<PostorderProductModel>.from(json.decode(str).map((x) => PostorderProductModel.fromJson(x)));

String postorderProductModelToJson(List<PostorderProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PostorderProductModel {
    int orpId;
    String productId;
    String orpName;
    int orpQty;
    int orpPrice;
    int orCost;
    int status;
    String billnumber;
    String orpDate;
    String image;

    PostorderProductModel({
        required this.orpId,
        required this.productId,
        required this.orpName,
        required this.orpQty,
        required this.orpPrice,
        required this.orCost,
        required this.status,
        required this.billnumber,
        required this.orpDate,
        required this.image,
    });

    factory PostorderProductModel.fromJson(Map<String, dynamic> json) => PostorderProductModel(
        orpId: json["orp_id"],
        productId: json["product_id"],
        orpName: json["orpName"],
        orpQty: json["orpQty"],
        orpPrice: json["orpPrice"],
        orCost: json["orCost"],
        status: json["status"],
        billnumber: json["billnumber"],
        orpDate: json["orp_date"],
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
        "billnumber": billnumber,
        "orp_date": orpDate,
        "image": image,
    };
}
