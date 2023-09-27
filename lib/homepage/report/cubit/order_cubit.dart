import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/report/providerReport.dart';
import 'package:myproject/homepage/table_change/cubit/chang_table_cubit.dart';
import 'package:myproject/repository/authen_sipository.dart';
import '../../order/provider.dart';
import '../component/dailogbill.dart';
import '../reportmodel.dart';
part 'order_state.dart';

class OrderReportCubit extends Cubit<OrderReportState> {
  final AuthenRepository authenRepository;
  final orderprovider orderproviders;
  final ReportProvider reportProvider;
  final BuildContext context;
  OrderReportCubit({
    required this.authenRepository,
    required this.orderproviders,
    required this.reportProvider,
    required this.context,
  }) : super(OrderReportState());

  typeOrderReport(int value) {
    emit(state.coppywith(orderType_c: value));
    getOrderReport();
  }


  //-----of date time picker-------------
  DateTime from_pickdate = DateTime.now().subtract(Duration(days: 5)); // <--here is to set the default date to from 5 days ago
  DateTime To_pickdate = DateTime.now();

//----------here is to get order report---------------------------
  Future<void> getOrderReport() async {
    emit(state.coppywith(status_c: orderlistreportstatus.loading));
    var result = await authenRepository.getOrderReport(fromdate: from_pickdate, todate: To_pickdate);
    result!.fold((l) {
      print("Error");
    }, (r) {
      orderproviders.OrderReport(r);
      emit(state.coppywith(orderlist_c: r));
      emit(state.coppywith(status_c: orderlistreportstatus.success));
    });
  }

// --------this is collect the data of order from the report page to the provider-------------------
  Future getorderdetail(SelectOrderReportModel value) async {
    orderproviders.setOrderlistReport(value);
    seletorderdata(context);
  }

//------of select orderdetail data to show to the order status page-------------
  Future<void> seletorderdata(BuildContext context) async {
    emit(state.coppywith(status_c: orderlistreportstatus.loading));
    var resault = await authenRepository.SelectordertoReport(
        or_id: orderproviders.getorderlistReport.orId);
    resault!.fold((Left) {
      print("No data it is error");
    }, (Right) {
      emit(state.coppywith(status_c: orderlistreportstatus.success));
      orderproviders.selectOrderdetailreport(
          Right); // <---to correct the data to the Orderoriovider
      simpledailog(context);
    });
  }
  //--------------of type product for report--------------------
  TypeProductReport(int value) {
    // <-----here is to get the value to the state and make check in the report ui
    emit(state.coppywith(productType_c: value));
    selectproduct_makeReport().then((value) => selectorderdetail_makeReport());
  }
//------ select product to make report-------------------------
  Future<void> selectproduct_makeReport() async {
    emit(state.coppywith(status_c: orderlistreportstatus.loading));
    var result = await authenRepository.getproductmakeReport();
    result!.fold((l) {
      print("No data It is error");
    }, (r) {
      reportProvider.TogetgetprodutReport(r);
      emit(state.coppywith(status_c: orderlistreportstatus.success));
    });
  }

  //------ select product to make report-------------------------
  Future<void> selectorderdetail_makeReport() async {
    emit(state.coppywith(status_c: orderlistreportstatus.loading));
    var result = await authenRepository.getorderdetailmakeReport(fromdate: from_pickdate, todate: To_pickdate);
    result!.fold((l) {
      print("No data It is error");
    }, (r) {
      reportProvider.TogetorderdetailReport(r);
      emit(state.coppywith(status_c: orderlistreportstatus.success));
    });
  }
  
}
