// To parse this JSON data, do
//
//     final tabletype = tabletypeFromJson(jsonString);

import 'dart:convert';

List<Tabletype> tabletypeFromJson(String str) => List<Tabletype>.from(json.decode(str).map((x) => Tabletype.fromJson(x)));

String tabletypeToJson(List<Tabletype> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tabletype {
    int tabletypeId;
    String tabletypeName;

    Tabletype({
        required this.tabletypeId,
        required this.tabletypeName,
    });

    factory Tabletype.fromJson(Map<String, dynamic> json) => Tabletype(
        tabletypeId: json["tabletype_id"],
        tabletypeName: json["tabletype_name"],
    );

    Map<String, dynamic> toJson() => {
        "tabletype_id": tabletypeId,
        "tabletype_name": tabletypeName,
    };
}
