// ignore_for_file: camel_case_types, non_constant_identifier_names

part of 'kitchen_cubit.dart';


enum statuslist { initial, loading, success, error }
 class KitchenState extends Equatable {
  const KitchenState({
    this.status = statuslist.initial,
    this.listOrder = const [],
    this.listOrderdetail = const [],
    this.typeSeletOrderId,
    this.loadBillStatus = statuslist.initial,
  });

final statuslist status;
final List<OrderStatusModel>? listOrder;
final List<OrderDetailModel>? listOrderdetail;
//final int? typeSeletOrderId;
final OrderStatusModel? typeSeletOrderId;
final statuslist loadBillStatus;

  @override
    List<Object?> get props => [
        listOrder,
        status,
        listOrderdetail,
        typeSeletOrderId,
        loadBillStatus,
        
      ];
  KitchenState coppywith({
    statuslist? status_c,
     List<OrderStatusModel>? listOrder_c,
     List<OrderDetailModel>? listOrderdetail_c,
     OrderStatusModel? typeSeletOrderId_c,
     statuslist? loadBillStatus,
  }) {
    return KitchenState(
      status: status_c ?? status,
      listOrder: listOrder_c ?? listOrder,
      listOrderdetail: listOrderdetail_c ?? listOrderdetail,
      typeSeletOrderId: typeSeletOrderId_c ?? typeSeletOrderId,
      loadBillStatus: loadBillStatus ?? this.loadBillStatus,
      );
  }
}

final class KitchenInitial extends KitchenState {}
