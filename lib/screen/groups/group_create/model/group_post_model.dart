// To parse this JSON data, do
//
//     final groupBody = groupBodyFromJson(jsonString);

import 'dart:convert';

GroupBody groupBodyFromJson(String str) => GroupBody.fromJson(json.decode(str));

String groupBodyToJson(GroupBody data) => json.encode(data.toJson());

class GroupBody {
  GroupBody({
    required this.success,
    required this.code,
    required this.data,
  });

  bool success;
  int code;
  String data;

  factory GroupBody.fromJson(Map<String, dynamic> json) => GroupBody(
        success: json["success"],
        code: json["code"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "data": data,
      };
}
