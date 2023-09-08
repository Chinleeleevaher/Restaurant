import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/menu_page/model/unit.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:myproject/repository/authen_sipository.dart';

import '../../../provider/ProductProvider.dart';
import '../../menu_page/model/product_model.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final AuthenRepository authenRepositorys;
  //final ProductProvider proProvider;
  ProductsCubit({
    required this.authenRepositorys,
    // required this.proProvider,
  }) : super(
          ProductsState(
            listproducttype: [
              Producttype(
                protypeId: 0,
                protypeName: 'ທັງໝົດ',
              ),
            ],
            listunit: [punit(unitId: 0, unitName: 'ທັງໝົດ')],
          ),
        );

  Future<void> producttypelist() async {
    emit(state.coppywith(status_c: productliststatuse.loading));
    var result = await authenRepositorys.producttype();
    result.fold(
      (f) {
        log('errro');
      },
      (data) async {
        //   log('success ' + data.length.toString());
        emit(state.coppywith(
            listtabltype_c: state.listproducttype! + data!,
            status_c: productliststatuse.success));
      },
    );
  }

  //-----of unit--------
  Future<void> unitlist() async {
    emit(state.coppywith(status_c: productliststatuse.loading));
    var result = await authenRepositorys.prUnit();
    result.fold(
      (f) {
        log('errro');
      },
      (data) async {
        //   log('success ' + data.length.toString());
        emit(state.coppywith(
            listunit_c: state.listunit! + data!,
            status_c: productliststatuse.success));
      },
    );
  }

  //--------of product--------------
  Future<void> getproduct() async {
    try {
      emit(state.coppywith(status_c: productliststatuse.loading));
      var result = await authenRepositorys.getproduct(
          typeids: state.typeSelect == null ? 0 : state.typeSelect!.protypeId,
          unitId:
              state.typeSelectunit == null ? 0 : state.typeSelectunit!.unitId);
      result.fold(
        (f) {
          log('errro');
        },
        (datas) async {
          log('success ' + datas.length.toString());
          emit(state.coppywith(
              listtable_c: datas, status_c: productliststatuse.success));
        },
      );
      //}
    } catch (e) {
      throw Exception("error: $e");
    }
  }

  //----of delete product------
  Future<void> deletepro(int pro_id) async {
    emit(state.coppywith(status_c: productliststatuse.loading));
    var result = await authenRepositorys.deletepro(pro_id: pro_id);
    result!.fold((Left) {
      log("erro $Left");
    }, (Right) {
      getproduct();
      emit(state.coppywith(status_c: productliststatuse.success));
    });
  }

  onTypeSelectprotype(value) {
    emit(state.coppywith(typeSelect_c: value));
    getproduct();
  }

  // --- of unit----
  onTypeSelectunit(value) {
    emit(state.coppywith(typeSelectunit_c: value));
    getproduct();
  }

//----of product item to model it fucntion to send the argument to the addproduct cubit-------
  onTypeSelectproduct(value) {
    emit(state.coppywith(typeSelectproductItem_c: value));
    navService
        .pushNamed(AppRount.addproduct, args: state.typeSelectproductItem)
        .then((value) { // <--- (.then ) is to get the value form the update product page
      if (value == true) {
        getproduct();
      }
    });
  }
}
