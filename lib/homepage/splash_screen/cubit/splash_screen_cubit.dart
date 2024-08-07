import 'dart:convert';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myproject/config/app_rount.dart';
import 'package:myproject/config/navigation.dart';
import 'package:http/http.dart' as http;
import 'package:myproject/constant/api_path.dart';
import 'package:myproject/login/home_provider/provider.dart';
import 'package:myproject/model/loginmodel.dart';

part 'splash_screen_state.dart';

// ignore: prefer_const_declarations
final storage = const FlutterSecureStorage();

class SplashScreenCubit extends Cubit<SplashScreenState> {
  final UserProvider homeProvider;
  SplashScreenCubit({
    required this.homeProvider,
  }) : super(const SplashScreenState());

  /// -------this fucntion is to make keep login
  Future<void> validateToken() async {
    String? username =
        await storage.read(key: "username"); // <-- here is to reread username
    String? password = await storage.read(key: "password");

    if (username != null && password != null) {
      // <-- then check it here
      try {
        var headers = {'Content-Type': 'application/json'};
        var request = http.Request('POST', Uri.parse(ApiPaths.loginPath));
        request.body = json.encode({
          "username": username,
          "password": password
        }); // <--then keep value here and send to API login
        request.headers.addAll(headers);

        http.StreamedResponse response = await request.send();

        if (response.statusCode == 200) {
          var body = jsonDecode(await response.stream
              .bytesToString()); // <--here is working as if data not equa to null then zip the data to model
          if (body['data'] != null) {
            final model = userLoginModelFromJson(jsonEncode(body['data']));
            //this below line is to save the model back to the "homeProvider.setIsUserlist"
            homeProvider.setUser(model[0]);
          navService.pushNamedAndRemoveUntil(AppRount.dashboard);
          //  navService.pushReplacementNamed(AppRount.dashboard);
          } else {
           navService.pushNamedAndRemoveUntil(AppRount.loginpage);
          
          }
        } else {
        //  print(response.reasonPhrase);
        }
      } catch (e) {
        log('Error $e');
      }
    } else {
      navService.pushNamedAndRemoveUntil(AppRount
          .loginpage); // here is the first run it will come to the login page if not make remember
    }

    //---not ready here is need to check if the token is not yet spire then log to the homegae and if the token is spire already then log in to the login page. here we can check the token or username it is ok but for to do this we need to write in API ------------------
  }
}
