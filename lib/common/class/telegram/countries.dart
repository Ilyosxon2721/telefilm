// To parse this JSON data, do
//
//     final countries = countriesFromJson(jsonString);

import 'dart:convert';

Countries countriesFromJson(String str) => Countries.fromJson(json.decode(str));

String countriesToJson(Countries data) => json.encode(data.toJson());

class Countries {
  Countries({
    required this.type,
    required this.countries,
  });

  String type;
  List<Country> countries;

  factory Countries.fromJson(Map<String, dynamic> json) => Countries(
        type: json["@type"],
        countries: List<Country>.from(
            json["countries"].map((x) => Country.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "countries": List<dynamic>.from(countries.map((x) => x.toJson())),
      };
}

class Country {
  Country({
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

  factory Country.fromJson(Map<String, dynamic> json) => Country(
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
