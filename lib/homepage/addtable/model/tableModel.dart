// To parse this JSON data, do
//
//     final tableModel = tableModelFromJson(jsonString);

import 'dart:convert';

List<TableModel> tableModelFromJson(String str) => List<TableModel>.from(json.decode(str).map((x) => TableModel.fromJson(x)));

String tableModelToJson(List<TableModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class TableModel {
    int tableId;
    String tableName;
    int tableSize;
    int tabletypeId;
    int tableStatus;

    TableModel({
        required this.tableId,
        required this.tableName,
        required this.tableSize,
        required this.tabletypeId,
        required this.tableStatus,
    });

    factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
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
