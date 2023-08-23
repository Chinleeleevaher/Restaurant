import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/homepage/table_page/model/tabletype.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'tabletype_state.dart';

class TabletypeCubit extends Cubit<TabletypeState> {
  final AuthenRepository authenRepository;
  TabletypeCubit({
    required this.authenRepository,
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
      //if (state.typeSelect == null) return;
      //if (state.typeSelect != "") {
      emit(state.coppywith(status_c: tableliststatuse.loading));
      var result = await authenRepository.getTables(
          typeids: state.typeSelect == null? 0 : state.typeSelect!.tabletypeId);
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
  onTypeSelect(value) {
    emit(state.coppywith(typeSelect_c: value));
    getTables();
  }
}
