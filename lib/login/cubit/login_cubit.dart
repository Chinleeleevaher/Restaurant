import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:myproject/constant/api_path.dart';
import 'package:myproject/homepage/menu_page/menu.dart';
import 'package:myproject/login/cubit/login_state.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/model/loginmodel.dart';
import 'package:http/http.dart' as http;

class CubitCubit extends Cubit<CubitState> {
  final BuildContext context;
  final UserProvider
      homeProvider; // <--this line is to help provider page can access this page
  CubitCubit({
    required this.context,
    required this.homeProvider,
  }) : super(CubitState());

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final UserNameControllerr = TextEditingController();
  final EmailControllerr = TextEditingController();
  final PasswordeControllerr = TextEditingController();
  final storage = const FlutterSecureStorage();
  bool rember = true;

// -------------fanction API--------------//

  //of login
  Future<void> Login(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      emit(state.copywith(status_c: liststatuse.loading));
    }
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request('POST', Uri.parse(ApiPaths.loginPath));
      request.body = json.encode({
        "username": UserNameControllerr.text,
        "password": PasswordeControllerr.text
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var body = jsonDecode(await response.stream
            .bytesToString()); // <--here is working as if data not equa to null then zip the data to model
        if (body['data'] != null) {
          final model = userLoginModelFromJson(jsonEncode(body['data']));

          emit(
            state.copywith(
              user_c: model,
              status_c: liststatuse.success,
            ),
          );
          //this below line is to save the model back to the "homeProvider.setIsUserlist"
          homeProvider.setUser(model[0]);

          // here is to save the token to storage
          final String token = body['token'];
          await storage.write(key: 'token', value: token);
          // ---- here is to stor the username and password then send it to the splash page to read and keep login

          await storage.write(key: 'username', value: UserNameControllerr.text);
          await storage.write(
              key: 'password', value: PasswordeControllerr.text);
          await storage.write(key: 'token', value: body['token']);

          if (state.rememberme == true) {
            await storage.write(
                key: 'getusername', value: UserNameControllerr.text);
            await storage.write(
                key: 'getpassword', value: PasswordeControllerr.text);
          }
          //here is to clear the text and push to other page
          UserNameControllerr.clear();
          PasswordeControllerr.clear();
          // Navigator.of(context)
          //     .pushReplacement(MaterialPageRoute(builder: (context) => Menu()));

          navService.pushReplacementNamed(AppRount.dashboard);
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Error $e');
    }
  }

  bool _mounted = true; // <--this is to make for protect if the
  // this below method is to protect if during load data from APi but we ປິດ app  ລົງ then this fucntion will be help do not make error
  @override
  Future<void> close() {
    _mounted = false;
    return super.close();
  }

  //---rememberme on login---
  onChangedRemember() {
    if (_mounted) {
      emit(state.copywith(
        rememberme_c: !state
            .rememberme!, // <-- !state.rememberme! send the value here false and ! is must not null and ! in font must not equal to state.rememberme!. so now rememberme_c: must not equal to  !state.rememberme!, it's mean equal true
      ));
    }
  }

//----change laguange---------
  onChangedLanguage(String value) {
    context.setLocale(Locale(value));
  }
}
