import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'orderstatus_state.dart';

class OrderstatusCubit extends Cubit<OrderstatusState> {
  final AuthenRepository authenRepository;
  final tableProvider tableproviders;
  final orderprovider orderproviders;
  OrderstatusCubit(
      {required this.authenRepository,
      required this.tableproviders,
      required this.orderproviders})
      : super(OrderstatusState());
//------of select order data to show to the order status page it is of order detail-------------
  Future<void> seletorderdata() async {
    emit(state.coppywith(status_c: selectorderdata.loading));
    var resault = await authenRepository.SelectByOrder(
        table_id: tableproviders.gettablelist.tableId);
    resault!.fold((Left) {
      log("No data it is error");
    }, (Right) {
      emit(state.coppywith(status_c: selectorderdata.success));
      orderproviders.selectOrderStatus(
          Right); // <---to correct the data the Orderoriovider
    });
  }

//-----------of to cut stock---------------------------

  Future<bool?> cut_stock() async {
    // emit(state.coppywith(status_c: selectorderdata.loading));
    var result = await authenRepository.cut_Stock(
        table_id: tableproviders.gettablelist.tableId);
    result!.fold((l) {
      log("Erro $l");
    }, (r) {
      //  emit(state.coppywith(status_c: selectorderdata.success));
    });
  }
}
