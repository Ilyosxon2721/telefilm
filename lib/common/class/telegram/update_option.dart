// To parse this JSON data, do
//
//     final updateOption = updateOptionFromJson(jsonString);

import 'dart:convert';

UpdateOption updateOptionFromJson(String str) =>
    UpdateOption.fromJson(json.decode(str));

String updateOptionToJson(UpdateOption data) => json.encode(data.toJson());

class UpdateOption {
  UpdateOption({
    required this.type,
    required this.name,
    required this.value,
  });

  String type;
  String name;
  Value value;

  factory UpdateOption.fromJson(Map<String, dynamic> json) => UpdateOption(
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
  dynamic value;

  factory Value.fromJson(Map<String, dynamic> json) => Value(
        type: json["@type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "value": value,
      };
}
