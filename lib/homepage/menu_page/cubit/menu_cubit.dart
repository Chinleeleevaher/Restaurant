import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/constant/api_path.dart';
import 'package:myproject/homepage/menu_page/menuProvider.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/menu_page/model/orderproductModel.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/homepage/menu_page/tablemenuModel.dart';
import 'package:myproject/homepage/order/model/orderproductmodel.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/homepage/table_page/model/table.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/repository/authen_sipository.dart';

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  final orderprovider orderproviders;
  final tableprovide tableProviders;
  final AuthenRepository authenRepository;
  final tableProvider tablePros;
  final BuildContext context;


  MenuCubit({
    required this.orderproviders,
    required this.tablePros,
    required this.context,

    
    required this.tableProviders,
    required this.authenRepository,
  }) : super(MenuState(listproductype: [
          Producttype(
            protypeId: 0,
            protypeName: 'All',
          )
        ] // <-- here is to set default value as 0 and set it to select product from API. protypeName --> is to set default index name as "ALL"
            ));
  //----getproducttype------
  Future<void> getProductTypes() async {
    emit(state.coppywith(status_c: menuliststatuse.loading));

    final url = Uri.parse(ApiPaths.producttypepath);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final productTypes = producttypeFromJson(jsonEncode(jsonData['data']));
      print('print $jsonData');
      emit(state.coppywith(
          status_c: menuliststatuse.sucess,
          listproductype_c: state.listproductype! +
              productTypes)); // <-- here is to plus listproductype it is make a containner on the first
    } else {
      throw Exception('Failed to load product types');
    }
  }

  //---getproduct-------
  Future<void> getproduct() async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse(ApiPaths.productpath));
    request.body = json.encode({
      "typeId": state.typeSelect == null
          ? ''
          : state.typeSelect!
              .protypeId, // <-- meaning in first time is to send null or "" to API. if we make ontap then send the index to API
      "unitId": 0
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      // print(await response.stream.bytesToString()); do not use this one it make an error

      var body = jsonDecode(await response.stream.bytesToString());

      if (body['data'] != null) {
        final product = productFromJson(jsonEncode(body['data']));

        emit(state.coppywith(
            status_c: menuliststatuse.sucess,
            listproduct_c:
                product)); // <-- send value of product to listproduct_c
      }
    } else {
      print("not success");
      print(response.reasonPhrase);
    }
  }

// -----this below fucntion is to get the value: index from menu page and keep to select product from AIP. on the above fucntion-----
  onTypeSelect(value) {
    emit(state.coppywith(typeSelect_c: value));
    getproduct(); // <-- here is make to reload and again when i ontap in the product type then reflesh
  }

  ///..............here is to make oreder...................
  otypeorder(ProductModel value) {
    var orderlist = OrderproductModelMenu(
        productId: value.productId,
        productName: value.productName,
        protypeId: value.protypeId,
        unitId: value.unitId,
        price: value.price,
        cost: value.cost,
        image: value.image,
        qty: 1,
        total: 0.0,
        amount: 0.0);

    if (orderproviders.getorderlist.length >= 0) {
      tableProviders.setOrderlist(orderlist);
    }
  }

  ///..................to select table for make order menu.......................
  Future<void> menutable() async {
    emit(state.coppywith(status_c: menuliststatuse.loading));
    var result = await authenRepository.menutable();
    result!.fold(
      // ignore: non_constant_identifier_names
      (Left) {},
     (data) {
      tableProviders.getTbleMenu(data);
       emit(state.coppywith(
          status_c: menuliststatuse.sucess,
         ));
    });
  }

  // ----- collect table id-----
  onTypeOrderID(Menutable value) {
   tablePros.settableid(value);
  }

}

