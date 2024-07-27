// To parse this JSON data, do
//
//     final addUserModel = addUserModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<AddUserModel> addUserModelFromJson(String str) => List<AddUserModel>.from(json.decode(str).map((x) => AddUserModel.fromJson(x)));

String addUserModelToJson(List<AddUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddUserModel {
    int uid;
    String username;
    String email;
    String password;
    int? phone;
    String? gender;
    String? address;
    String? status;
    String? image;

    AddUserModel({
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

    factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
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
