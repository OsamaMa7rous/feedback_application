// To parse this JSON data, do
//
//     final deleteSessionModel = deleteSessionModelFromJson(jsonString);

import 'dart:convert';

DeleteSessionModel deleteSessionModelFromJson(String str) => DeleteSessionModel.fromJson(json.decode(str));

String deleteSessionModelToJson(DeleteSessionModel data) => json.encode(data.toJson());

class DeleteSessionModel {
  DeleteSessionModel({
    required  this.response,
  });

  Response? response;

  factory DeleteSessionModel.fromJson(Map<String, dynamic> json) => DeleteSessionModel(
    response: json["Response"] == null ? null : Response.fromJson(json["Response"]),
  );

  Map<String, dynamic> toJson() => {
    "Response": response == null ? null : response?.toJson(),
  };
}

class Response {
  Response({
    required this.success,
    required this.message,
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
