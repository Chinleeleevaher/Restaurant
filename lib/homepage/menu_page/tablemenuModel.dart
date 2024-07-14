// To parse this JSON data, do
//
//     final menutable = menutableFromJson(jsonString);

import 'dart:convert';

List<Menutable> menutableFromJson(String str) => List<Menutable>.from(json.decode(str).map((x) => Menutable.fromJson(x)));

String menutableToJson(List<Menutable> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Menutable {
    int tableId;
    String tableName;
    int tableSize;
    int tabletypeId;
    int tableStatus;

    Menutable({
        required this.tableId,
        required this.tableName,
        required this.tableSize,
        required this.tabletypeId,
        required this.tableStatus,
    });

    factory Menutable.fromJson(Map<String, dynamic> json) => Menutable(
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
