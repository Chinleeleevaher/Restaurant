// To parse this JSON data, do
//
//     final tablestatus = tablestatusFromJson(jsonString);

import 'dart:convert';

Tablestatus tablestatusFromJson(String str) => Tablestatus.fromJson(json.decode(str));

String tablestatusToJson(Tablestatus data) => json.encode(data.toJson());

class Tablestatus {
    int tableId;
    String tableName;
    int tableSize;
    int tabletypeId;
    int tableStatus;

    Tablestatus({
        required this.tableId,
        required this.tableName,
        required this.tableSize,
        required this.tabletypeId,
        required this.tableStatus,
    });

    factory Tablestatus.fromJson(Map<String, dynamic> json) => Tablestatus(
        tableId: json["table_id"],
        tableName: json["table_name"],
        tableSize: json["table_size"],
        tabletypeId: json["tabletype_id"],
        tableStatus: json["table_status"],
    );

    Map<String, dynamic> toJson() => {
        "table_id": tableId,
        "table_name": tableName,
        "table_size": tableSize,
        "tabletype_id": tabletypeId,
        "table_status": tableStatus,
    };
}
