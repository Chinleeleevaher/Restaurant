// ignore_for_file: non_constant_identifier_names

part of 'order_product_cubit.dart';

enum OrderProductStatus { initial, loading, success, error }
 class OrderProductState extends Equatable {
   const OrderProductState({
    this.status = OrderProductStatus.initial,
    this.orderType = 0,
    this.addqty
  });

 final OrderProductStatus status;
final int? addqty;
final int orderType;
@override
  List<Object?> get props => [

        status,
        addqty,
        orderType
       
      ];

  OrderProductState coppywith(
      {
      OrderProductStatus? status_c,
      int? addqty_c,
       int? orderType_c,
      }){
return OrderProductState(
    
      status: status_c ?? status,
      addqty: addqty_c ?? addqty,
       orderType: orderType_c?? orderType,

    );
      }
    
  }

