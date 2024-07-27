// To parse this JSON data, do
//
//     final unit = unitFromJson(jsonString);

// ignore_for_file: camel_case_types

import 'dart:convert';

List<punit> unitFromJson(String str) =>
    List<punit>.from(json.decode(str).map((x) => punit.fromJson(x)));

String unitToJson(List<punit> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class punit {
  int unitId;
  String unitName;

  punit({
    required this.unitId,
    required this.unitName,
  });

  factory punit.fromJson(Map<String, dynamic> json) => punit(
        unitId: json["unit_id"],
        unitName: json["unit_name"],
      );

  Map<String, dynamic> toJson() => {
        "unit_id": unitId,
        "unit_name": unitName,
      };
}
