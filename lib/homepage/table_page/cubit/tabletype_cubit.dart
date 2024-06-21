import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/order/cubit/lisproduct_cubit.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/homepage/table_page/model/tabletype.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'tabletype_state.dart';

class TabletypeCubit extends Cubit<TabletypeState> {
  final tableProvider tableprovider;
  final AuthenRepository authenRepository;
  TabletypeCubit({
    required this.authenRepository,
    required this.tableprovider,
  }) : super(
          TabletypeState(
              listtabletype: [Tabletype(tabletypeId: 0, tabletypeName: 'all')]),
        );

  Future<void> getTabletypes() async {
    emit(state.coppywith(status_c: tableliststatuse.loading));
    var result = await authenRepository.getTabletype();
    result.fold(
      (f) {
        log('errro');
      },
      (data) async {
        //   log('success ' + data.length.toString());
        emit(state.coppywith(
            listtabltype_c: state.listtabletype! + data,
            status_c: tableliststatuse.success));
      },
    );
  }

//--------of table--------------
  Future<void> getTables() async {
    try {
      emit(state.coppywith(status_c: tableliststatuse.loading));
      var result = await authenRepository.getTables(
          typeids:
              state.typeSelect == null ? 0 : state.typeSelect!.tabletypeId, table_status: 0);
      result.fold(
        (f) {
          log('errro');
        },
        (datas) async {
          log('success ' + datas.length.toString());
          emit(state.coppywith(
              listtable_c: datas, status_c: tableliststatuse.success));
        },
      );
      //}
    } catch (e) {
      throw Exception("error: $e");
    }
  }

//-----------------------------------------------
  onTypeSelect(value) {
    emit(state.coppywith(typeSelect_c: value));
    getTables();
  }

  //----------<to ordertable product list>-----------
  ontypetablelist(Tables value) {
    tableprovider.settablelist(value);
    var tablelist = Tables(
        tableId: value.tableId,
        tableName: value.tableName,
        tableSize: value.tableSize,
        tableStatus: value.tableStatus,
        tabletypeId: value.tabletypeId);
    tableprovider.settablelist(tablelist);
    getOrdertoprovider();
  }

  //----------to get order to provider to make update in payment---------
  Future<void> getOrdertoprovider() async {
    var result = await authenRepository.ToSelectOrderToprovider(
        table_id: tableprovider.gettablelist.tableId);
    result!.fold((Left) {
      log("error $Left");
    }, (Right) {
      log('orderid=====>$Right');
      tableprovider.getorderID(Right);
    });
  }
}
