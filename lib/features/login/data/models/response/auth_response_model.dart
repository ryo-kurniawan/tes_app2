import 'package:meta/meta.dart';
import 'dart:convert';

class AuthResponseModel {
  final String username;
  final String email;
  final String fullName;
  final String nik;
  final String nip;
  final String photo;
  final String accessToken;
  final int expiresIn;
  final String refreshToken;
  final int refreshExpiresIn;
  final bool visualization;

  AuthResponseModel({
    required this.username,
    required this.email,
    required this.fullName,
    required this.nik,
    required this.nip,
    required this.photo,
    required this.accessToken,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshExpiresIn,
    required this.visualization,
  });

  factory AuthResponseModel.fromJson(String str) =>
      AuthResponseModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory AuthResponseModel.fromMap(Map<String, dynamic> json) =>
      AuthResponseModel(
        username: json["username"],
        email: json["email"],
        fullName: json["fullName"],
        nik: json["nik"],
        nip: json["nip"],
        photo: json["photo"],
        accessToken: json["access_token"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        refreshExpiresIn: json["refresh_expires_in"],
        visualization: json["visualization"],
      );

  Map<String, dynamic> toMap() => {
        "username": username,
        "email": email,
        "fullName": fullName,
        "nik": nik,
        "nip": nip,
        "photo": photo,
        "access_token": accessToken,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "refresh_expires_in": refreshExpiresIn,
        "visualization": visualization,
      };
}
