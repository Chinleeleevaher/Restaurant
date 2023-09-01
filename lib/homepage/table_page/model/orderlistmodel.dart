// To parse this JSON data, do
//
//     final ordertable = ordertableFromJson(jsonString);

import 'dart:convert';

Ordertable ordertableFromJson(String str) => Ordertable.fromJson(json.decode(str));

String ordertableToJson(Ordertable data) => json.encode(data.toJson());

class Ordertable {
    int orId;
    String orDate;
    int orQty;
    int orAmount;
    int orStatus;
    int tableId;

    Ordertable({
        required this.orId,
        required this.orDate,
        required this.orQty,
        required this.orAmount,
        required this.orStatus,
        required this.tableId,
    });

    factory Ordertable.fromJson(Map<String, dynamic> json) => Ordertable(
        orId: json["or_id"],
        orDate: json["or_date"],
        orQty: json["or_qty"],
        orAmount: json["or_amount"],
        orStatus: json["or_status"],
        tableId: json["table_id"],
    );

    Map<String, dynamic> toJson() => {
        "or_id": orId,
        "or_date": orDate,
        "or_qty": orQty,
        "or_amount": orAmount,
        "or_status": orStatus,
        "table_id": tableId,
    };
}
