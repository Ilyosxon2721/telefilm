// To parse this JSON data, do
//
//     final authorizationState = authorizationStateFromJson(jsonString);

import 'dart:convert';

AuthorizationState authorizationStateFromJson(String str) =>
    AuthorizationState.fromJson(json.decode(str));

String authorizationStateToJson(AuthorizationState data) =>
    json.encode(data.toJson());

class AuthorizationState {
  AuthorizationState({
    required this.type,
    required this.authorizationState,
  });

  String type;
  AuthorizationStateClass authorizationState;

  factory AuthorizationState.fromJson(Map<String, dynamic> json) =>
      AuthorizationState(
        type: json["@type"],
        authorizationState:
            AuthorizationStateClass.fromJson(json["authorization_state"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "authorization_state": authorizationState.toJson(),
      };
}

class AuthorizationStateClass {
  AuthorizationStateClass({
    required this.type,
  });

  String type;

  factory AuthorizationStateClass.fromJson(Map<String, dynamic> json) =>
      AuthorizationStateClass(
        type: json["@type"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
      };
}
