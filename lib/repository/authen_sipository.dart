import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:myproject/homepage/addproduct/component/model.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/menu_page/model/unit.dart';
import 'package:myproject/homepage/table_page/model/failure.dart';
import 'package:myproject/homepage/table_page/model/order_table_Model.dart';
import 'package:myproject/homepage/table_page/model/orderlistmodel.dart';
import 'package:myproject/homepage/table_page/model/selectOrderToProvider.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/homepage/table_page/model/table_status.dart';
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
      {
        required int typeids,
        required int table_status
      }) async {
    try {
      final result = await services.getTable(typeids: typeids, table_status: table_status);
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
      required int quantity,
      required String imagname}) async {
    try {
      final result = await services.addproduct(
          Pro_id: Pro_id,
          Pro_name: Pro_name,
          Protype_id: Protype_id,
          unit_id: unit_id,
          pro_price: pro_price,
          pro_cost: pro_cost,
          imagname: imagname,
          quantity: quantity);
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
      required String quantity,
      required String imagname}) async {
    try {
      final result = await services.updateproduct(
          Pro_id: Pro_id,
          Pro_name: Pro_name,
          Protype_id: Protype_id,
          unit_id: unit_id,
          pro_price: pro_price,
          pro_cost: pro_cost,
          quantity: quantity,
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
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //----to post order product------
  Future<Either<Failure, Ordertable?>> orderpro(
      {required int order_qty,
      required int order_amount,
      required int order_status,
      required int order_table}) async {
    try {
      final result = await services.orderproduct(
        order_qty: order_qty,
        order_amount: order_amount,
        order_status: order_status,
        order_table: order_table,
      );
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //-----to post order detail product-------
  Future<Either<Failure, bool>?> orderproductdetail({
    required int order_id,
    required String product_id,
    required String product_name,
    required int qty,
    required double amount,
  }) async {
    try {
      final result = await services.orderproductlist(
          order_id: order_id,
          product_id: product_id,
          product_name: product_name,
          qty: qty,
          amount: amount);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //-----to upadte table ststus-------
  Future<Either<Failure, Tablestatus>?> updatetablestattus(
      {required int tablestatus, required int table_id}) async {
    try {
      final result = await services.updatetablestatus(
          tablestatus: tablestatus, table_id: table_id);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //-----to select the data of product that we have already order--------------------
  Future<Either<Failure, List<SelectOrderByTableModel>>?> SelectByOrder(
      {required int table_id}) async {
    try {
      final result = await services.SelectOrderBytable(table_id: table_id);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //--------------of cut stock-----------------
  Future<Either<Failure, bool>?> cut_Stock({required int table_id}) async {
    try {
      final result = await services.cut_stock(table_id: table_id);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //-----of update tbproduct-----------
  Future<Either<Failure, bool>?> update_tbOrder({
    required int or_id,
    required double getmoney,
    required double backmoney,
    required String payment,
  }) async {
    try {
      final result = await services.upadte_tbOrder(
          backmoney: backmoney,
          getmoney: getmoney,
          or_id: or_id,
          payment: payment);
      return right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //-----to Select order to provider by table_id-----------
  Future<Either<Failure, SelectOrderToProviderMode>?> ToSelectOrderToprovider({
    required int table_id,
  }) async {
    try {
      final result = await services.SelectOrderToprovider(table_id: table_id);
      return right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //----to move menu list of table---------------------
  Future<Either<Failure, bool>?> MoveTable({
    required int ord_id,
    required int or_id,
    required String product_id,
    required String product_name,
    required int qty,
    required double amount,
  }) async {
    try {
      final result = await services.Update_MenuOfMoveTable(
        ord_id: ord_id,
        or_id: or_id,
        product_id: product_id,
        product_name: product_name,
        qty: qty,
        amount: amount,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //----deletemove table---------------------
  Future<Either<Failure, bool>?> delete_move_table({
    required int or_id,
  }) async {
    try {
      final result = await services.Delete_Move_Table(
        or_id: or_id,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
  
  //----deletemove table---------------------
  Future<Either<Failure, bool>?> updateTable_id({
    required int or_id,
    required int table_id,
    required int table_status,
  }) async {
    try {
      final result = await services.updatetable_id(
        or_id: or_id, table_id: table_id, table_status: table_status,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

}
