// To parse this JSON data, do
//
//     final getSessionsModel = getSessionsModelFromJson(jsonString);

import 'dart:convert';

GetSessionsModel getSessionsModelFromJson(String str) => GetSessionsModel.fromJson(json.decode(str));

String getSessionsModelToJson(GetSessionsModel data) => json.encode(data.toJson());

class GetSessionsModel {
  GetSessionsModel({
    required   this.response,
    required  this.data,
  });

  Response? response;
  List<Datum>? data;

  factory GetSessionsModel.fromJson(Map<String, dynamic> json) => GetSessionsModel(
    response: json["Response"] == null ? null : Response.fromJson(json["Response"]),
    data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Response": response == null ? null : response?.toJson(),
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  Datum({
    required  this.sessionId,
    required this.sessionTitle,
    required  this.instructorName,
  });

  String sessionId;
  String sessionTitle;
  String instructorName;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    sessionId: json["sessionId"] == null ? null : json["sessionId"],
    sessionTitle: json["session_title"] == null ? null : json["session_title"],
    instructorName: json["instructor_name"] == null ? null : json["instructor_name"],
  );

  Map<String, dynamic> toJson() => {
    "sessionId": sessionId == null ? null : sessionId,
    "session_title": sessionTitle == null ? null : sessionTitle,
    "instructor_name": instructorName == null ? null : instructorName,
  };
}

class Response {
  Response({
    required this.success,
    required  this.message,
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
