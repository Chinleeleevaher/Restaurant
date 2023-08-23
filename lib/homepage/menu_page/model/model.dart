// To parse this JSON data, do
//
//     final producttype = producttypeFromJson(jsonString);

import 'dart:convert';

List<Producttype> producttypeFromJson(String str) => List<Producttype>.from(
    json.decode(str).map((x) => Producttype.fromJson(x)));

String producttypeToJson(List<Producttype> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Producttype {
  int protypeId;
 // String unitId;
  String protypeName;

  Producttype({
    required this.protypeId,
   // required this.unitId,
    required this.protypeName,
  });

  factory Producttype.fromJson(Map<String, dynamic> json) => Producttype(
        protypeId: json["protype_id"],
      //  unitId: json["unit_id"],
        protypeName: json["protype_name"],
      );

  Map<String, dynamic> toJson() => {
        "protype_id": protypeId,
       // "unit_id": unitId,
        "protype_name": protypeName,
      };
}
