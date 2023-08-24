import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:myproject/homepage/addproduct/component/model.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/menu_page/model/unit.dart';
import 'package:myproject/homepage/table_page/model/failure.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/homepage/table_page/model/tabletype.dart';
import 'package:myproject/service/authen_service.dart';

class AuthenRepository {
  final AuthenService services = AuthenService();
  //@override
  //-------------of table type-------------------
  Future<Either<Failure, List<Tabletype>>> getTabletype() async {
    try {
      final result = await services.getTableTypes();
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

//--------of table-------------
  Future<Either<Failure, List<Tables>>> getTables(
      {required int typeids}) async {
    try {
      final result = await services.getTable(typeids: typeids);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

  //-------------of product type-------------------
  Future<Either<Failure, List<Producttype>?>> producttype() async {
    try {
      final result = await services.producttype();
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

  // -------of unit-----------
  Future<Either<Failure, List<punit>?>> prUnit() async {
    try {
      final result = await services.prUnit();
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

  //--------of product-------------
  Future<Either<Failure, List<ProductModel>>> getproduct(
      {required int typeids, required int unitId}) async {
    try {
      final result = await services.products(typeids: typeids, unitId: unitId);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

//----------of image---------------
  Future<Either<Failure, ImageModel>> imageP({required File imagepath}) async {
    try {
      final result = await services.postImage(imageFile: imagepath);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

  //----of product data---------

  Future<Either<Failure, bool>> productData(
      {required String Pro_id,
      required String Pro_name,
      required int Protype_id,
      required int unit_id,
      required double pro_price,
      required double pro_cost,
      required String imagname}) async {
    try {
      final result = await services.addproduct(
          Pro_id: Pro_id,
          Pro_name: Pro_name,
          Protype_id: Protype_id,
          unit_id: unit_id,
          pro_price: pro_price,
          pro_cost: pro_cost,
          imagname: imagname);
      return right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //----of update product data---------
  Future<Either<Failure, bool>> updatepro(
      {required String Pro_id,
      required String Pro_name,
      required String Protype_id,
      required String unit_id,
      required String pro_price,
      required String pro_cost,
      required String imagname}) async {
    try {
      final result = await services.updateproduct(
          Pro_id: Pro_id,
          Pro_name: Pro_name,
          Protype_id: Protype_id,
          unit_id: unit_id,
          pro_price: pro_price,
          pro_cost: pro_cost,
          imagname: imagname);
      return right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //-----of delete product-----
  Future<Either<Failure, bool>?> deletepro({required int pro_id}) async {
    try {
      final result = await services.deleteproduct(pro_id: pro_id);
      return right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
