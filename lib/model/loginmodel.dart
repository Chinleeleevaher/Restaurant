// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

List<UserLoginModel> userLoginModelFromJson(String str) => List<UserLoginModel>.from(json.decode(str).map((x) => UserLoginModel.fromJson(x)));

String userLoginModelToJson(List<UserLoginModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLoginModel {
    int uid;
    String username;
    String password;
    String email;

    UserLoginModel({
        required this.uid,
        required this.username,
        required this.password,
        required this.email,
    });

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        uid: json["uid"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "password": password,
        "email": email,
    };
}
