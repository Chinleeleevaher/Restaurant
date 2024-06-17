import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myproject/homepage/addcategory/component/model.dart';
import 'package:myproject/homepage/addcategory/provider/categoryProvider.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/product_page/cubit/products_cubit.dart';

import '../../../repository/authen_sipository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  final AuthenRepository authenRepositorys;
  final categoryProvider categoryeprovider;
  final Producttype? productTypemodel;
  final BuildContext context;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final productypeName = TextEditingController();

  bool isAdd = true;

  CategoryCubit({
    required this.authenRepositorys,
    required this.categoryeprovider,
    required this.productTypemodel,
    required this.context,
  }) : super(CategoryState());

  //---Add product type----------

  Future<void> adproductype() async {
    emit(state.coppywith(status_c: Categorytatuse.loading));

    var result = await authenRepositorys.protypes(addpro: productypeName.text);
    result.fold((f) {
      log('errro 123');
      productypeName.clear();
      getproductype();
    }, (r) {
      log('Successful : $r');
    });
  }
  //---get product type----------

  Future<void> getproductype() async {
    emit(state.coppywith(status_c: Categorytatuse.loading));

    var result = await authenRepositorys.producttype();
    result.fold((f) {
      log('errro');
    }, (r) {
      //log('Successful : $r');
      categoryeprovider.TogetProductType(r!);
      emit(state.coppywith(status_c: Categorytatuse.success));
    });
  }

  //----of delete product------
  Future<void> deleteCategpry(int cate_id) async {
    emit(state.coppywith(status_c: Categorytatuse.loading));
    var result = await authenRepositorys.deletecate(
      cate_id: cate_id,
    );
    result!.fold((Left) {
      log("erro $Left");
    }, (Right) {
      log('delete ok.....');
      emit(state.coppywith(status_c: Categorytatuse.success));
      getproductype();
    });
  }

//.........update product type.............
  onTypeCate(value) {
    //emit(state.coppywith(catetype_c: value));
    categoryeprovider.getCateUpdate(value);
    productypeName.text = categoryeprovider.getupdate!.protypeName.toString();
  }

  Future<void> updateProduct() async {
    emit(state.coppywith(status_c: Categorytatuse.loading));
    // ........here is to make the text to show to the textfield............

    var result = await authenRepositorys.updateCate(
      cate_name: productypeName.text,
      cate_id: categoryeprovider.getupdate!.protypeId,
    );
    result.fold(
      (f) {
        log('Errror=== $f');
      },
      (data) async {
        //   log('success ' + data.length.toString());
        print('data: $data');
        Fluttertoast.showToast(
            msg: "update sucessful", gravity: ToastGravity.CENTER);
        //----make clear data------
        productypeName.clear();
        isAdd = true;
        getproductype();
        //   getproductype();
// <--here is to back to the product page and send value ( true ) back to the cubit of product cubit to make reflesh
      },
    );
  }
}
