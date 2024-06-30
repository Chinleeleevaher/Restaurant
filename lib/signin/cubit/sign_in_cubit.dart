import 'dart:convert';
import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/constant/api_path.dart';
import 'package:myproject/login/Login_page.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(SignInState());

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final UserNameControllerr = TextEditingController();
  final EmailControllerr = TextEditingController();
  final PasswordeControllerr = TextEditingController();

// -------------fanction API--------------//
//of login

  Future<void> creatUser(BuildContext context) async {
    if (formkey.currentState!.validate()) {
      emit(state.coppywith(status_c: statuslist.loading, message: ''));
    }
// ----this dailog is work when we make signin and waitting
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: const SizedBox(
              height: 100,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        });
    try {
      var headers = {'Content-Type': 'application/json'};
      var request = http.Request(
          'POST', Uri.parse(ApiPaths.registerPath));
      request.body = json.encode({
        "username": UserNameControllerr.text,
        "password": PasswordeControllerr.text,
        "email": EmailControllerr.text
      });
      request.headers.addAll(headers);

      http.StreamedResponse response = await request.send();

      // if (body['data'] == UserNameControllerr.text) {}
      if (response.statusCode == 200) {
        //print(await response.stream.bytesToString());

        var body = jsonDecode(await response.stream.bytesToString());
        log('log: $body');
        if (body['status'] == false) {
          emit(state.coppywith(
              status_c: statuslist.error, message: 'This user already exists'));
          Navigator.pop(context);
          //this below line is to make message show
          Fluttertoast.showToast(
              msg: body['message'], gravity: ToastGravity.CENTER);
        } else {
          Fluttertoast.showToast(
              msg: body['message'], gravity: ToastGravity.CENTER);
          Navigator.pop(context);
          Navigator.pop(context);
        }
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      log('Error: $e');
    }
  }
}
