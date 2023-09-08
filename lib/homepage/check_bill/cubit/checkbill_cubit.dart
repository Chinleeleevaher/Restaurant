import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'checkbill_state.dart';

class CheckbillCubit extends Cubit<CheckbillState> {
  final BuildContext context;
  final AuthenRepository authenRepository;
  final tableProvider tableproviders;
  CheckbillCubit(
      {required this.context,
      required this.authenRepository,
      required this.tableproviders})
      : super(CheckbillState());

  TextEditingController getmoney = TextEditingController();
  TextEditingController backmoney = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String?selectedRadio; 
  //----here is update payment -------
  Future<bool?> update_tbOrder() async {
    if (formkey.currentState!.validate()) {
      formkey.currentState!.save();
      emit(state.coppywith(
        status_c: statuslist.loading,
      ));

      var result = await authenRepository.update_tbOrder(
          backmoney: double.parse(backmoney.text),
          getmoney: double.parse(getmoney.text),
          or_id: tableproviders.getorderid!.orId,
          payment: selectedRadio.toString());
      result!.fold((l) {
        log("error");
      }, (r) {
        log("sucess");
        updatetablestatus().then((value) {
          Navigator.pop(context);
          Navigator.pop(context, true);
        });
        ;
      });
    }
  }

  Future<void> updatetablestatus() async {
    var result = await authenRepository.updatetablestattus(
        tablestatus: 0, table_id: tableproviders.gettablelist.tableId);
    result!.fold((l) {
      log("Update status error $l");
    }, (Right) {});
  }
}
