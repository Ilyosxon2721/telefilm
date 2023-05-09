// To parse this JSON data, do
//
//     final updateChatLastMessage = updateChatLastMessageFromJson(jsonString);

import 'dart:convert';

UpdateChatLastMessage updateChatLastMessageFromJson(String str) =>
    UpdateChatLastMessage.fromJson(json.decode(str));

String updateChatLastMessageToJson(UpdateChatLastMessage data) =>
    json.encode(data.toJson());

class UpdateChatLastMessage {
  String? type;
  int? chatId;
  LastMessage? lastMessage;
  List<dynamic>? positions;

  UpdateChatLastMessage({
    this.type,
    this.chatId,
    this.lastMessage,
    this.positions,
  });

  factory UpdateChatLastMessage.fromJson(Map<String, dynamic> json) =>
      UpdateChatLastMessage(
        type: json["@type"],
        chatId: json["chat_id"],
        lastMessage: json["last_message"] == null
            ? null
            : LastMessage.fromJson(json["last_message"]),
        positions: json["positions"] == null
            ? []
            : List<dynamic>.from(json["positions"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "chat_id": chatId,
        "last_message": lastMessage?.toJson(),
        "positions": positions == null
            ? []
            : List<dynamic>.from(positions!.map((x) => x)),
      };
}

class LastMessage {
  String? type;
  int? id;
  SenderId? senderId;
  int? chatId;
  bool? isOutgoing;
  bool? isPinned;
  bool? canBeEdited;
  bool? canBeForwarded;
  bool? canBeSaved;
  bool? canBeDeletedOnlyForSelf;
  bool? canBeDeletedForAllUsers;
  bool? canGetAddedReactions;
  bool? canGetStatistics;
  bool? canGetMessageThread;
  bool? canGetViewers;
  bool? canGetMediaTimestampLinks;
  bool? canReportReactions;
  bool? hasTimestampedMedia;
  bool? isChannelPost;
  bool? isTopicMessage;
  bool? containsUnreadMention;
  int? date;
  int? editDate;
  List<dynamic>? unreadReactions;
  int? replyInChatId;
  int? replyToMessageId;
  int? messageThreadId;
  int? selfDestructTime;
  int? selfDestructIn;
  int? autoDeleteIn;
  int? viaBotUserId;
  String? authorSignature;
  String? mediaAlbumId;
  String? restrictionReason;
  Content? content;
  ReplyMarkup? replyMarkup;

  LastMessage({
    this.type,
    this.id,
    this.senderId,
    this.chatId,
    this.isOutgoing,
    this.isPinned,
    this.canBeEdited,
    this.canBeForwarded,
    this.canBeSaved,
    this.canBeDeletedOnlyForSelf,
    this.canBeDeletedForAllUsers,
    this.canGetAddedReactions,
    this.canGetStatistics,
    this.canGetMessageThread,
    this.canGetViewers,
    this.canGetMediaTimestampLinks,
    this.canReportReactions,
    this.hasTimestampedMedia,
    this.isChannelPost,
    this.isTopicMessage,
    this.containsUnreadMention,
    this.date,
    this.editDate,
    this.unreadReactions,
    this.replyInChatId,
    this.replyToMessageId,
    this.messageThreadId,
    this.selfDestructTime,
    this.selfDestructIn,
    this.autoDeleteIn,
    this.viaBotUserId,
    this.authorSignature,
    this.mediaAlbumId,
    this.restrictionReason,
    this.content,
    this.replyMarkup,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        type: json["@type"],
        id: json["id"],
        senderId: json["sender_id"] == null
            ? null
            : SenderId.fromJson(json["sender_id"]),
        chatId: json["chat_id"],
        isOutgoing: json["is_outgoing"],
        isPinned: json["is_pinned"],
        canBeEdited: json["can_be_edited"],
        canBeForwarded: json["can_be_forwarded"],
        canBeSaved: json["can_be_saved"],
        canBeDeletedOnlyForSelf: json["can_be_deleted_only_for_self"],
        canBeDeletedForAllUsers: json["can_be_deleted_for_all_users"],
        canGetAddedReactions: json["can_get_added_reactions"],
        canGetStatistics: json["can_get_statistics"],
        canGetMessageThread: json["can_get_message_thread"],
        canGetViewers: json["can_get_viewers"],
        canGetMediaTimestampLinks: json["can_get_media_timestamp_links"],
        canReportReactions: json["can_report_reactions"],
        hasTimestampedMedia: json["has_timestamped_media"],
        isChannelPost: json["is_channel_post"],
        isTopicMessage: json["is_topic_message"],
        containsUnreadMention: json["contains_unread_mention"],
        date: json["date"],
        editDate: json["edit_date"],
        unreadReactions: json["unread_reactions"] == null
            ? []
            : List<dynamic>.from(json["unread_reactions"]!.map((x) => x)),
        replyInChatId: json["reply_in_chat_id"],
        replyToMessageId: json["reply_to_message_id"],
        messageThreadId: json["message_thread_id"],
        selfDestructTime: json["self_destruct_time"],
        selfDestructIn: json["self_destruct_in"],
        autoDeleteIn: json["auto_delete_in"],
        viaBotUserId: json["via_bot_user_id"],
        authorSignature: json["author_signature"],
        mediaAlbumId: json["media_album_id"],
        restrictionReason: json["restriction_reason"],
        content:
            json["content"] == null ? null : Content.fromJson(json["content"]),
        replyMarkup: json["reply_markup"] == null
            ? null
            : ReplyMarkup.fromJson(json["reply_markup"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "id": id,
        "sender_id": senderId?.toJson(),
        "chat_id": chatId,
        "is_outgoing": isOutgoing,
        "is_pinned": isPinned,
        "can_be_edited": canBeEdited,
        "can_be_forwarded": canBeForwarded,
        "can_be_saved": canBeSaved,
        "can_be_deleted_only_for_self": canBeDeletedOnlyForSelf,
        "can_be_deleted_for_all_users": canBeDeletedForAllUsers,
        "can_get_added_reactions": canGetAddedReactions,
        "can_get_statistics": canGetStatistics,
        "can_get_message_thread": canGetMessageThread,
        "can_get_viewers": canGetViewers,
        "can_get_media_timestamp_links": canGetMediaTimestampLinks,
        "can_report_reactions": canReportReactions,
        "has_timestamped_media": hasTimestampedMedia,
        "is_channel_post": isChannelPost,
        "is_topic_message": isTopicMessage,
        "contains_unread_mention": containsUnreadMention,
        "date": date,
        "edit_date": editDate,
        "unread_reactions": unreadReactions == null
            ? []
            : List<dynamic>.from(unreadReactions!.map((x) => x)),
        "reply_in_chat_id": replyInChatId,
        "reply_to_message_id": replyToMessageId,
        "message_thread_id": messageThreadId,
        "self_destruct_time": selfDestructTime,
        "self_destruct_in": selfDestructIn,
        "auto_delete_in": autoDeleteIn,
        "via_bot_user_id": viaBotUserId,
        "author_signature": authorSignature,
        "media_album_id": mediaAlbumId,
        "restriction_reason": restrictionReason,
        "content": content?.toJson(),
        "reply_markup": replyMarkup?.toJson(),
      };
}

class Content {
  String? type;
  Text? text;

  Content({
    this.type,
    this.text,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: json["@type"],
        text: json["text"] == null ? null : Text.fromJson(json["text"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "text": text?.toJson(),
      };
}

class Text {
  String? type;
  String? text;
  List<dynamic>? entities;

  Text({
    this.type,
    this.text,
    this.entities,
  });

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        type: json["@type"],
        text: json["text"],
        entities: json["entities"] == null
            ? []
            : List<dynamic>.from(json["entities"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "text": text,
        "entities":
            entities == null ? [] : List<dynamic>.from(entities!.map((x) => x)),
      };
}

class ReplyMarkup {
  String? type;
  List<List<Row>>? rows;

  ReplyMarkup({
    this.type,
    this.rows,
  });

  factory ReplyMarkup.fromJson(Map<String, dynamic> json) => ReplyMarkup(
        type: json["@type"],
        rows: json["rows"] == null
            ? []
            : List<List<Row>>.from(json["rows"]!
                .map((x) => List<Row>.from(x.map((x) => Row.fromJson(x))))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "rows": rows == null
            ? []
            : List<dynamic>.from(
                rows!.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
      };
}

class Row {
  String? type;
  String? text;
  Type? rowType;

  Row({
    this.type,
    this.text,
    this.rowType,
  });

  factory Row.fromJson(Map<String, dynamic> json) => Row(
        type: json["@type"],
        text: json["text"],
        rowType: json["type"] == null ? null : Type.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "text": text,
        "type": rowType?.toJson(),
      };
}

class Type {
  String? type;
  String? data;

  Type({
    this.type,
    this.data,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["@type"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "data": data,
      };
}

class SenderId {
  String? type;
  int? userId;

  SenderId({
    this.type,
    this.userId,
  });

  factory SenderId.fromJson(Map<String, dynamic> json) => SenderId(
        type: json["@type"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "user_id": userId,
      };
}
