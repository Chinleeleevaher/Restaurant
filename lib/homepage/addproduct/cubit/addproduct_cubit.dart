import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myproject/homepage/addproduct/component/model.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/menu_page/model/unit.dart';
import 'package:myproject/repository/authen_sipository.dart';

import '../../menu_page/model/product_model.dart';

part 'addproduct_state.dart';

class AddproductCubit extends Cubit<AddproductState> {
  final AuthenRepository authenRepositorys;
  final ProductModel? productmodel;
  AddproductCubit({
    required this.authenRepositorys,
    required this.productmodel,
  }) : super(AddproductState());

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final ProdcutId = TextEditingController();
  final ProductName = TextEditingController();
  final SalePriceProduct = TextEditingController();
  final BuyPriceProduct = TextEditingController();
  final ScanProdutId = TextEditingController();
  final NameProduct = TextEditingController();
  final ProductQty = TextEditingController();

//-------------of produc type-------------
  Future<void> producttypelist() async {
    emit(state.coppywith(status_c: producttypestatuse.loading));
    var result = await authenRepositorys.producttype();
    result.fold(
      (f) {
        log('errro');
      },
      (data) async {
        //   log('success ' + data.length.toString());
        emit(state.coppywith(
            listtabltype_c: state.listproducttypes! + data!,
            status_c: producttypestatuse.success));
      },
    );
  }

//--------of unit-----------
  Future<void> unitlist() async {
    emit(state.coppywith(status_c: producttypestatuse.loading));
    var result = await authenRepositorys.prUnit();
    result.fold(
      (f) {
        log('errro');
      },
      (data) async {
        //   log('success ' + data.length.toString());
        emit(state.coppywith(
            listunit_c: state.listunit! + data!,
            status_c: producttypestatuse.success));
      },
    );
  }

  Future<String?> upload() async {
    String? imagename;
    try {
      emit(state.coppywith(status_c: producttypestatuse.loading));
      var result =
          await authenRepositorys.imageP(imagepath: state.typeSelecimage!);
      result.fold(
        (f) {
          log('errro');
        },
        (data) {
          log('success ' + data.profileUrl.toString());
          print('data: $data');
          imagename = data.profileUrl;
        },
      );
      return imagename;
    } catch (e) {
      print("Error: $e");
    }
  }

//------of add product------------
  Future<void> adproduct() async {
    emit(state.coppywith(status_c: producttypestatuse.loading));
    String? imagname = await upload();
    if (imagname == null) {
      return;
    }
    var result = await authenRepositorys.productData(
      Pro_id: ProdcutId.text,
      Pro_name: ProductName.text,
      Protype_id: state.typeSelect!.protypeId,
      unit_id: state.typeSelectunit!.unitId,
      imagname: imagname!,
      pro_cost: double.parse(SalePriceProduct.text),
      pro_price: double.parse(BuyPriceProduct.text),
    );
    result.fold(
      (f) {
        log('errro');
      },
      (data) async {
        //   log('success ' + data.length.toString());
        print('data: $data');
        Fluttertoast.showToast(
            msg: "Upload sucessful", gravity: ToastGravity.CENTER);
        ProdcutId.clear();
        ProductName.clear();
        SalePriceProduct.clear();
        BuyPriceProduct.clear();
        emit(state.coppywith(
            typeSelecimage_c: File(""),
            typeSelectunit_c: punit(unitId: 0, unitName: ""),
            typeSelect_c: Producttype(protypeId: 0, protypeName: "")));
      },
    );
  }

//-----------to corect value from the addproduct page--------------------
  //-----of product type---------
  onTypeSelectprotype(value) {
    emit(state.coppywith(typeSelect_c: value));
    // producttypelist();
  }

  // --- of unit----
  onTypeSelectunit(value) {
    emit(state.coppywith(typeSelectunit_c: value));
    //' unitlist();
  }

  //----of image picker----
  onTypeSelectimage(value) {
    emit(state.coppywith(typeSelecimage_c: value));
    // adproduct();
  }

  initialDataForm() {
    if (productmodel != null) {
      log('data not null');
      ProdcutId.text = productmodel!.productId;
      ProductName.text = productmodel!.productName;
      SalePriceProduct.text = productmodel!.price.toString();
      BuyPriceProduct.text = productmodel!.cost.toString();
       emit(state.coppywith(imagenetword_c: productmodel!.image));
    }
  }
}
