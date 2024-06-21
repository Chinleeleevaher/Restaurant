part of 'kitchen_cubit.dart';


enum statuslist { initial, loading, success, error }
 class KitchenState extends Equatable {
  const KitchenState({
    this.status = statuslist.initial,
    this.listOrder = const [],
    this.listOrderdetail = const [],
    this.typeSeletOrderId
  });

final statuslist status;
final List<OrderStatusModel>? listOrder;
final List<OrderDetailModel>? listOrderdetail;
//final int? typeSeletOrderId;
final OrderStatusModel? typeSeletOrderId;

  @override
    List<Object?> get props => [
        listOrder,
        status,
        listOrderdetail,
        typeSeletOrderId
        
      ];
  KitchenState coppywith({
    statuslist? status_c,
     List<OrderStatusModel>? listOrder_c,
     List<OrderDetailModel>? listOrderdetail_c,
     OrderStatusModel? typeSeletOrderId_c
  }) {
    return KitchenState(
      status: status_c ?? this.status,
      listOrder: listOrder_c ?? this.listOrder,
      listOrderdetail: listOrderdetail_c ?? this.listOrderdetail,
      typeSeletOrderId: typeSeletOrderId_c ?? this.typeSeletOrderId,
      );
  }
}

final class KitchenInitial extends KitchenState {}
