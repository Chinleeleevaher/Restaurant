// To parse this JSON data, do
//
//     final userLoginModel = userLoginModelFromJson(jsonString);

import 'dart:convert';

List<UserLoginModel> userLoginModelFromJson(String str) => List<UserLoginModel>.from(json.decode(str).map((x) => UserLoginModel.fromJson(x)));

String userLoginModelToJson(List<UserLoginModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserLoginModel {
    int uid;
    String username;
    String email;
    String password;
    int phone;
    String gender;
    String address;
    String status;
    String image;

    UserLoginModel({
        required this.uid,
        required this.username,
        required this.email,
        required this.password,
        required this.phone,
        required this.gender,
        required this.address,
        required this.status,
        required this.image,
    });

    factory UserLoginModel.fromJson(Map<String, dynamic> json) => UserLoginModel(
        uid: json["uid"],
        username: json["username"],
        email: json["email"],
        password: json["password"],
        phone: json["phone"],
        gender: json["gender"],
        address: json["address"],
        status: json["status"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "uid": uid,
        "username": username,
        "email": email,
        "password": password,
        "phone": phone,
        "gender": gender,
        "address": address,
        "status": status,
        "image": image,
    };
}
