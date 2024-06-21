import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/constant/api_path.dart';
import 'package:myproject/homepage/addproduct/component/model.dart';
import 'package:myproject/homepage/addunit/component/model.dart';
import 'package:myproject/homepage/kitchen/model/orderbyOrderStatusModel.dart';
import 'package:myproject/homepage/kitchen/model/orderdetailModel.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:myproject/homepage/table_page/model/order_table_Model.dart';
import 'package:myproject/homepage/table_page/model/orderlistmodel.dart';
import 'package:myproject/homepage/table_page/model/selectOrderToProvider.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/homepage/table_page/model/table_status.dart';
import 'package:myproject/homepage/table_page/model/tabletype.dart';

import '../homepage/addcategory/component/model.dart';
import '../homepage/menu_page/model/product_model.dart';
import '../homepage/menu_page/model/unit.dart';
import '../homepage/report/getproductmodel.dart';
import '../homepage/report/orderDetailModel.dart';
import '../homepage/report/reportmodel.dart';
import '../homepage/report/selecorderdetailreport.dart';

class AuthenService {
  //-----of tabletype
  Future<List<Tabletype>?> getTableTypes() async {
    try {
      final response = await http.get(Uri.parse(ApiPaths.tabletypepath));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          var data = tabletypeFromJson(jsonEncode(jsonData['data']));
          return data;
        }
        Exception('data is null');
      } else {
        Exception('Failed to load table types');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

// -----of table-------------
  Future<List<Tables>?> getTable({
    required int typeids,
    required int table_status,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiPaths.tablepath));
      request.body =
          json.encode({"typeId": typeids, "table_status": table_status});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body['data'] != null) {
          final product = tableFromJson(jsonEncode(body['data']));
          return product;
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('$e');
    }
    return null;
  }

  // of producttype
  Future<List<Producttype>?> producttype() async {
    try {
      final response = await http.get(Uri.parse(ApiPaths.producttypepath));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          var data = producttypeFromJson(jsonEncode(jsonData['data']));

          return data;
        }
        Exception('data is null');
      } else {
        Exception('Failed to load table types');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  //------add product type--------

  Future<List<AddProductypeModel>?> addproducttype(
      {required String Addpro}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(ApiPaths.add_producttype));
    request.body = json.encode({"protype_name": Addpro});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      if (body['data'] != null) {
        final protype = addProductypeModelFromJson(jsonEncode(body['data']));
        return protype;
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  //-----of delete product type-----------
  Future<bool?> deleteCategory({required int cate_id}) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('DELETE', Uri.parse(ApiPaths.delete_producttype));
    request.body = json.encode({"protype_id": cate_id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      if (body["status"] == true) {
        return true;
      } else {
        return false;
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  //-------< update Product type --------------

  Future<bool?> updateCate({
    required int Cate_id,
    required String Cate_name,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('PUT', Uri.parse(ApiPaths.upadte_productype));
      request.body = json.encode({
        "protype_id": Cate_id,
        "protype_name": Cate_name, //should be string
        // should be string
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        log("Body: $body");
        if (body["status"] == true) {
          return true;
        } else {
          return false;
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("error $e");
    }
  }

// -----of get Unit-----
  Future<List<punit>?> prUnit() async {
    try {
      final response = await http.get(Uri.parse(ApiPaths.unitpath));
      if (response.statusCode == 200) {
        var jsonData = jsonDecode(response.body);
        if (jsonData['data'] != null) {
          var data = unitFromJson(jsonEncode(jsonData['data']));
          return data;
        }
        Exception('data is null');
      } else {
        Exception('Failed to load table types');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }

  //------add Unit--------

  Future<List<AdUnitModel>?> adunit({required String addU}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(ApiPaths.addUnit));
    request.body = json.encode({"unitName": addU});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      if (body['data'] != null) {
        final protype = adUnitModelFromJson(jsonEncode(body['data']));
        return protype;
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  //-----of delete Unit-----------
  Future<bool?> deleteUnits({required int unit_id}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('DELETE', Uri.parse(ApiPaths.delete_unit));
    request.body = json.encode({"unitId": unit_id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      if (body["status"] == true) {
        return true;
      } else {
        return false;
      }
    } else {
      print(response.reasonPhrase);
    }
  }

//-------< update Unit --------------

  Future<bool?> updateUnit({
    required int Unit_id,
    required String Unit_name,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('PUT', Uri.parse(ApiPaths.update_unit));
      request.body = json.encode({
        "unitId": Unit_id,
        "unitName": Unit_name, //should be string
        // should be string
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        log("Body: $body");
        if (body["status"] == true) {
          return true;
        } else {
          return false;
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("error $e");
    }
  }

  // -----of product-------------
  Future<List<ProductModel>?> products(
      {required int typeids, required int unitId}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiPaths.productpath));
      request.body = json.encode({"typeId": typeids, "unitId": unitId});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body['data'] != null) {
          final product = productFromJson(jsonEncode(body['data']));
          return product;
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      throw Exception('$e');
    }
    return null;
  }

  //-------of add image product--------------------

  Future<ImageModel?> postImage({required File imageFile}) async {
    var request =
        http.MultipartRequest('POST', Uri.parse(ApiPaths.uploadimagePath));
    request.files
        .add(await http.MultipartFile.fromPath('profile', imageFile.path));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      //print(await response.stream.bytesToString());
      var body = jsonDecode(await response.stream.bytesToString());
      if (body != null) {
        final product = imageFromJson(jsonEncode(body));
        return product;
      } else {
        print(response.reasonPhrase);
      }
    } else {}
  }
  //---------of add data of product--------------

  Future<bool?> addproduct(
      {required String Pro_id,
      required String Pro_name,
      required int Protype_id,
      required int unit_id,
      required double pro_price,
      required double pro_cost,
      required int quantity,
      required String imagname}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(ApiPaths.add_productPath));
    request.body = json.encode({
      "product_id": Pro_id,
      "product_name": Pro_name,
      "protype_id": Protype_id,
      "unit_id": unit_id,
      "price": pro_price,
      "cost": pro_cost,
      "quantity": quantity,
      "image": imagname
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      log("Body: $body");
      if (body["status"] == true) {
        return true;
      } else {
        return false;
      }
    } else {
      print(response.reasonPhrase);
    }
  }
  //-------<update method>--------------

  Future<bool?> updateproduct(
      {required String Pro_id,
      required String Pro_name,
      required String Protype_id,
      required String unit_id,
      required String pro_price,
      required String pro_cost,
      required String quantity,
      required String imagname}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('PATCH', Uri.parse(ApiPaths.upadte_productPath));
      request.body = json.encode({
        "product_id": Pro_id,
        "product_name": Pro_name, //should be string
        "protype_id": Protype_id,
        "unit_id": unit_id,
        "price": pro_price,
        "cost": pro_cost,
        "quantity": quantity,
        "image": imagname // should be string
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        log("Body: $body");
        if (body["status"] == true) {
          return true;
        } else {
          return false;
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("error $e");
    }
  }

  //-----of delete product-----------
  Future<bool?> deleteproduct({required int pro_id}) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('DELETE', Uri.parse(ApiPaths.delete_productPath));
    request.body = json.encode({"product_id": pro_id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      if (body["status"] == true) {
        return true;
      } else {
        return false;
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  //-----of order product-----------

  // String datetimes = DateFormat('YYYY-MM-DD HH:MI:SS').format(DateTime.now());
  String datetimes = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());
  Future<Ordertable?> orderproduct(
      {required int order_qty,
      required int order_amount,
      required int order_status,
      required int order_table}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiPaths.order_product));
      request.body = json.encode({
        "or_date": datetimes,
        "or_qty": order_qty,
        "or_amount": order_amount,
        "or_status": order_status,
        "table_id": order_table,
        "receives": 0,
        "returns": 0,
        "payment": ".."
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body["status"] == 200) {
          final ordertable = ordertableFromJson(jsonEncode(body["data"]));
          return ordertable;
        } else {
          Exception('data is null');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print("server Error: " + e.toString());
    }
  }

  //----to post order detail------
  Future<bool?> orderproductlist({
    required int order_id,
    required String product_id,
    required int table_id,
    required int qty,
    required double amount,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiPaths.order_detail));
      request.body = json.encode({
        "or_id": order_id,
        "product_id": product_id,
        "table_id": table_id,
        "qty": qty,
        "amount": amount,
        "ord_date": datetimes
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //---of update table status-----
  Future<Tablestatus?> updatetablestatus(
      {required int tablestatus, required int table_id}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('PUT', Uri.parse(ApiPaths.update_table));
      request.body =
          json.encode({"table_status": tablestatus, "table_id": table_id});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body["status"] == 200) {
          final ordertable = tablestatusFromJson(jsonEncode(body["data"]));
          return ordertable;
        } else {
          Exception('data is null');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //-----to select the data of product that we have already order--------------------
  Future<List<SelectOrderByTableModel>?> SelectOrderBytable({
    required int table_id,
    required int or_status,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiPaths.order_by_table));
      request.body = json.encode({"tableId": table_id, "or_status": or_status});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body["status"] == true) {
          final seletOrder =
              selectOrderByTableModelFromJson(jsonEncode(body["data"]));
          return seletOrder;
        } else {
          Exception('data is null');
        }
      } else {}
    } catch (e) {
      log(e.toString());
    }
  }

//----------------of cut stoke in tbproduct----------------------------
  Future<bool?> cut_stock({required int table_id}) async {
    try {
      var headders = {'content-Type': 'application/json'};
      var resqust = http.Request('POST', Uri.parse(ApiPaths.cut_stocks));
      resqust.body = json.encode({"tableId": table_id});
      resqust.headers.addAll(headders);
      http.StreamedResponse response = await resqust.send();
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log("Error coneection " + e.toString());
    }
  }

  //-------update tborder-------------------
  Future<bool?> upadte_tbOrder({
    required int or_id,
    required double getmoney,
    required double backmoney,
    required String payment,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PATCH', Uri.parse(ApiPaths.update_tbOrders));
    request.body = json.encode({
      "orId": or_id,
      "receives": getmoney,
      "returns": backmoney,
      "payment": payment,
      "orStatus": 0
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //-----Select order By table to provider------------
  Future<SelectOrderToProviderMode?> SelectOrderToprovider(
      {required int table_id}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(ApiPaths.getOrderby_table));
    request.body = json.encode({"tableId": table_id});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      if (body["status"] == 200) {
        final seletOrderByTable =
            selectOrderToProviderModeFromJson(jsonEncode(body["data"]));
        return seletOrderByTable;
      } else {
        Exception('data is null');
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  //---to update menu list of move table-----------------------
  // Future<bool?> Update_MenuOfMoveTable({
  //   required int ord_id,
  //   required int or_id,
  //   required String product_id,
  //   // required String product_name,
  //   required int qty,
  //   required double amount,
  // }) async {
  //   try {
  //     var headers = {'Content-Type': 'application/json'};
  //     var request = http.Request('POST', Uri.parse(ApiPaths.update_move_table));
  //     request.body = json.encode({
  //       // "ord_id": ord_id,
  //       // "or_id": or_id,
  //       // "product_id": product_id,

  //       // "qty": qty,
  //       // "amount": amount,
  //       // "ord_date": datetimes,
  //       {
  //         "or_id": 20,
  //         "ord_id": 20,
  //         "product_id": 2,
  //         "qty": 10,
  //         "amount": 1000,
  //         "ord_date": "2023-04-07"
  //       }
  //     });
  //     request.headers.addAll(headers);

  //     http.StreamedResponse response = await request.send();

  //     if (response.statusCode == 200) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //   }
  //   return null;
  // }

  Future<bool?> Update_MenuOfMoveTable({
    required int or_id,
    required String product_id,
    required int qty,
    required double amount,
    required int table_id,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiPaths.update_move_table));
      request.body = json.encode({
        "or_id": or_id,
        "product_id": product_id,
        "qty": qty,
        "amount": amount,
        "ord_date": datetimes,
        "table_id": table_id,
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
    return null;
  }

//.....of delete getFromtable.............
  Future<bool?> Delete_Move_Table({required int table_id}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('DELETE', Uri.parse(ApiPaths.delete_getFromtable));
      request.body = json.encode({"table_id": table_id});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  //----update table_id---------------
  Future<bool?> updatetable_id({
    required int or_id,
    required int or_qty,
    required int or_amount,
    required int table_id,
    required int table_ids,
  }) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('PATCH', Uri.parse(ApiPaths.update_table_id));
    request.body = json.encode({
      "orId": or_id,
      "TableId": table_id,
      "OrStatus": 1,
      "TableStatus": 1,
      "tableId": table_ids,
      "orqty": or_qty,
      "orAmount": or_amount
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

//-------- for order report--------------
  Future<List<SelectOrderReportModel>?> getOrderReport(
      {required DateTime Fromdate, required DateTime Todate}) async {
    String from_pickdate =
        DateFormat('yyyy-MM-dd ').format(Fromdate) + "00:00:00";
    String To_pickdate = DateFormat('yyyy-MM-dd ').format(Todate) + "23:59:59";
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(ApiPaths.getOrdrereports));
    request.body = json
        .encode({"orderDateFrom": from_pickdate, "orderDateTo": To_pickdate});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      var body = jsonDecode(await response.stream.bytesToString());
      if (body["status"] == 200) {
        final seletOrder =
            selectOrderReportModelFromJson(jsonEncode(body["data"]));
        return seletOrder;
      } else {
        Exception('data is null');
      }
    } else {
      print(response.reasonPhrase);
    }
  }

  //-----to select the data of product that we want to select the order detail to report--------------------
  Future<List<SelectOrderDetailReportModel>?> SelectordertoReport(
      {required int or_id}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse(ApiPaths.SelectOrderByReport));
      request.body = json.encode({"or_id": or_id});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body["status"] == true) {
          final seletOrder =
              selectOrderDetailReportModelFromJson(jsonEncode(body["data"]));
          return seletOrder;
        } else {
          Exception('data is null');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log(e.toString());
    }
  }

  //----get product to  make report-----------
  Future<List<GetProductModel>?> getproduct_makeReport() async {
    try {
      var request =
          http.Request('GET', Uri.parse(ApiPaths.getProduct_makeReport));
      request.body = '''''';

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body["status"] == 200) {
          final selectproduct =
              getProductModelFromJson(jsonEncode(body["data"]));
          return selectproduct;
        } else {
          Exception('data is null');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {}
  }

  //----get orderdetail to  make report-----------
  Future<List<GetOrderDetailModel>?> getorderdetail_makeReport(
      {required DateTime Fromdate, required DateTime Todate}) async {
    String from_pickdate = DateFormat('yyyy-MM-dd ').format(Fromdate) +
        "00:00:00"; // <----for the 00:00:00 is to set the hours be for save to the databaes
    String To_pickdate = DateFormat('yyyy-MM-dd ').format(Todate) + "23:59:59";
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse(ApiPaths.getOrderdetail_makeReports));
      request.body = json
          .encode({"orderDateFrom": from_pickdate, "orderDateTo": To_pickdate});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body["status"] == 200) {
          final selectproduct =
              getOrderDetailModelFromJson(jsonEncode(body["data"]));
          return selectproduct;
        } else {
          Exception('data is null');
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {}
  }

  // ..........get order by order status for kitchen.............

  Future<List<OrderStatusModel>?> GetOrderByOrderStatus() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse(ApiPaths.getOrderByOrderStatus));
      request.body = json.encode({"orStatus": 1});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        final selectOrder = orderStatusModelFromJson(jsonEncode(body["data"]));
        return selectOrder;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // ..........get order detail by order_id for kitchen.............

  Future<List<OrderDetailModel>?> getOrderdetail_kitchen(
      {required int or_ids}) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse(ApiPaths.getOrderDetail_kitchen));
      request.body = json.encode({"or_id": or_ids});
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        final selectOrder = orderDetailModelFromJson(jsonEncode(body["data"]));
        return selectOrder;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  // ..........get update order status and table status for kitchen.............

  Future<bool?> getUpdate_OrderStatus_tableStatus({
    required int table_Id,
    required int order_id,
  }) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(ApiPaths.getUpdateTableStatus_orderStatus));
      request.body = json.encode({
        "tableId": table_Id,
        "tableStatus": 2,
        "orderId": order_id,
        "orderStatus": 2
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        print(await response.stream.bytesToString());
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
