part of 'order_cubit.dart';

enum orderlistreportstatus { initail, loading, success, error }

class OrderReportState extends Equatable {
  const OrderReportState({
    this.status = orderlistreportstatus.initail,
    this.orderlist = const [],
    this.orderType = 0,
    this.productType = 0,
  });
  final orderlistreportstatus status;
  final List<SelectOrderReportModel>? orderlist;
  final int orderType;
  final int productType;
  @override
  List<Object?> get props => [status, orderlist, orderType,productType];

  OrderReportState coppywith(
      {orderlistreportstatus? status_c,
      List<SelectOrderReportModel>? orderlist_c,
      int? orderType_c,
      int? productType_c
      }) {
    return OrderReportState(
      status: status_c ?? this.status,
      orderlist: orderlist_c ?? this.orderlist,
      orderType: orderType_c?? this.orderType,
      productType: productType_c?? this.productType
    );
  }
}

final class OrderInitial extends OrderReportState {}
