import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/repository/authen_sipository.dart';

import '../../table_page/model/orderlistmodel.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final orderprovider orderproviders;
  final tableProvider tableproviders;
  final AuthenRepository authenRepositorys;
  OrderCubit({
    required this.authenRepositorys,
    required this.tableproviders,
    required this.orderproviders,
  }) : super(OrderState());

// //----to insert oder product--------
//   Future<void> postorderlist() async {
//     emit(state.coppywith(status_c: orderproductstatuse.loading));
//     var result = await authenRepositorys.orderpro(
//         order_qty: orderproviders.totalqty,
//         order_amount: orderproviders.totalprice.toInt(),
//         order_table: int.parse(tableproviders.tablenumber), order_status: 0);
//     result!.fold((Left) {
//       log("Error");
//     }, (Right) {
//       emit(state.coppywith(status_c: orderproductstatuse.success));
//     });
//   }

//--- get the value from order list table

//----to inser oder detail product----
Future<bool?> postorderdetail() async {
  for (int i = 0; i < orderproviders.getorderlist.length; i++) {
    emit(state.coppywith(status_c: orderproductstatuse.loading));
    var result = await authenRepositorys.orderproductdetail(
      order_id: orderproviders.getOrdertables!.orId,
      product_id: orderproviders.getorderlist[i].productId,
      product_name: orderproviders.getorderlist[i].productName,
      qty: orderproviders.getorderlist[i].qty,
      amount: orderproviders.getorderlist[i].amount,
    );
    result!.fold((l) {
      log("Error");
    }, (r) {
      emit(state.coppywith(status_c: orderproductstatuse.success));
    });
  }
}
}
