// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Error errorFromJson(String str) => Error.fromJson(json.decode(str));

String errorToJson(Error data) => json.encode(data.toJson());

class Error {
  Error({
    required this.message,
  });

  String message;

  factory Error.fromJson(Map<String, dynamic> json) => Error(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
  Login({
    required this.message,
    required this.jwt,
    required this.partnerData,
  });

  String message;
  String jwt;
  PartnerData partnerData;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
        message: json["message"],
        jwt: json["jwt"],
        partnerData: PartnerData.fromJson(json["partner_data"]),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "jwt": jwt,
        "partner_data": partnerData.toJson(),
      };
}

class PartnerData {
  PartnerData({
    required this.id,
    required this.login,
    required this.password,
    required this.companyName,
    required this.brandName,
    required this.logo,
    required this.partnerBankName,
    required this.partnerInn,
    required this.partnerBankMfo,
    required this.partnerProps,
    required this.directorId,
    required this.tarifId,
    required this.isActive,
    required this.userAddedId,
    required this.dateAdded,
    required this.licenseTerm,
    required this.status,
  });

  int id;
  String login;
  String password;
  String companyName;
  String brandName;
  String logo;
  String partnerBankName;
  String partnerInn;
  String partnerBankMfo;
  String partnerProps;
  int directorId;
  int tarifId;
  int isActive;
  int userAddedId;
  DateTime dateAdded;
  DateTime licenseTerm;
  String status;

  factory PartnerData.fromJson(Map<String, dynamic> json) => PartnerData(
        id: json["id"],
        login: json["login"],
        password: json["password"],
        companyName: json["company_name"],
        brandName: json["brand_name"],
        logo: json["logo"],
        partnerBankName: json["partner_bank_name"],
        partnerInn: json["partner_inn"],
        partnerBankMfo: json["partner_bank_mfo"],
        partnerProps: json["partner_props"],
        directorId: json["director_id"],
        tarifId: json["tarif_id"],
        isActive: json["is_active"],
        userAddedId: json["user_added_id"],
        dateAdded: DateTime.parse(json["date_added"]),
        licenseTerm: DateTime.parse(json["license_term"]),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "login": login,
        "password": password,
        "company_name": companyName,
        "brand_name": brandName,
        "logo": logo,
        "partner_bank_name": partnerBankName,
        "partner_inn": partnerInn,
        "partner_bank_mfo": partnerBankMfo,
        "partner_props": partnerProps,
        "director_id": directorId,
        "tarif_id": tarifId,
        "is_active": isActive,
        "user_added_id": userAddedId,
        "date_added": dateAdded.toIso8601String(),
        "license_term": licenseTerm.toIso8601String(),
        "status": status,
      };
}
