import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/orderproduct/component/billDailog.dart';
import 'package:myproject/homepage/orderproduct/provider/orderProduct.dart';
import 'package:myproject/homepage/report/component/printDailog.dart';
import 'package:myproject/repository/authen_sipository.dart';
import 'package:provider/provider.dart';

part 'order_product_state.dart';

class OrderProductCubit extends Cubit<OrderProductState> {
   final AuthenRepository authenRepository;
   final OrderProductProvider provider; 
     final BuildContext context;
  OrderProductCubit({
    required this.authenRepository,
    required this.provider,
    required this.context,
    
  }) : super(OrderProductState());
  //------ select Order product-------------------------
  Future<void> getOrderProdct() async {
    emit(state.coppywith(status_c: OrderProductStatus.loading));
    //  MyProgress().loadingProgress(context: context,title: 'Updating');
    // await Future.delayed(const Duration(seconds: 3)); // ....here is to waiting time........
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

 // ..........post order Product and make return.........................
  Future<void> PostOrderProduct() async {
    for(int i = 0; i < provider.getproductOrder!.length; i++){
    if(provider.getproductOrder![i].quantity != 0){
 emit(state.coppywith(status_c: OrderProductStatus.loading));
    var result = await authenRepository.PostOrderProduct(
      product_id: provider.getproductOrder![i].productId,
      product_name: provider.getproductOrder![i].productName, 
      product_Qty: provider.getproductOrder![i].quantity,
      product_price: provider.getproductOrder![i].price, 
      product_cost: provider.getproductOrder![i].cost, 
      product_image: provider.getproductOrder![i].image);
    result!.fold((l) {
   emit(state.coppywith(status_c: OrderProductStatus.error));
    }, (data) {
        provider.ToCollectprodutOrdert(data);
     
      emit(state.coppywith(status_c: OrderProductStatus.loading));
     // billDialog();
    });
    }

    }
  orderPrintDailog(context).then((value) => UpdateOrderProduct());
 
  getOrderProdct() ;
  }

  //.........update order product............
  //------ select Order product-------------------------
  Future<void> UpdateOrderProduct() async {
    for(int i = 0; i < provider.collectproductOrder!.length; i++){
  emit(state.coppywith(status_c: OrderProductStatus.loading));
    var result = await authenRepository.UpdateOrderProduct(
      productID: provider.collectproductOrder![i].productId.toString()
      );
    result!.fold((l) {
    }, (r) {
      emit(state.coppywith(status_c: OrderProductStatus.success));
    });
    }
  
  }
}
