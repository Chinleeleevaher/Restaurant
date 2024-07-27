// To parse this JSON data, do
//
//     final opBillidModel = opBillidModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<OpBillidModel> opBillidModelFromJson(String str) => List<OpBillidModel>.from(json.decode(str).map((x) => OpBillidModel.fromJson(x)));

String opBillidModelToJson(List<OpBillidModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class OpBillidModel {
    int orpId;
    String productId;
    String orpName;
    int orpQty;
    int orpPrice;
    int orCost;
    int status;
    String billnumber;
    DateTime orpDate;
    String image;

    OpBillidModel({
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

    factory OpBillidModel.fromJson(Map<String, dynamic> json) => OpBillidModel(
        orpId: json["orp_id"],
        productId: json["product_id"],
        orpName: json["orpName"],
        orpQty: json["orpQty"],
        orpPrice: json["orpPrice"],
        orCost: json["orCost"],
        status: json["status"],
        billnumber: json["billnumber"],
        orpDate: DateTime.parse(json["orp_date"]),
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
        "orp_date": orpDate.toIso8601String(),
        "image": image,
    };
}
