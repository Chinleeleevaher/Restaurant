// // To parse this JSON data, do
// //
// //     final getUserModel = getUserModelFromJson(jsonString);

// import 'dart:convert';

// List<GetUserModel> getUserModelFromJson(String str) => List<GetUserModel>.from(json.decode(str).map((x) => GetUserModel.fromJson(x)));

// String getUserModelToJson(List<GetUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class GetUserModel {
//     int uid;
//     String username;
//     String email;
//     String password;
//     int phone;
//     String gender;
//     String address;
//     String status;
//     String image;

//     GetUserModel({
//         required this.uid,
//         required this.username,
//         required this.email,
//         required this.password,
//         required this.phone,
//         required this.gender,
//         required this.address,
//         required this.status,
//         required this.image,
//     });

//     factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
//         uid: json["uid"],
//         username: json["username"],
//         email: json["email"],
//         password: json["password"],
//         phone: json["phone"],
//         gender: json["gender"],
//         address: json["address"],
//         status: json["status"],
//         image: json["image"],
//     );

//     Map<String, dynamic> toJson() => {
//         "uid": uid,
//         "username": username,
//         "email": email,
//         "password": password,
//         "phone": phone,
//         "gender": gender,
//         "address": address,
//         "status": status,
//         "image": image,
//     };
// }

// To parse this JSON data, do
//
//     final getUserModel = getUserModelFromJson(jsonString);
// To parse this JSON data, do
//
//     final getUserModel = getUserModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

List<GetUserModel> getUserModelFromJson(String str) => List<GetUserModel>.from(json.decode(str).map((x) => GetUserModel.fromJson(x)));

String getUserModelToJson(List<GetUserModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetUserModel {
    int uid;
    String username;
    String email;
    String password;
    int? phone;
    String? gender;
    String? address;
    String? status;
    String? image;

    GetUserModel({
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

    factory GetUserModel.fromJson(Map<String, dynamic> json) => GetUserModel(
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

