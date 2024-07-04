import 'dart:io';

import 'package:dartz/dartz.dart';

import 'package:myproject/homepage/addproduct/component/model.dart';
import 'package:myproject/homepage/addunit/component/model.dart';
import 'package:myproject/homepage/import_Product/model/importModel.dart';
import 'package:myproject/homepage/kitchen/model/orderbyOrderStatusModel.dart';
import 'package:myproject/homepage/kitchen/model/orderdetailModel.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/menu_page/model/unit.dart';
import 'package:myproject/homepage/orderproduct/model/orderproductModel.dart';
import 'package:myproject/homepage/orderproduct/model/postOrderModel.dart';
import 'package:myproject/homepage/report/orderDetailModels.dart';
import 'package:myproject/homepage/table_page/model/failure.dart';
import 'package:myproject/homepage/table_page/model/order_table_Model.dart';
import 'package:myproject/homepage/table_page/model/orderlistmodel.dart';
import 'package:myproject/homepage/table_page/model/selectOrderToProvider.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/homepage/table_page/model/table_status.dart';
import 'package:myproject/homepage/table_page/model/tabletype.dart';
import 'package:myproject/homepage/user/model/addUserModel.dart';
import 'package:myproject/homepage/user/model/getUserMoldel.dart';
import 'package:myproject/service/authen_service.dart';

import '../homepage/addcategory/component/model.dart';
import '../homepage/report/getproductmodel.dart';
import '../homepage/report/orderDetailModel.dart';
import '../homepage/report/reportmodel.dart';

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
      {required int typeids, required int table_status}) async {
    try {
      final result =
          await services.getTable(typeids: typeids, table_status: table_status);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

//------of add product type---------
  Future<Either<Failure, List<AddProductypeModel>?>> protypes(
      {required String addpro}) async {
    try {
      final result = await services.addproducttype(Addpro: addpro);
      return Right(result);
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

  //-----of delete product type-----
  Future<Either<Failure, bool>?> deletecate({required int cate_id}) async {
    try {
      final result = await services.deleteCategory(cate_id: cate_id);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //----of update product type---------
  Future<Either<Failure, bool>> updateCate({
    required int cate_id,
    required String cate_name,
  }) async {
    try {
      final result = await services.updateCate(
        Cate_id: cate_id,
        Cate_name: cate_name,
      );
      return right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  // -------of unit get -----------
  Future<Either<Failure, List<punit>?>> prUnit() async {
    try {
      final result = await services.prUnit();
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

  //------of add Unit---------
  Future<Either<Failure, List<AdUnitModel>?>> adUnit(
      {required String addpro}) async {
    try {
      final result = await services.adunit(addU: addpro);
      return Right(result);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

  //-----of delete Unit-----
  Future<Either<Failure, bool>?> deleteUnit({required int unit_id}) async {
    try {
      final result = await services.deleteUnits(unit_id: unit_id);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //----of update unit---------
  Future<Either<Failure, bool>> updateUnit({
    required int Unit_id,
    required String Unit_name,
  }) async {
    try {
      final result = await services.updateUnit(
        Unit_id: Unit_id,
        Unit_name: Unit_name,
      );
      return right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
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
    required int table_id,
    required int qty,
    required double amount,
  }) async {
    try {
      final result = await services.orderproductlist(
          order_id: order_id,
          product_id: product_id,
          table_id: table_id,
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
      {required int table_id, required int or_status}) async {
    try {
      final result = await services.SelectOrderBytable(
          table_id: table_id, or_status: or_status);
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
  Future<Either<Failure, bool>?> MoveTable(
      {required int or_id,
      required String product_id,
      required int qty,
      required double amount,
      required int table_id}) async {
    try {
      final result = await services.Update_MenuOfMoveTable(
        or_id: or_id,
        product_id: product_id,
        qty: qty,
        amount: amount,
        table_id: table_id,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //----delete getFromtable---------------------
  Future<Either<Failure, bool>?> delete_move_table({
    required int table_id,
  }) async {
    try {
      final result = await services.Delete_Move_Table(
        table_id: table_id,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //----Update move table---------------------
  Future<Either<Failure, bool>?> updateTable_id({
    required int or_id,
    required int table_id,
    required int table_ids,
    required int or_qty,
    required int or_amount,
  }) async {
    try {
      final result = await services.updatetable_id(
        or_id: or_id,
        table_id: table_id,
        table_ids: table_ids,
        or_qty: or_qty,
        or_amount: or_amount,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//-----------ge order report-----------------------
  Future<Either<Failure, List<SelectOrderReportModel>>?> getOrderReport(
      {required DateTime fromdate, required DateTime todate}) async {
    try {
      final result =
          await services.getOrderReport(Fromdate: fromdate, Todate: todate);
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//-----------ge order detail for report-----------------------
  Future<Either<Failure, List<SelectOrderReportModels>>?> SelectordertoReport(
      {required int or_id}) async {
    try {
      final result = await services.SelectordertoReport(or_id: or_id);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }

  //------------select product to make report---------------
  Future<Either<Failure, List<GetProductModel>>?> getproductmakeReport() async {
    try {
      final result = await services.getproduct_makeReport();
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //------------select product for order Produt---------------
  Future<Either<Failure, List<OrderProductModel>>?> getOrder_Product() async {
    try {
      final result = await services.getOrder_Product();
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //------------select product to make report---------------
  Future<Either<Failure, List<GetOrderDetailModel>>?> getorderdetailmakeReport(
      {required DateTime fromdate, required DateTime todate}) async {
    try {
      final result = await services.getorderdetail_makeReport(
          Fromdate: fromdate, Todate: todate);
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //------------select order by order status for kitchen---------------
  Future<Either<Failure, List<OrderStatusModel>>?>
      GetOrderByOrderStatus() async {
    try {
      final result = await services.GetOrderByOrderStatus();
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //------------select order detail for kitchen---------------
  Future<Either<Failure, List<OrderDetailModel>>?> getOrderdetail_kitchen(
      {required int or_ids}) async {
    try {
      final result = await services.getOrderdetail_kitchen(or_ids: or_ids);
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //---- get update table status and order status table---------------------
  Future<Either<Failure, bool>?> getupdateTableStatus_OrderStatus({
    required int or_id,
    required int table_id,
  }) async {
    try {
      final result = await services.getUpdate_OrderStatus_tableStatus(
          table_Id: table_id, order_id: or_id);
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // ..........post order Product and make return.............
  Future<Either<Failure, List<PostorderProductModel>>?> PostOrderProduct({
    required String product_id,
    required String product_name,
    required int product_Qty,
    required int product_price,
    required int product_cost,
    required String product_image,
  }) async {
    try {
      final result = await services.PostOrderProduct(
        product_id: product_id,
        product_name: product_name,
        product_Qty: product_Qty,
        product_price: product_price,
        product_cost: product_cost,
        product_image: product_image,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  ///.........update OrderProduct...............
  Future<Either<Failure, bool>?> UpdateOrderProduct({
    required String productID,
  }) async {
    try {
      final result = await services.UpdateOrderProduct(productID: productID);
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // ..........select order product for import.............
  Future<Either<Failure, OrderproductImprotsModel>?> selectOrderporduct({
    required String product_id,
  }) async {
    try {
      final result = await services.selectOrderProductImport(
        product_id: product_id,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // ..........Update order product for import.............
  Future<Either<Failure, bool>?> updateProductImport({
    required String product_id,
    required int quantity,
  }) async {
    try {
      final result = await services.UpdateImportProduct(
        product_id: product_id,
        quantity: quantity,
      );
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  // ..........get user.............
  Future<Either<Failure, List<GetUserModel>>?> getUser() async {
    try {
      final result = await services.getUser();
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

//----------user image---------------
  Future<Either<Failure, ImageModel>> userImage(
      {required File imagepath}) async {
    try {
      final result = await services.userImage(imageFile: imagepath);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
      //throw Exception('Failed to load table type');
    }
  }

  // ..........Add User and select.............
  Future<Either<Failure, bool>?> addUser({
    required String image,
    required String username,
    required String password,
    required String email,
    required String phone,
    required String gender,
    required String address,
    required String status,
  }) async {
    try {
      final result = await services.addUser(
          image: image,
          username: username,
          password: password,
          email: email,
          phone: phone,
          address: address,
          status: status,
          gender: gender);
      return Right(result!);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }
  // ..........delete user.............
  Future<Either<Failure, bool>?> deleteUser({required int uID}) async {
    try {
      final result = await services.deleteUser(uID: uID);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
   // ..........update user.............
  Future<Either<Failure, bool>?> updateUser({
        required int uID,
    required String username,
    required String image,
    required String email,
    required String phone,
    required String gender,
    required String address,
    required String status,
    required String password,
    }) async {
    try {
      final result = await services.updateUser(
        uID: uID,
        username: username,
        image: image, 
        email:email,
        phone: phone,
        gender: gender,
        address: address,
        status:status, 
        password: password);
      return Right(result!);
    } catch (e) {
      return Left(Failure(e.toString()));
    }
  }
}
