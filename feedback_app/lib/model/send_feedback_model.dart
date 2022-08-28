// To parse this JSON data, do
//
//     final sendFeedbackModel = sendFeedbackModelFromJson(jsonString);

import 'dart:convert';

SendFeedbackModel sendFeedbackModelFromJson(String str) => SendFeedbackModel.fromJson(json.decode(str));

String sendFeedbackModelToJson(SendFeedbackModel data) => json.encode(data.toJson());

class SendFeedbackModel {
  SendFeedbackModel({
    required this.response,
  });

  Response? response;

  factory SendFeedbackModel.fromJson(Map<String, dynamic> json) => SendFeedbackModel(
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
