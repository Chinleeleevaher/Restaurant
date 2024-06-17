// To parse this JSON data, do
//
//     final adUnitModel = adUnitModelFromJson(jsonString);

import 'dart:convert';

List<AdUnitModel> adUnitModelFromJson(String str) => List<AdUnitModel>.from(json.decode(str).map((x) => AdUnitModel.fromJson(x)));

String adUnitModelToJson(List<AdUnitModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AdUnitModel {
    int unitId;
    String unitName;

    AdUnitModel({
        required this.unitId,
        required this.unitName,
    });

    factory AdUnitModel.fromJson(Map<String, dynamic> json) => AdUnitModel(
        unitId: json["unit_id"],
        unitName: json["unit_name"],
    );

    Map<String, dynamic> toJson() => {
        "unit_id": unitId,
        "unit_name": unitName,
    };
}
