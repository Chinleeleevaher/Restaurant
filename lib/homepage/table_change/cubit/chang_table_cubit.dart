import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../repository/authen_sipository.dart';
import '../../table_page/cubit/provider/tableprovider.dart';
import '../../table_page/model/order_table_Model.dart';
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

//-------- slect table  table by type_id--------------
  Future<void> getTables() async {
    try {
      emit(state.coppywith(status_c: tableliststatuse.loading));
      var result = await authenRepository.getTables(
          typeids: state.typeSelect == null ? 0 : state.typeSelect!.tabletypeId,
          table_status: 0);
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
  //----method of select data from table of ( from table) and then plus the data to table that want to move to-----------------

  Future<void> getOrderFromTable(BuildContext context) async {
    try {
      if (tableprovider.fromtable_Id == 0 || tableprovider.totable_Id == 0) {
        // <---this i check the the table i want to ove first if have no chose then have to chose first
        Fluttertoast.showToast(
            msg: "please select the table you want to move first",
            gravity: ToastGravity.CENTER);
      } else {
        var result = await authenRepository.SelectByOrder(
            table_id: tableprovider.fromtable_Id);
        result!.fold((Left) {
          log("error");
        }, (Right) {
          tableprovider.getorderFromTableID(Right);
          getOrderToTable();
          Fluttertoast.showToast(
              msg: "Move Table sucusssful", gravity: ToastGravity.CENTER);
        });
      }
    } catch (e) {
      log("Error");
    }
  }

// ---method of select data from the table of (To table)-----
  Future<void> getOrderToTable() async {
    var result = await authenRepository.SelectByOrder(
        table_id: tableprovider.totable_Id);
    result!.fold((Left) {
      log("error");
    }, (Right) {
      tableprovider.getorderToTableID(Right);
      update_Move_table();
    });
  }
//------------------------Update move table---------------------------

  Future<void> update_Move_table() async {
    for (int i = 0; i < tableprovider.getMOvetableorder!.length; i++) {
      var result = await authenRepository.MoveTable(
        ord_id: tableprovider.getMOvetableorder![i].ordId,
        or_id: tableprovider.getMOvetableorder![i].orId!,
        product_id: tableprovider.getMOvetableorder![i].productId!,
        product_name: tableprovider.getMOvetableorder![i].productName,
        qty: tableprovider.getMOvetableorder![i].qty,
        amount: tableprovider.getMOvetableorder![i].amount.toDouble(),
      );
      result!.fold((l) {
        log("error");
      }, (r) {
        log("update sucessfull");
      });
    }
    if (tableprovider.getorderToTableid!.isNotEmpty) {
      // <---i just make check the table before i delete
      delete_move_table().then((value) {
        tableprovider
            .clearTable(); // <---this is make clear the two table ble that i move above in the ui page
        tableprovider.clearData(); //<----clear
        getTables(); // <---this is make reload again the table
      });
    } else {
      update_tbOrder_tableId(); // <----this is update the table_id in tborder and update table_status in tbtable
      updatetablestatus(); // <---this status update is working when the above finis update( it upda the from table to the emty status)
      getTables(); // <---this is make reload again the table
      getTabletypes(); // <-----this is make reload the table type
      tableprovider
          .clearTable(); // <---this is make clear the two table ble that i move above in the ui page
      tableprovider
          .clearData(); // <---- this make clear the provider in table provider
    }
  }

//--------of delete move table------------------
  Future<void> delete_move_table() async {
    for (int i = 0; i < tableprovider.getorderFromTableid!.length; i++) {
      var result = await authenRepository.delete_move_table(
        or_id: tableprovider.getorderFromTableid![i].orId!,
      );
      result!.fold((l) {
        log("error");
      }, (r) {
        log("update sucessfull");
      });
    }
    updatetablestatus();
  }

//------------update table_id in order table---------------
  Future<bool?> update_tbOrder_tableId() async {
    var result = await authenRepository.updateTable_id(
        or_id: tableprovider.getMOvetableorder![0].orId!,
        table_id: tableprovider.totable_Id,
        table_status: 1);
    result!.fold((l) {
      log("error");
    }, (r) {
      log("sucess");
    });
  }

  //-----to update From table status again--------------
  Future<void> updatetablestatus() async {
    for (int i = 0; i < tableprovider.getorderFromTableid!.length; i++) {
      var result = await authenRepository.updatetablestattus(
          tablestatus: 0,
          table_id: tableprovider.getorderFromTableid![i].tableId);
      result!.fold((l) {
        log("Update status error $l");
      }, (Right) {});
    }
  }

//---------------of product type--------------------------------
  onTypeSelect(value) {
    emit(state.coppywith(typeSelect_c: value));
    getTables();
  }

//----to get the value from the move table of ( from )---------
  onTypeSelecttablefrom(value) {
    if (value == "1") {
      tableprovider.setfromtable(value);
      selectTableByStatus_Of_FromTable(); //<---this is make select the table status by table you want to select
    } else {
      tableprovider.setfromtable(value);
      selectTableByStatus_Of_ToTable();
    }
  }

  // ------here is to select only the table of status = 1. ot use only for move table----
  //--------of table--------------
  Future<void> selectTableByStatus_Of_FromTable() async {
    try {
      emit(state.coppywith(status_c: tableliststatuse.loading));
      var result =
          await authenRepository.getTables(typeids: 0, table_status: 1);
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

  // ------here is to select only the table of status = 1. ot use only for move table----
  //--------of table--------------
  Future<void> selectTableByStatus_Of_ToTable() async {
    try {
      emit(state.coppywith(status_c: tableliststatuse.loading));
      var result =
          await authenRepository.getTables(typeids: 0, table_status: 0);
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

  //----------<to collect the table data>-----------
  ontypechangetable(Tables value) {
    tableprovider.movetable(value);
    //----------this is must call this fucntion to collect the data first befor go to the order list page------------------------------
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

  //----------to get ordert ro provider to make update in payment again if i come to this page---------
  Future<void> getOrdertoprovider() async {
    var result = await authenRepository.ToSelectOrderToprovider(
        table_id: tableprovider.gettablelist.tableId);
    result!.fold((Left) {
      log("error");
    }, (Right) {
      tableprovider.getorderID(Right);
    });
  }
}
