import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/constant/api_path.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/homepage/order/model/orderproductmodel.dart';
import 'package:myproject/homepage/order/provider.dart';
import 'package:myproject/homepage/table_page/cubit/provider/tableprovider.dart';
import 'package:myproject/repository/authen_sipository.dart';

import 'lisproduct_cubit.dart';

part 'lisproduct_state.dart';

class LisproductCubit extends Cubit<LisproductState> {
  final orderprovider orderproviders;
  final tableProvider tableproviders;
  final AuthenRepository authenRepository;
  LisproductCubit({
    required this.orderproviders,
    required this.tableproviders,
    required this.authenRepository,
  }) : super(LisproductState(listproductype: [
          Producttype(
            protypeId: 0,
            protypeName: 'All',
          )
        ]));

  //----getproducttype------
  Future<void> getProductTypes() async {
    emit(state.coppywith(status_c: listproduct_status.loading));

    final url = Uri.parse(ApiPaths.producttypepath);
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final productTypes = producttypeFromJson(jsonEncode(jsonData['data']));
      print('print $jsonData');
      emit(state.coppywith(
          status_c: listproduct_status.sucess,
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
            status_c: listproduct_status.sucess,
            listproduct_c:
                product)); // <-- send value of product to listproduct_c
      }
    } else {
      print("not success");
      print(response.reasonPhrase);
    }
  }

  onTypeSelect(value) {
    emit(state.coppywith(typeSelect_c: value));
    getproduct(); // <-- here is make to reload and again when i ontap in the product type then reflesh
  }

  //----------<to order product list>-----------
  otypeorder(ProductModel value) {
    var orderlist = OrderproductModel(
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
      orderproviders.setOrderlist(orderlist);
    }
  }

  //----to insert oder product--------
  Future<void> postorderlist() async {
    emit(state.coppywith(status_c: listproduct_status.loading));
    var result = await authenRepository.orderpro(
        order_qty: 0,
        order_amount: 0,
        order_table: tableproviders.gettablelist.tableId,
        order_status: tableproviders.gettablelist.tableStatus);
    result!.fold((Left) {
      log("Error");
    }, (Right) {
      orderproviders.orderlisttable(Right!); // <--here is to keep value to the provider
      print("respomse $Right");
      emit(state.coppywith(status_c: listproduct_status.sucess));
    });
  }
}
