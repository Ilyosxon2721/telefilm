// To parse this JSON data, do
//
//     final emojiDatas = emojiDatasFromJson(jsonString);

import 'dart:convert';

EmojiDatas emojiDatasFromJson(String str) =>
    EmojiDatas.fromJson(json.decode(str));

String emojiDatasToJson(EmojiDatas data) => json.encode(data.toJson());

class EmojiDatas {
  EmojiDatas({
    required this.type,
    required this.emojis,
  });

  String type;
  List<String> emojis;

  factory EmojiDatas.fromJson(Map<String, dynamic> json) => EmojiDatas(
        type: json["@type"],
        emojis: List<String>.from(json["emojis"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "emojis": List<dynamic>.from(emojis.map((x) => x)),
      };
}
