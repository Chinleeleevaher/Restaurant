// To parse this JSON data, do
//
//     final table = tableFromJson(jsonString);

import 'dart:convert';

List<Tables> tableFromJson(String str) =>
    List<Tables>.from(json.decode(str).map((x) => Tables.fromJson(x)));

String tableToJson(List<Tables> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Tables {
  int tableId;
  String tableName;
  int tableSize;
  int tabletypeId;
  int tableStatus;

  Tables({
    required this.tableId,
    required this.tableName,
    required this.tableSize,
    required this.tabletypeId,
    required this.tableStatus,
  });

  factory Tables.fromJson(Map<String, dynamic> json) => Tables(
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
