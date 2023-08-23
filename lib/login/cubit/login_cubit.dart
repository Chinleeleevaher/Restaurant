import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myproject/homepage/menu.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/model/loginmodel.dart';
import 'package:http/http.dart' as http;

class CubitCubit extends Cubit<CubitState> {
  //this line is to help provider page can access this page
  final UserProvider homeProvider;
  CubitCubit({
    required this.homeProvider,
  }) : super(CubitState());

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final UserNameControllerr = TextEditingController();
  final EmailControllerr = TextEditingController();
  final PasswordeControllerr = TextEditingController();
  final storage = const FlutterSecureStorage();

// -------------fanction API--------------//

  //of login
  Future<void> Login(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      emit(state.copywith(status_c: liststatuse.loading));
    }
    try {
      var headers = {'Content-Type': 'application/json'};
      var request =
          http.Request('POST', Uri.parse('http://192.168.213.61:3005/login'));
      request.body = json.encode({
        "username": UserNameControllerr.text,
        "password": PasswordeControllerr.text
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream.bytesToString());
        if (body['data'] != null) {
          final model = userLoginModelFromJson(jsonEncode(body['data']));

          emit(
            state.copywith(user_c: model, status_c: liststatuse.success),
          );
          //this below line is to save the model back to the "homeProvider.setIsUserlist"
          homeProvider.setIsUserlist(model);

          // here is to save the token to storage
          final String token = body['token'];
          await storage.write(key: 'token', value: token);
          //here is to clear the text and push to other page
          UserNameControllerr.clear();
          PasswordeControllerr.clear();
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => Menu()));
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Error $e');
    }
  }

//of create user
}
