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
  final BuildContext context;
  final tableProvider tableproviders;
  final AuthenRepository authenRepositorys;
  OrderCubit({
    required this.authenRepositorys,
    required this.tableproviders,
    required this.orderproviders,
    required this.context,
  }) : super(OrderState());
  //-----to update table status--------------
  Future<void> updatetablestatus() async {
    emit(state.coppywith(status_c: orderproductstatuse.loading));
    var result = await authenRepositorys.updatetablestattus(
        tablestatus: 1, table_id: tableproviders.gettablelist.tableId);
    result!.fold((l) {
      log("Update status error $l");
    }, (Right) {
      emit(state.coppywith(status_c: orderproductstatuse.success));
      orderproviders.ordertable(Right);
      postorderlist();
    });
  }

//----to order product list-------
  Future<void> postorderlist() async {
    emit(state.coppywith(status_c: orderproductstatuse.loading));
    var result = await authenRepositorys.orderpro(
        order_qty: orderproviders.totalqty,
        order_amount: orderproviders.totalprice.toInt(),
        order_table: tableproviders.gettablelist.tableId,
        order_status: orderproviders.tablestatus!.tableStatus);
    result.fold((f) {
      log("Error1111 $f");
    }, (data) {
      orderproviders.orderlisttable(
          data!); // <--here is to keep value to the orderprovider
      print("respomse $Right");
      emit(state.coppywith(status_c: orderproductstatuse.success));
      postorderdetail().then((value) {
        //---this below code is to make clear and send the value true back to the table page
        orderproviders.clearorderlist();
        Navigator.pop(context);
        Navigator.pop(context, true);
      }); // <--this is call from below fucntion
      //  updatetablestatus();// <--this is call from below fucntion
    });
  }

//----to inser oder detail product----
  Future<bool?> postorderdetail() async {
    for (int i = 0; i < orderproviders.getorderlist.length; i++) {
      emit(state.coppywith(status_c: orderproductstatuse.loading));
      var result = await authenRepositorys.orderproductdetail(
        order_id: orderproviders.getOrdertables!.orId, //--- get the value from order list table
        product_id: orderproviders.getorderlist[i].productId,
        table_id: tableproviders.gettablelist.tableId,
        qty: orderproviders.getorderlist[i].qty,
        amount: orderproviders.getorderlist[i].price * orderproviders.getorderlist[i].qty,
      );
      result!.fold((l) {
        log("Error detail=== $l");
      }, (r) {
        emit(state.coppywith(status_c: orderproductstatuse.success));
      });
    }
  }
  ontypeorderid(value){
    orderproviders.collectorderId(value);
  }
}
