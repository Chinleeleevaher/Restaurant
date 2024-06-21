import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';
import 'package:myproject/homepage/kitchen/model/orderbyOrderStatusModel.dart';
import 'package:myproject/homepage/kitchen/model/orderdetailModel.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'kitchen_state.dart';

class KitchenCubit extends Cubit<KitchenState> {
  final AuthenRepository authenRepository;
 // final kitchenProvider kitchenProvide;
  KitchenCubit({
    required this.authenRepository,
   // required this.kitchenProvide
    }) : super(KitchenState());

//..........of get order by order status for kitchen...............
  Future<void> SelectorderbyOrderStatus() async {
   emit(state.coppywith(status_c: statuslist.loading));
      var result = await authenRepository.GetOrderByOrderStatus();
      result!.fold((l) {
        log("Update status error $l");
      }, (Right) {
        emit(state.coppywith(listOrder_c: Right));
      
        emit(state.coppywith(status_c: statuslist.success));
      });
  }
//..........type select order id.................
ontypeSelect(OrderStatusModel? value){
emit(state.coppywith(typeSeletOrderId_c: value!));
 // kitchenProvide.TogetgetOrderlist(value);
log("select already");
 SelectOrderdetail_kitchen();

}
  // ...........of get order detail by order status for kitchen............
  Future<void> SelectOrderdetail_kitchen()async{
      emit(state.coppywith(status_c: statuslist.loading));
      var result = await authenRepository.getOrderdetail_kitchen(
        or_ids: state.typeSeletOrderId!.orId);
      result!.fold((l) {
        log("Update status error $l");
      }, (Right) {
        emit(state.coppywith(listOrderdetail_c: Right));
        emit(state.coppywith(status_c: statuslist.success));
      });
  }
  // ...........of get update tatble status and order status for kitchen............
  Future<void> getupdateTableStatus_orStatus()async{
      emit(state.coppywith(status_c: statuslist.loading));
      var result = await authenRepository.getupdateTableStatus_OrderStatus(
         or_id: state.typeSeletOrderId!.orId, 
         table_id: state.typeSeletOrderId!.tableId);
      result!.fold((l) {
        log("Update status error $l");
      }, (Right) {
        SelectorderbyOrderStatus();
        emit(state.coppywith(status_c: statuslist.success));
      
      });
  }
}
