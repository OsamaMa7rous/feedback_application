// To parse this JSON data, do
//
//     final feedBacksModel = feedBacksModelFromJson(jsonString);

import 'dart:convert';

FeedBacksModel feedBacksModelFromJson(String str) =>
    FeedBacksModel.fromJson(json.decode(str));

String feedBacksModelToJson(FeedBacksModel data) => json.encode(data.toJson());

class FeedBacksModel {
  FeedBacksModel({
    required this.response,
    required this.data,
  });

  Response? response;
  List<Datum>? data;

  factory FeedBacksModel.fromJson(Map<String, dynamic> json) => FeedBacksModel(
        response: json["Response"] == null
            ? null
            : Response.fromJson(json["Response"]),
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "Response": response == null ? null : response?.toJson(),
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.email,
    required this.mess,
    required this.sessionId,
    required this.sessionTitle,
    required this.instructorName,
  });

  String id;
  String email;
  String mess;
  String sessionId;
  String sessionTitle;
  String instructorName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"] == null ? null : json["id"],
        email: json["email"] == null ? null : json["email"],
        mess: json["mess"] == null ? null : json["mess"],
        sessionId: json["sessionId"] == null ? null : json["sessionId"],
        sessionTitle:
            json["session_title"] == null ? null : json["session_title"],
        instructorName:
            json["instructor_name"] == null ? null : json["instructor_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "email": email == null ? null : email,
        "mess": mess == null ? null : mess,
        "sessionId": sessionId == null ? null : sessionId,
        "session_title": sessionTitle == null ? null : sessionTitle,
        "instructor_name": instructorName == null ? null : instructorName,
      };
}

class Response {
  Response({
    required this.success,
    required this.message,
    this.token,
  });

  int success;
  String message;
  dynamic token;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        success: json["success"] == null ? null : json["success"],
        message: json["message"] == null ? null : json["message"],
        token: json["Token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success == null ? null : success,
        "message": message == null ? null : message,
        "Token": token,
      };
}
