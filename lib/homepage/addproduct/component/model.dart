// To parse this JSON data, do
//
//     final image = imageFromJson(jsonString);

import 'dart:convert';

ImageModel imageFromJson(String str) => ImageModel.fromJson(json.decode(str));

String imageToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel {
    int success;
    String profileUrl;

    ImageModel({
        required this.success,
        required this.profileUrl,
    });

    factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        success: json["success"],
        profileUrl: json["profile_url"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "profile_url": profileUrl,
    };
}
