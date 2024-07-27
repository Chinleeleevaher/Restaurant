// ignore_for_file: non_constant_identifier_names, camel_case_types

part of 'order_cubit.dart';

enum orderlistreportstatus { initail, loading, success, error }

class OrderReportState extends Equatable {
  const OrderReportState({
    this.status = orderlistreportstatus.initail,
    this.orderlist = const [],
    this.orderType = 0,
    this.productType = 0,
    this.income = const [],
  });
  final orderlistreportstatus status;
  final List<SelectOrderReportModel>? orderlist;
  final List<IncomeModel>? income;
  final int orderType;
  final int productType;
  @override
  List<Object?> get props => [status, orderlist, orderType,productType,income];

  OrderReportState coppywith(
      {orderlistreportstatus? status,
      List<SelectOrderReportModel>? orderlist_c,
      List<IncomeModel>? income_c,
      int? orderType_c,
      int? productType_c
      }) {
    return OrderReportState(
      status: status ?? this.status,
      orderlist: orderlist_c ?? orderlist,
      income: income_c ?? income,
      orderType: orderType_c?? orderType,
      productType: productType_c?? productType
    );
  }
}
