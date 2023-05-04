// To parse this JSON data, do
//
//     final authToken = authTokenFromJson(jsonString);

import 'dart:convert';

AuthToken authTokenFromJson(String str) => AuthToken.fromJson(json.decode(str));

String authTokenToJson(AuthToken data) => json.encode(data.toJson());

class AuthToken {
  AuthToken({
    required this.type,
    required this.name,
    required this.value,
  });

  String type;
  String name;
  Value value;

  factory AuthToken.fromJson(Map<String, dynamic> json) => AuthToken(
        type: json["@type"],
        name: json["name"],
        value: Value.fromJson(json["value"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "name": name,
        "value": value.toJson(),
      };
}

class Value {
  Value({
    required this.type,
    required this.value,
  });

  String type;
  String value;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        type: json["@type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "value": value,
      };
}
