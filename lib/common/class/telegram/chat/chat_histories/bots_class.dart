// To parse this JSON data, do
//
//     final bots = botsFromJson(jsonString);

import 'dart:convert';

Bots botsFromJson(String str) => Bots.fromJson(json.decode(str));

String botsToJson(Bots data) => json.encode(data.toJson());

class Bots {
  int? id;
  bool? isBot;
  String? firstName;
  Usernames? usernames;
  String? username;
  String? type;
  BotsDetail? detail;
  LastMessage? lastMessage;

  Bots({
    this.id,
    this.isBot,
    this.firstName,
    this.usernames,
    this.username,
    this.type,
    this.detail,
    this.lastMessage,
  });

  factory Bots.fromJson(Map<String, dynamic> json) => Bots(
        id: json["id"],
        isBot: json["is_bot"],
        firstName: json["first_name"],
        usernames: json["usernames"] == null
            ? null
            : Usernames.fromJson(json["usernames"]),
        username: json["username"],
        type: json["type"],
        detail:
            json["detail"] == null ? null : BotsDetail.fromJson(json["detail"]),
        lastMessage: json["last_message"] == null
            ? null
            : LastMessage.fromJson(json["last_message"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "is_bot": isBot,
        "first_name": firstName,
        "usernames": usernames?.toJson(),
        "username": username,
        "type": type,
        "detail": detail?.toJson(),
        "last_message": lastMessage?.toJson(),
      };
}

class BotsDetail {
  bool? hasProtectedContent;
  bool? isMarkedAsUnread;
  bool? isBlocked;
  bool? hasScheduledMessages;
  bool? canBeDeletedOnlyForSelf;
  bool? canBeDeletedForAllUsers;
  bool? canBeReported;
  bool? defaultDisableNotification;
  int? unreadCount;
  int? lastReadInboxMessageId;
  int? lastReadOutboxMessageId;
  int? unreadMentionCount;
  bool? isContact;
  bool? isMutualContact;
  bool? isVerified;
  bool? isSupport;
  bool? isScam;
  bool? isFake;
  bool? haveAcces;

  BotsDetail({
    this.hasProtectedContent,
    this.isMarkedAsUnread,
    this.isBlocked,
    this.hasScheduledMessages,
    this.canBeDeletedOnlyForSelf,
    this.canBeDeletedForAllUsers,
    this.canBeReported,
    this.defaultDisableNotification,
    this.unreadCount,
    this.lastReadInboxMessageId,
    this.lastReadOutboxMessageId,
    this.unreadMentionCount,
    this.isContact,
    this.isMutualContact,
    this.isVerified,
    this.isSupport,
    this.isScam,
    this.isFake,
    this.haveAcces,
  });

  factory BotsDetail.fromJson(Map<String, dynamic> json) => BotsDetail(
        hasProtectedContent: json["has_protected_content"],
        isMarkedAsUnread: json["is_marked_as_unread"],
        isBlocked: json["is_blocked"],
        hasScheduledMessages: json["has_scheduled_messages"],
        canBeDeletedOnlyForSelf: json["can_be_deleted_only_for_self"],
        canBeDeletedForAllUsers: json["can_be_deleted_for_all_users"],
        canBeReported: json["can_be_reported"],
        defaultDisableNotification: json["default_disable_notification"],
        unreadCount: json["unread_count"],
        lastReadInboxMessageId: json["last_read_inbox_message_id"],
        lastReadOutboxMessageId: json["last_read_outbox_message_id"],
        unreadMentionCount: json["unread_mention_count"],
        isContact: json["is_contact"],
        isMutualContact: json["is_mutual_contact"],
        isVerified: json["is_verified"],
        isSupport: json["is_support"],
        isScam: json["is_scam"],
        isFake: json["is_fake"],
        haveAcces: json["have_acces"],
      );

  Map<String, dynamic> toJson() => {
        "has_protected_content": hasProtectedContent,
        "is_marked_as_unread": isMarkedAsUnread,
        "is_blocked": isBlocked,
        "has_scheduled_messages": hasScheduledMessages,
        "can_be_deleted_only_for_self": canBeDeletedOnlyForSelf,
        "can_be_deleted_for_all_users": canBeDeletedForAllUsers,
        "can_be_reported": canBeReported,
        "default_disable_notification": defaultDisableNotification,
        "unread_count": unreadCount,
        "last_read_inbox_message_id": lastReadInboxMessageId,
        "last_read_outbox_message_id": lastReadOutboxMessageId,
        "unread_mention_count": unreadMentionCount,
        "is_contact": isContact,
        "is_mutual_contact": isMutualContact,
        "is_verified": isVerified,
        "is_support": isSupport,
        "is_scam": isScam,
        "is_fake": isFake,
        "have_acces": haveAcces,
      };
}

class LastMessage {
  bool? isOutgoing;
  bool? isPinned;
  Chat? from;
  Chat? chat;
  int? date;
  int? messageId;
  int? apiMessageId;
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
  String? typeContent;
  String? text;
  List<dynamic>? entities;

  LastMessage({
    this.isOutgoing,
    this.isPinned,
    this.from,
    this.chat,
    this.date,
    this.messageId,
    this.apiMessageId,
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
    this.typeContent,
    this.text,
    this.entities,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        isOutgoing: json["is_outgoing"],
        isPinned: json["is_pinned"],
        from: json["from"] == null ? null : Chat.fromJson(json["from"]),
        chat: json["chat"] == null ? null : Chat.fromJson(json["chat"]),
        date: json["date"],
        messageId: json["message_id"],
        apiMessageId: json["api_message_id"],
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
        typeContent: json["type_content"],
        text: json["text"],
        entities: json["entities"] == null
            ? []
            : List<dynamic>.from(json["entities"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "is_outgoing": isOutgoing,
        "is_pinned": isPinned,
        "from": from?.toJson(),
        "chat": chat?.toJson(),
        "date": date,
        "message_id": messageId,
        "api_message_id": apiMessageId,
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
        "type_content": typeContent,
        "text": text,
        "entities":
            entities == null ? [] : List<dynamic>.from(entities!.map((x) => x)),
      };
}

class Chat {
  int? id;
  String? firstName;
  String? type;
  LastMessageClass? detail;
  LastMessageClass? lastMessage;

  Chat({
    this.id,
    this.firstName,
    this.type,
    this.detail,
    this.lastMessage,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        firstName: json["first_name"],
        type: json["type"],
        detail: json["detail"] == null
            ? null
            : LastMessageClass.fromJson(json["detail"]),
        lastMessage: json["last_message"] == null
            ? null
            : LastMessageClass.fromJson(json["last_message"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "type": type,
        "detail": detail?.toJson(),
        "last_message": lastMessage?.toJson(),
      };
}

class LastMessageClass {
  LastMessageClass();

  factory LastMessageClass.fromJson(Map<String, dynamic> json) =>
      LastMessageClass();

  Map<String, dynamic> toJson() => {};
}

class Usernames {
  String? type;
  List<String>? activeUsernames;
  List<dynamic>? disabledUsernames;
  String? editableUsername;

  Usernames({
    this.type,
    this.activeUsernames,
    this.disabledUsernames,
    this.editableUsername,
  });

  factory Usernames.fromJson(Map<String, dynamic> json) => Usernames(
        type: json["@type"],
        activeUsernames: json["active_usernames"] == null
            ? []
            : List<String>.from(json["active_usernames"]!.map((x) => x)),
        disabledUsernames: json["disabled_usernames"] == null
            ? []
            : List<dynamic>.from(json["disabled_usernames"]!.map((x) => x)),
        editableUsername: json["editable_username"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "active_usernames": activeUsernames == null
            ? []
            : List<dynamic>.from(activeUsernames!.map((x) => x)),
        "disabled_usernames": disabledUsernames == null
            ? []
            : List<dynamic>.from(disabledUsernames!.map((x) => x)),
        "editable_username": editableUsername,
      };
}
