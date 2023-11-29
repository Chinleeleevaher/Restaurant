import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/product_page/cubit/products_cubit.dart';

import '../../../repository/authen_sipository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final AuthenRepository authenRepositorys;
  CategoryCubit({
    required this.authenRepositorys,
  }) : super(CategoryState());
  final productypeName = TextEditingController();

  //---Add product type----------

  Future<void> adproductype() async {
    emit(state.coppywith(status_c: Categorytatuse.loading));

    var result = await authenRepositorys.protypes(addpro: productypeName.text);
    result.fold((f) {
      log('errro 123');
    }, (r) {
      log('Successful : $r');
    });
  }
}
