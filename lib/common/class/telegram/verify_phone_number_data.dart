// To parse this JSON data, do
//
//     final verifyPhoneNumberData = verifyPhoneNumberDataFromJson(jsonString);

import 'dart:convert';

VerifyPhoneNumberData verifyPhoneNumberDataFromJson(String str) =>
    VerifyPhoneNumberData.fromJson(json.decode(str));

String verifyPhoneNumberDataToJson(VerifyPhoneNumberData data) =>
    json.encode(data.toJson());

class VerifyPhoneNumberData {
  VerifyPhoneNumberData({
    required this.type,
    required this.authorizationState,
  });

  String type;
  AuthorizationState authorizationState;

  factory VerifyPhoneNumberData.fromJson(Map<String, dynamic> json) =>
      VerifyPhoneNumberData(
        type: json["@type"],
        authorizationState:
            AuthorizationState.fromJson(json["authorization_state"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "authorization_state": authorizationState.toJson(),
      };
}

class AuthorizationState {
  AuthorizationState({
    required this.type,
    required this.codeInfo,
  });

  String type;
  CodeInfo codeInfo;

  factory AuthorizationState.fromJson(Map<String, dynamic> json) =>
      AuthorizationState(
        type: json["@type"],
        codeInfo: CodeInfo.fromJson(json["code_info"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "code_info": codeInfo.toJson(),
      };
}

class CodeInfo {
  CodeInfo({
    required this.type,
    required this.phoneNumber,
    required this.codeInfoType,
    required this.timeout,
  });

  String type;
  String phoneNumber;
  Type codeInfoType;
  int timeout;

  factory CodeInfo.fromJson(Map<String, dynamic> json) => CodeInfo(
        type: json["@type"],
        phoneNumber: json["phone_number"],
        codeInfoType: Type.fromJson(json["type"]),
        timeout: json["timeout"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "phone_number": phoneNumber,
        "type": codeInfoType.toJson(),
        "timeout": timeout,
      };
}

class Type {
  Type({
    required this.type,
    required this.length,
  });

  String type;
  int length;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["@type"],
        length: json["length"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "length": length,
      };
}
