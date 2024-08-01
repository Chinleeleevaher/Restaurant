// ignore_for_file: non_constant_identifier_names, use_build_context_synchronously

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/component/my_progress.dart';
import 'package:myproject/homepage/kitchen/cubit/provider/providerOrder_kitchen.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/model/order_table_Model.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'orderstatus_state.dart';

class OrderstatusCubit extends Cubit<OrderstatusState> {
  final AuthenRepository authenRepository;
  final tableProvider tableproviders;
  final orderprovider orderproviders;
  final kitchenProvider kitchenProviders;
  final BuildContext context;
  OrderstatusCubit(
      {required this.authenRepository,
      required this.tableproviders,
      required this.kitchenProviders,
      required this.context,
      required this.orderproviders})
      : super(const OrderstatusState());
//------of select order data to show to the order status page it is of order detail-------------
  Future<void> seletorderdata() async {
    emit(state.coppywith(status: selectorderdata.loading));
    var resault = await authenRepository.SelectByOrder(
        table_id: tableproviders.gettablelist.tableId,
         or_status: tableproviders.getOrdrStatus);
    resault!.fold((Left) {
      log("No data it is error");
    }, (data) {
      emit(state.coppywith(
          status: selectorderdata.success, selectOrderList: data));
      orderproviders.selectOrderStatus(
          data); // <---to correct the data the Orderoriovider
    });
  }

//-----------of to cut stock---------------------------

  Future<bool?> cut_stock() async {
     MyProgress().loadingProgress(
      context: context,
      title: 'ກໍາລັງດໍາເນີນການ',
    );
    await Future.delayed(const Duration(seconds: 1));
     emit(state.coppywith(status: selectorderdata.loading));
    var result = await authenRepository.cut_Stock(
        table_id: tableproviders.gettablelist.tableId);
    result!.fold((l) {
      log("Erro $l");
    }, (r) {
        emit(state.coppywith(status: selectorderdata.success));
    });
     Navigator.pop(context);
     return null;
  }

  ///... reject order.....
   Future<void> getrejectOrder() async {
    emit(state.coppywith(status: selectorderdata.loading));
    var resault = await authenRepository.getrejectOrder(
        table_id: tableproviders.gettablelist.tableId,
        );
    resault!.fold((Left) {
      log("No data it is error");
    }, (data) {
      kitchenProviders.Togetgetrejectorder(data);
      emit(state.coppywith(
          status: selectorderdata.success));
       
    });
  }
}
