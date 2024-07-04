// To parse this JSON data, do
//
//     final getUserDetailModel = getUserDetailModelFromJson(jsonString);

import 'dart:convert';

GetUserDetailModel getUserDetailModelFromJson(String str) => GetUserDetailModel.fromJson(json.decode(str));

String getUserDetailModelToJson(GetUserDetailModel data) => json.encode(data.toJson());

class GetUserDetailModel {
    int uid;
    String username;
    String email;
    String password;
    int phone;
    String gender;
    String address;
    String status;
    String image;

    GetUserDetailModel({
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

    factory GetUserDetailModel.fromJson(Map<String, dynamic> json) => GetUserDetailModel(
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
