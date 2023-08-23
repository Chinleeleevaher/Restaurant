import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:myproject/constant/api_path.dart';
import 'package:myproject/homepage/menu_page/model/model.dart';
import 'package:myproject/homepage/menu_page/model/product_model.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:http/http.dart' as http;

part 'menu_state.dart';

class MenuCubit extends Cubit<MenuState> {
  MenuCubit()
      : super(MenuState(listproductype: [
          Producttype(protypeId: 0,  protypeName: 'All',)
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
      "typeId": state.typeSelect == null? ''
          : state.typeSelect!
              .protypeId, // <-- meaning in first time is to send null or "" to API. if we make ontap then send the index to API
      "unitId":0
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

  //-----------//-----------
  // Future<void> getproduct() async {
  //   emit(state.coppywith(status_c: menuliststatuse.loading));

  //   final url = Uri.parse('http://192.168.213.61:3005/food');
  //   final response = await http.post(url,
  //   headers:{} ,
  //    body: {
  //     "typeId": state.typeSelect == null ? '1' : state.typeSelect!.protypeId,
  //   });
  //   if (response.statusCode == 200) {
  //     final jsonData = json.decode(response.body);
  //     final product = productFromJson(jsonEncode(jsonData['data']));
  //     print('print $jsonData');
  //     emit(state.coppywith(
  //         status_c: menuliststatuse.sucess, listproduct_c: product));
  //   } else {
  //     throw Exception('Failed to load product types');
  //   }
  // }

// -----this below fucntion is to get the value: index from menu page and keep to select product from AIP. on the above fucntion-----
  onTypeSelect(value) {
    emit(state.coppywith(typeSelect_c: value));
    getproduct(); // <-- here is make to reload and again when i ontap in the product type then reflesh
  }
}
