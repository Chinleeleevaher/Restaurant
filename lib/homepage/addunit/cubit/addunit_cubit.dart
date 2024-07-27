
// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/homepage/addunit/cubit/provider/AdUnitProvider.dart';
import 'package:myproject/repository/authen_sipository.dart';

part 'addunit_state.dart';

class AddunitCubit extends Cubit<AddunitState> {

    final AuthenRepository authenRepositorys;
  final UnitProvider Unitprovider;
  //final Producttype? productTypemodel;
  final BuildContext context;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final UnitName = TextEditingController();

  bool isAdd = true;

  AddunitCubit({
    required this.authenRepositorys,
    required this.Unitprovider,
  //  required this.productTypemodel,
    required this.context,
  }) : super(AddunitState());

  //---Add Unit----------

  Future<void> adUnit() async {
    emit(state.coppywith(status_c: unitstatuse.loading));

    var result = await authenRepositorys.adUnit(addpro: UnitName.text);
    result.fold((f) {
      log('errro 123');
      UnitName.clear();
    getUnit();
    }, (r) {
      log('Successful : $r');
       emit(state.coppywith(status_c: unitstatuse.success));
    });
  }

//   //---get Unit----------

  Future<void> getUnit() async {
    emit(state.coppywith(status_c: unitstatuse.loading));

    var result = await authenRepositorys.prUnit();
    result.fold((f) {
      log('errro');
    }, (r) {
      //log('Successful : $r');
      Unitprovider.TogeUnit(r!);
      emit(state.coppywith(status_c: unitstatuse.success));
    });
  }

  //----of delete Unit------
  Future<void> deleteUnit(int cate_id) async {
    emit(state.coppywith(status_c: unitstatuse.loading));
    var result = await authenRepositorys.deleteUnit(
      unit_id: cate_id,
    );
    result!.fold((Left) {
      log("erro $Left");
    }, (Right) {
      log('delete ok.....');
      emit(state.coppywith(status_c: unitstatuse.success));
      getUnit();
    });
  }

// //.........update product type.............
  onTypeUnit(value) {
    //emit(state.coppywith(catetype_c: value));
    Unitprovider.getUnitUpdate(value);
    UnitName.text = Unitprovider.getupdate!.unitName;
   
  }

  Future<void> updateUnit() async {
    emit(state.coppywith(status_c: unitstatuse.loading));
    // ........here is to make the text to show to the textfield............

    var result = await authenRepositorys.updateUnit(
      Unit_name: UnitName.text,
      Unit_id: Unitprovider.getupdate!.unitId,
    );
    result.fold(
      (f) {
        log('Errror=== $f');
      },
      (data) async {
        //   log('success ' + data.length.toString());
       // print('data: $data');
        Fluttertoast.showToast(
            msg: "update sucessful", gravity: ToastGravity.CENTER);
        //----make clear data------
        UnitName.clear();
        isAdd = true;
        getUnit();
        //   getproductype();
// <--here is to back to the product page and send value ( true ) back to the cubit of product cubit to make reflesh
      },
    );
  }
}
