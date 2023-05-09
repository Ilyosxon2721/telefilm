// To parse this JSON data, do
//
//     final updateChatPosition = updateChatPositionFromJson(jsonString);

import 'dart:convert';

UpdateChatPosition updateChatPositionFromJson(String str) =>
    UpdateChatPosition.fromJson(json.decode(str));

String updateChatPositionToJson(UpdateChatPosition data) =>
    json.encode(data.toJson());

class UpdateChatPosition {
  String? type;
  int? chatId;
  Position? position;

  UpdateChatPosition({
    this.type,
    this.chatId,
    this.position,
  });

  factory UpdateChatPosition.fromJson(Map<String, dynamic> json) =>
      UpdateChatPosition(
        type: json["@type"],
        chatId: json["chat_id"],
        position: json["position"] == null
            ? null
            : Position.fromJson(json["position"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "chat_id": chatId,
        "position": position?.toJson(),
      };
}

class Position {
  String? type;
  ListClass? list;
  String? order;
  bool? isPinned;

  Position({
    this.type,
    this.list,
    this.order,
    this.isPinned,
  });

  factory Position.fromJson(Map<String, dynamic> json) => Position(
        type: json["@type"],
        list: json["list"] == null ? null : ListClass.fromJson(json["list"]),
        order: json["order"],
        isPinned: json["is_pinned"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "list": list?.toJson(),
        "order": order,
        "is_pinned": isPinned,
      };
}

class ListClass {
  String? type;

  ListClass({
    this.type,
  });

  factory ListClass.fromJson(Map<String, dynamic> json) => ListClass(
        type: json["@type"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
      };
}
