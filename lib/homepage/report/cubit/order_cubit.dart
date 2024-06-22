import 'dart:developer';

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

  typeOrderReport(int orderTap) {
    emit(state.coppywith(orderType_c: orderTap));
    if (orderTap == 1) {
      /// fetch order data
      getOrderReport();
    } else {
      /// fetch product
      selectproduct_makeReport();
    }
  }

  //-----of date time picker-------------
  DateTime from_pickdate = DateTime.now().subtract(Duration(
      days: 5)); // <--here is to set the default date to from 5 days ago
  DateTime To_pickdate = DateTime.now();

//----------here is to get order report---------------------------
  Future<void> getOrderReport() async {
    emit(state.coppywith(status: orderlistreportstatus.loading));
    var result = await authenRepository.getOrderReport(
        fromdate: from_pickdate, todate: To_pickdate);
    result!.fold((l) {
      emit(state.coppywith(status: orderlistreportstatus.error));
    }, (data) {
      reportProvider.OrderReport(data);
      emit(state.coppywith(
          status: orderlistreportstatus.success, orderlist_c: data));
      log('status2----${state.status}');
    });
  }

// --------this is collect the data of order from the report page to the provider-------------------
  Future getorderdetail(SelectOrderReportModel value) async {
    reportProvider.setOrderlistReport(value);
    seletorderdata(context);
  }

//------of select orderdetail data to show to the order status page-------------
  Future<void> seletorderdata(BuildContext context) async {
    emit(state.coppywith(status: orderlistreportstatus.loading));
    var resault = await authenRepository.SelectordertoReport(
        or_id: reportProvider.getorderlistReport.orId);
    resault!.fold((Left) {
      print("No data it is error");
    }, (data) {
      emit(state.coppywith(status: orderlistreportstatus.success));
      reportProvider.selectOrderdetailreport(
          data); // <---to correct the data to the Orderoriovider
      simpledailog(context);
    });
  }

//------ select product to make report-------------------------
  Future<void> selectproduct_makeReport() async {
    emit(state.coppywith(status: orderlistreportstatus.loading));
    var result = await authenRepository.getproductmakeReport();
    result!.fold((l) {
      print("No data It is error");
    }, (r) {
      reportProvider.TogetgetprodutReport(r);
      selectorderdetail_makeReport();
      emit(state.coppywith(status: orderlistreportstatus.success));
    });
  }

  //------ select order detail specail form make loop for product report because i nneed sell qty, all qty......-------------------------
  Future<void> selectorderdetail_makeReport() async {
    emit(state.coppywith(status: orderlistreportstatus.loading));
    var result = await authenRepository.getorderdetailmakeReport(
        fromdate: from_pickdate, todate: To_pickdate);
    result!.fold((l) {
      print("No data It is error");
    }, (r) {
      reportProvider.TogetorderdetailReport(r);
      emit(state.coppywith(status: orderlistreportstatus.success));
    });
  }
}
