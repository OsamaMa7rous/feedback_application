// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.response,
    required this.data,
  });

  Response? response;
  Data? data;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    response: json["Response"] == null ? null : Response.fromJson(json["Response"]),
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "Response": response == null ? null : response?.toJson(),
    "data": data == null ? null : data?.toJson(),
  };
}

class Data {
  Data({
    required this.uname,
    required this.phone,
  });

  String uname;
  String phone;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    uname: json["uname"] == null ? null : json["uname"],
    phone: json["phone"] == null ? null : json["phone"],
  );

  Map<String, dynamic> toJson() => {
    "uname": uname == null ? null : uname,
    "phone": phone == null ? null : phone,
  };
}

class Response {
  Response({
    required  this.success,
    required  this.message,
    required  this.token,
  });

  int success;
  String message;
  String token;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
    token: json["Token"] == null ? null : json["Token"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
    "Token": token == null ? null : token,
  };
}
