import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/constant/api_path.dart';
import 'package:myproject/homepage/addproduct/component/model.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/table_page/cubit/tabletype_cubit.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/homepage/table_page/model/tabletype.dart';

import '../homepage/menu_page/model/product_model.dart';
import '../homepage/menu_page/model/unit.dart';

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
  Future<List<Tables>?> getTable({required int typeids}) async {
    try {
      // var headers = {'Content-Type': 'application/json'};
      // final response = await http.post(Uri.parse(ApiPaths.tablepath), body: {"typeId": "$typeids"});
      // response.headers.addAll(headers);
      // if (response.statusCode == 200) {
      //   var jsonData = jsonDecode(response.body);
      //   if (jsonData['data'] != null) {
      //     var datas = tableFromJson(jsonEncode(jsonData['data']));
      //     return datas;
      //   }
      //   Exception('data is null');
      // } else {
      //   Exception('Failed to load table types');
      // }

      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiPaths.tablepath));
      request.body = json.encode({"typeId": typeids});
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

  // -----of producttype-----
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
    var request = http.MultipartRequest(
        'POST', Uri.parse('http://192.168.237.61:3005/upload'));
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
      required String imagname}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request(
        'POST', Uri.parse('http://192.168.237.61:3005/add-product'));
    request.body = json.encode({
      "product_id": Pro_id,
      "product_name": Pro_name,
      "protype_id": Protype_id,
      "unit_id": unit_id,
      "price": pro_price,
      "cost": pro_cost,
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
}
