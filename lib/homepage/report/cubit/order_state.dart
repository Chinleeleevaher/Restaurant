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
      orderlist: orderlist_c ?? this.orderlist,
      income: income_c ?? this.income,
      orderType: orderType_c?? this.orderType,
      productType: productType_c?? this.productType
    );
  }
}
