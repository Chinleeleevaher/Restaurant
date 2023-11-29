// To parse this JSON data, do
//
//     final addProductypeModel = addProductypeModelFromJson(jsonString);

import 'dart:convert';

List<AddProductypeModel> addProductypeModelFromJson(String str) => List<AddProductypeModel>.from(json.decode(str).map((x) => AddProductypeModel.fromJson(x)));

String addProductypeModelToJson(List<AddProductypeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddProductypeModel {
    int protypeId;
    String protypeName;

    AddProductypeModel({
        required this.protypeId,
        required this.protypeName,
    });

    factory AddProductypeModel.fromJson(Map<String, dynamic> json) => AddProductypeModel(
        protypeId: json["protype_id"],
        protypeName: json["protype_name"],
    );

    Map<String, dynamic> toJson() => {
        "protype_id": protypeId,
        "protype_name": protypeName,
    };
}
