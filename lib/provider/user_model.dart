// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
    int uid;
    String username;
    String password;
    String email;

    User({
        required this.uid,
        required this.username,
        required this.password,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
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
