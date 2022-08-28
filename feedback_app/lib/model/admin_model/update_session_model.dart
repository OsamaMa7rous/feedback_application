// To parse this JSON data, do
//
//     final updateSessionModel = updateSessionModelFromJson(jsonString);

import 'dart:convert';

UpdateSessionModel updateSessionModelFromJson(String str) => UpdateSessionModel.fromJson(json.decode(str));

String updateSessionModelToJson(UpdateSessionModel data) => json.encode(data.toJson());

class UpdateSessionModel {
  UpdateSessionModel({
    required this.response,
  });

  Response? response;

  factory UpdateSessionModel.fromJson(Map<String, dynamic> json) => UpdateSessionModel(
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
