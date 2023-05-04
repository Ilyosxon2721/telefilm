// To parse this JSON data, do
//
//     final thisCountry = thisCountryFromJson(jsonString);

import 'dart:convert';

ThisCountry thisCountryFromJson(String str) =>
    ThisCountry.fromJson(json.decode(str));

String thisCountryToJson(ThisCountry data) => json.encode(data.toJson());

class ThisCountry {
  ThisCountry({
    required this.type,
    required this.countryCode,
    required this.name,
    required this.englishName,
    required this.isHidden,
    required this.callingCodes,
  });

  String type;
  String countryCode;
  String name;
  String englishName;
  bool isHidden;
  List<String> callingCodes;

  factory ThisCountry.fromJson(Map<String, dynamic> json) => ThisCountry(
        type: json["@type"],
        countryCode: json["country_code"],
        name: json["name"],
        englishName: json["english_name"],
        isHidden: json["is_hidden"],
        callingCodes: List<String>.from(json["calling_codes"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "country_code": countryCode,
        "name": name,
        "english_name": englishName,
        "is_hidden": isHidden,
        "calling_codes": List<dynamic>.from(callingCodes.map((x) => x)),
      };
}
