import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../repository/authen_sipository.dart';
import '../../table_page/cubit/provider/tableprovider.dart';
import '../../table_page/model/table.dart';
import '../../table_page/model/tabletype.dart';

part 'chang_table_state.dart';

class ChangTableCubit extends Cubit<ChangTableState> {
  final tableProvider tableprovider;
  final AuthenRepository authenRepository;
  ChangTableCubit({
    required this.authenRepository,
    required this.tableprovider,
  }) : super(
          ChangTableState(
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
              state.typeSelect == null ? 0 : state.typeSelect!.tabletypeId);
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

//---------------of product type--------------------------------
  onTypeSelect(value) {
    emit(state.coppywith(typeSelect_c: value));
    getTables();
  }

//----to get the value from the move table of ( from )---------
  onTypeSelecttablefrom(value) {
    tableprovider.setfromtable(value);
  }
  //----------<to collect the table data>-----------
  ontypechangetable(Tables value) {
    tableprovider.movetable(value);
    var tablelist = Tables(
        tableId: value.tableId,
        tableName: value.tableName,
        tableSize: value.tableSize,
        tableStatus: value.tableStatus,
        tabletypeId: value.tabletypeId);
    tableprovider.movetable(tablelist);
  }
}
