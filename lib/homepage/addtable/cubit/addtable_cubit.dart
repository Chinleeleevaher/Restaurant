import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/homepage/addtable/provider.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'addtable_state.dart';

class AddtableCubit extends Cubit<AddtableState> {
  final AuthenRepository authenRepositorys;
  final tableProviderss tableproviders;

  AddtableCubit({
    required this.authenRepositorys,
    required this.tableproviders,

  }) : super(const AddtableState());
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final tableName = TextEditingController();
  final tableSize = TextEditingController();
 

  bool isAdd = true;

  ontypeTabletype(int value) {
    emit(state.coppywith(tableType_c: value));
  }

  //---Add Unit----------
  Future<void> adtable() async {
    emit(state.coppywith(status_c: tablestatuse.loading));
    var result = await authenRepositorys.adtable(
      tableName: tableName.text,
      tabletype: state.tableType,
      tableSize: int.parse(tableSize.text),
    );
    result.fold((f) {  getTatble();}, (r) {
      tableName.clear();
      tableSize.clear();
      state.tableType == 0;
              getTatble();
      emit(state.coppywith(status_c: tablestatuse.success));
        getTatble();
    });
  }
  //   //---get table----------

  Future<void> getTatble() async {
    emit(state.coppywith(status_c: tablestatuse.loading));
    var result = await authenRepositorys.getTatble();
    result.fold((f) {
    }, (data) {
      //log('Successful : $r');
      tableproviders.Togettable(data!);
      emit(state.coppywith(status_c: tablestatuse.success));
    });
  }

    // ---delet table---------

    ontypeDelete(int value){
      deleteTable(value);
    }
    // ---delet table---------
  Future<void> deleteTable(int value) async {
    emit(state.coppywith(status_c: tablestatuse.loading));
    var result = await authenRepositorys.deleteTable(table_id: value);
    result!.fold((f) {
        getTatble();
    }, (r) {
          getTatble();
      emit(state.coppywith(status_c: tablestatuse.success));
          getTatble();
    });
  }

  ///..........update table..........................
  
  ontypeUpdate(value){
    tableproviders.gettableUpdates(value);
    tableName.text = tableproviders.tableUpdate!.tableName;
    tableSize.text = tableproviders.tableUpdate!.tableSize.toString();
  }
  ///..........update table..........................
  Future<void> updateTable() async {
     emit(state.coppywith(status_c: tablestatuse.loading));
    // ........here is to make the text to show to the textfield............

    var result = await authenRepositorys.updateTable(
      tableId: tableproviders.tableUpdate!.tableId,
       tablename: tableName.text, 
       tsize: int.parse(tableSize.text),
       ttype: state.tableType
    
    );
    result.fold(
      (f) {
      },
      (data) async {
        Fluttertoast.showToast(
            msg: "update sucessful", gravity: ToastGravity.CENTER);
        //----make clear data------
        tableName.clear();
      tableSize.clear();
      state.tableType == 0;
        isAdd = true;
       getTatble();
         emit(state.coppywith(status_c: tablestatuse.success));
         getTatble();
        //   getproductype();
// <--here is to back to the product page and send value ( true ) back to the cubit of product cubit to make reflesh
      },
    );
  }
}
