// To parse this JSON data, do
//
//     final selectOrderToProviderMode = selectOrderToProviderModeFromJson(jsonString);

import 'dart:convert';

SelectOrderToProviderMode selectOrderToProviderModeFromJson(String str) => SelectOrderToProviderMode.fromJson(json.decode(str));

String selectOrderToProviderModeToJson(SelectOrderToProviderMode data) => json.encode(data.toJson());

class SelectOrderToProviderMode {
    int orId;
    DateTime orDate;
    int orQty;
    int orAmount;
    int orStatus;
    int tableId;
    int getmoney;
    int backmoney;
    String payment;

    SelectOrderToProviderMode({
        required this.orId,
        required this.orDate,
        required this.orQty,
        required this.orAmount,
        required this.orStatus,
        required this.tableId,
        required this.getmoney,
        required this.backmoney,
        required this.payment,
    });

    factory SelectOrderToProviderMode.fromJson(Map<String, dynamic> json) => SelectOrderToProviderMode(
        orId: json["or_id"],
        orDate: DateTime.parse(json["or_date"]),
        orQty: json["or_qty"],
        orAmount: json["or_amount"],
        orStatus: json["or_status"],
        tableId: json["table_id"],
        getmoney: json["getmoney"],
        backmoney: json["backmoney"],
        payment: json["payment"],
    );

    Map<String, dynamic> toJson() => {
        "or_id": orId,
        "or_date": orDate.toIso8601String(),
        "or_qty": orQty,
        "or_amount": orAmount,
        "or_status": orStatus,
        "table_id": tableId,
        "getmoney": getmoney,
        "backmoney": backmoney,
        "payment": payment,
    };
}
