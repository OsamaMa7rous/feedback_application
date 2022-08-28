// To parse this JSON data, do
//
//     final addSessionModel = addSessionModelFromJson(jsonString);

import 'dart:convert';

AddSessionModel addSessionModelFromJson(String str) => AddSessionModel.fromJson(json.decode(str));

String addSessionModelToJson(AddSessionModel data) => json.encode(data.toJson());

class AddSessionModel {
  AddSessionModel({
    required  this.response,
  });

  Response? response;

  factory AddSessionModel.fromJson(Map<String, dynamic> json) => AddSessionModel(
    response: json["Response"] == null ? null : Response.fromJson(json["Response"]),
  );

  Map<String, dynamic> toJson() => {
    "Response": response == null ? null : response?.toJson(),
  };
}

class Response {
  Response({
    required this.success,
    required  this.message,
  });

  int success;
  String message;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
    success: json["success"] == null ? null : json["success"],
    message: json["message"] == null ? null : json["message"],
  );

  Map<String, dynamic> toJson() => {
    "success": success == null ? null : success,
    "message": message == null ? null : message,
  };
}
