// To parse this JSON data, do
//
//     final wrongPhoneNumber = wrongPhoneNumberFromJson(jsonString);

import 'dart:convert';

WrongPhoneNumber wrongPhoneNumberFromJson(String str) =>
    WrongPhoneNumber.fromJson(json.decode(str));

String wrongPhoneNumberToJson(WrongPhoneNumber data) =>
    json.encode(data.toJson());

class WrongPhoneNumber {
  WrongPhoneNumber({
    required this.type,
    required this.code,
    required this.message,
    required this.invokeRequest,
  });

  String type;
  int code;
  String message;
  InvokeRequest invokeRequest;

  factory WrongPhoneNumber.fromJson(Map<String, dynamic> json) =>
      WrongPhoneNumber(
        type: json["@type"],
        code: json["code"],
        message: json["message"],
        invokeRequest: InvokeRequest.fromJson(json["invoke_request"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "code": code,
        "message": message,
        "invoke_request": invokeRequest.toJson(),
      };
}

class InvokeRequest {
  InvokeRequest({
    required this.type,
    required this.clientId,
    required this.phoneNumber,
    required this.extra,
  });

  String type;
  double clientId;
  String phoneNumber;
  String extra;

  factory InvokeRequest.fromJson(Map<String, dynamic> json) => InvokeRequest(
        type: json["@type"],
        clientId: json["client_id"]?.toDouble(),
        phoneNumber: json["phone_number"],
        extra: json["@extra"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "client_id": clientId,
        "phone_number": phoneNumber,
        "@extra": extra,
      };
}
