import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:myproject/repository/authen_sipository.dart';
import 'package:provider/provider.dart';

part 'order_product_state.dart';

class OrderProductCubit extends Cubit<OrderProductState> {
   final AuthenRepository authenRepository;
   final OrderProductProvider provider; 
  OrderProductCubit({
    required this.authenRepository,
    required this.provider,
    
  }) : super(OrderProductState());
  //------ select product to make report-------------------------
  Future<void> getOrderProdct() async {
    emit(state.coppywith(status_c: OrderProductStatus.loading));
    var result = await authenRepository.getOrder_Product();
    result!.fold((l) {
      print("No data It is error");
    }, (r) {
      provider.TogetgetprodutOrdert(r);
      emit(state.coppywith(status_c: OrderProductStatus.success));
    });
  }
//increment
  ontype(value){
    provider.collectQty(value);
  }
  //minus
  ontypeminus(value){
    provider.minustQty(value);
  }
}
