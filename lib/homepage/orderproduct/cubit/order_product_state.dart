part of 'order_product_cubit.dart';

enum OrderProductStatus { initial, loading, success, error }
 class OrderProductState extends Equatable {
   OrderProductState({
    this.status = OrderProductStatus.initial,
    this.addqty
  });

 final OrderProductStatus status;
final int? addqty;
@override
  List<Object?> get props => [

        status,
        addqty
       
      ];

  OrderProductState coppywith(
      {
      OrderProductStatus? status_c,
      int? addqty_c,
      }){
return OrderProductState(
    
      status: status_c ?? this.status,
      addqty: addqty_c ?? this.addqty,

    );
      }
    
  }

