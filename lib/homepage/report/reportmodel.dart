// To parse this JSON data, do
//
//     final selectOrderReportModel = selectOrderReportModelFromJson(jsonString);

import 'dart:convert';

List<SelectOrderReportModel> selectOrderReportModelFromJson(String str) => List<SelectOrderReportModel>.from(json.decode(str).map((x) => SelectOrderReportModel.fromJson(x)));

String selectOrderReportModelToJson(List<SelectOrderReportModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SelectOrderReportModel {
    int orId;
    DateTime orDate;
    int orQty;
    int getmoney;
    int backmoney;
    int orAmount;
    int orStatus;
    int tableId;
    String payment;

    SelectOrderReportModel({
        required this.orId,
        required this.orDate,
        required this.orQty,
        required this.getmoney,
        required this.backmoney,
        required this.orAmount,
        required this.orStatus,
        required this.tableId,
        required this.payment,
    });

    factory SelectOrderReportModel.fromJson(Map<String, dynamic> json) => SelectOrderReportModel(
        orId: json["or_id"],
        orDate: DateTime.parse(json["or_date"]),
        orQty: json["or_qty"],
        getmoney: json["getmoney"],
        backmoney: json["backmoney"],
        orAmount: json["or_amount"],
        orStatus: json["or_status"],
        tableId: json["table_id"],
        payment: json["payment"],
    );

    Map<String, dynamic> toJson() => {
        "or_id": orId,
        "or_date": orDate.toIso8601String(),
        "or_qty": orQty,
        "getmoney": getmoney,
        "backmoney": backmoney,
        "or_amount": orAmount,
        "or_status": orStatus,
        "table_id": tableId,
        "payment": payment,
    };
}
