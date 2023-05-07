// To parse this JSON data, do
//
//     final chats = chatsFromJson(jsonString);

import 'dart:convert';

Chats chatsFromJson(String str) => Chats.fromJson(json.decode(str));

String chatsToJson(Chats data) => json.encode(data.toJson());

class Chats {
  bool? ok;
  List<Result>? result;

  Chats({
    this.ok,
    this.result,
  });

  factory Chats.fromJson(Map<String, dynamic> json) => Chats(
        ok: json["ok"],
        result: json["result"] == null
            ? []
            : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "result": result == null
            ? []
            : List<dynamic>.from(result!.map((x) => x.toJson())),
      };
}

class Result {
  int? id;
  String? title;
  Usernames? usernames;
  String? username;
  String? status;
  Type? type;
  ResultDetail? detail;
  LastMessage? lastMessage;
  bool? isBot;
  String? firstName;
  String? lastName;
  String? phoneNumber;

  Result({
    this.id,
    this.title,
    this.usernames,
    this.username,
    this.status,
    this.type,
    this.detail,
    this.lastMessage,
    this.isBot,
    this.firstName,
    this.lastName,
    this.phoneNumber,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        title: json["title"],
        usernames: json["usernames"] == null
            ? null
            : Usernames.fromJson(json["usernames"]),
        username: json["username"],
        status: json["status"],
        type: typeValues.map[json["type"]]!,
        detail: json["detail"] == null
            ? null
            : ResultDetail.fromJson(json["detail"]),
        lastMessage: json["last_message"] == null
            ? null
            : LastMessage.fromJson(json["last_message"]),
        isBot: json["is_bot"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "usernames": usernames?.toJson(),
        "username": username,
        "status": status,
        "type": typeValues.reverse[type],
        "detail": detail?.toJson(),
        "last_message": lastMessage?.toJson(),
        "is_bot": isBot,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
      };
}

class ResultDetail {
  int? memberCount;
  int? administratorCount;
  int? restrictedCount;
  int? bannedCount;
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
  bool? hasLinkedChat;
  bool? hasLocation;
  bool? signMessages;
  bool? isSlowModeEnabled;
  bool? isBroadcastGroup;
  bool? isVerified;
  bool? isScam;
  bool? isFake;
  bool? isContact;
  bool? isMutualContact;
  bool? isSupport;
  bool? haveAcces;

  ResultDetail({
    this.memberCount,
    this.administratorCount,
    this.restrictedCount,
    this.bannedCount,
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
    this.hasLinkedChat,
    this.hasLocation,
    this.signMessages,
    this.isSlowModeEnabled,
    this.isBroadcastGroup,
    this.isVerified,
    this.isScam,
    this.isFake,
    this.isContact,
    this.isMutualContact,
    this.isSupport,
    this.haveAcces,
  });

  factory ResultDetail.fromJson(Map<String, dynamic> json) => ResultDetail(
        memberCount: json["member_count"],
        administratorCount: json["administrator_count"],
        restrictedCount: json["restricted_count"],
        bannedCount: json["banned_count"],
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
        hasLinkedChat: json["has_linked_chat"],
        hasLocation: json["has_location"],
        signMessages: json["sign_messages"],
        isSlowModeEnabled: json["is_slow_mode_enabled"],
        isBroadcastGroup: json["is_broadcast_group"],
        isVerified: json["is_verified"],
        isScam: json["is_scam"],
        isFake: json["is_fake"],
        isContact: json["is_contact"],
        isMutualContact: json["is_mutual_contact"],
        isSupport: json["is_support"],
        haveAcces: json["have_acces"],
      );

  Map<String, dynamic> toJson() => {
        "member_count": memberCount,
        "administrator_count": administratorCount,
        "restricted_count": restrictedCount,
        "banned_count": bannedCount,
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
        "has_linked_chat": hasLinkedChat,
        "has_location": hasLocation,
        "sign_messages": signMessages,
        "is_slow_mode_enabled": isSlowModeEnabled,
        "is_broadcast_group": isBroadcastGroup,
        "is_verified": isVerified,
        "is_scam": isScam,
        "is_fake": isFake,
        "is_contact": isContact,
        "is_mutual_contact": isMutualContact,
        "is_support": isSupport,
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
  List<Entity>? entities;
  String? typeContent;
  Video? video;
  String? caption;
  String? text;
  List<Photo>? photo;

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
    this.entities,
    this.typeContent,
    this.video,
    this.caption,
    this.text,
    this.photo,
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
        entities: json["entities"] == null
            ? []
            : List<Entity>.from(
                json["entities"]!.map((x) => Entity.fromJson(x))),
        typeContent: json["type_content"],
        video: json["video"] == null ? null : Video.fromJson(json["video"]),
        caption: json["caption"],
        text: json["text"],
        photo: json["photo"] == null
            ? []
            : List<Photo>.from(json["photo"]!.map((x) => Photo.fromJson(x))),
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
        "entities": entities == null
            ? []
            : List<dynamic>.from(entities!.map((x) => x.toJson())),
        "type_content": typeContent,
        "video": video?.toJson(),
        "caption": caption,
        "text": text,
        "photo": photo == null
            ? []
            : List<dynamic>.from(photo!.map((x) => x.toJson())),
      };
}

class Chat {
  int? id;
  String? title;
  Type? type;
  LastMessageClass? detail;
  LastMessageClass? lastMessage;
  String? firstName;

  Chat({
    this.id,
    this.title,
    this.type,
    this.detail,
    this.lastMessage,
    this.firstName,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        title: json["title"],
        type: typeValues.map[json["type"]]!,
        detail: json["detail"] == null
            ? null
            : LastMessageClass.fromJson(json["detail"]),
        lastMessage: json["last_message"] == null
            ? null
            : LastMessageClass.fromJson(json["last_message"]),
        firstName: json["first_name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "type": typeValues.reverse[type],
        "detail": detail?.toJson(),
        "last_message": lastMessage?.toJson(),
        "first_name": firstName,
      };
}

class LastMessageClass {
  LastMessageClass();

  factory LastMessageClass.fromJson(Map<String, dynamic> json) =>
      LastMessageClass();

  Map<String, dynamic> toJson() => {};
}

enum Type { CHANNEL, PRIVATE }

final typeValues =
    EnumValues({"channel": Type.CHANNEL, "private": Type.PRIVATE});

class Entity {
  int? offset;
  int? length;
  String? type;

  Entity({
    this.offset,
    this.length,
    this.type,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        offset: json["offset"],
        length: json["length"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "offset": offset,
        "length": length,
        "type": type,
      };
}

class Photo {
  int? id;
  String? path;
  String? fileId;
  String? fileUniqueId;
  int? fileSize;
  int? width;
  int? height;

  Photo({
    this.id,
    this.path,
    this.fileId,
    this.fileUniqueId,
    this.fileSize,
    this.width,
    this.height,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        id: json["id"],
        path: json["path"],
        fileId: json["file_id"],
        fileUniqueId: json["file_unique_id"],
        fileSize: json["file_size"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "path": path,
        "file_id": fileId,
        "file_unique_id": fileUniqueId,
        "file_size": fileSize,
        "width": width,
        "height": height,
      };
}

class Video {
  int? duration;
  int? height;
  String? fileName;
  String? mimeType;
  Thumb? thumb;
  String? fileId;
  int? fileSize;

  Video({
    this.duration,
    this.height,
    this.fileName,
    this.mimeType,
    this.thumb,
    this.fileId,
    this.fileSize,
  });

  factory Video.fromJson(Map<String, dynamic> json) => Video(
        duration: json["duration"],
        height: json["height"],
        fileName: json["file_name"],
        mimeType: json["mime_type"],
        thumb: json["thumb"] == null ? null : Thumb.fromJson(json["thumb"]),
        fileId: json["file_id"],
        fileSize: json["file_size"],
      );

  Map<String, dynamic> toJson() => {
        "duration": duration,
        "height": height,
        "file_name": fileName,
        "mime_type": mimeType,
        "thumb": thumb?.toJson(),
        "file_id": fileId,
        "file_size": fileSize,
      };
}

class Thumb {
  String? fileId;
  String? fileUniqueId;
  int? fileSize;
  int? width;
  int? height;

  Thumb({
    this.fileId,
    this.fileUniqueId,
    this.fileSize,
    this.width,
    this.height,
  });

  factory Thumb.fromJson(Map<String, dynamic> json) => Thumb(
        fileId: json["file_id"],
        fileUniqueId: json["file_unique_id"],
        fileSize: json["file_size"],
        width: json["width"],
        height: json["height"],
      );

  Map<String, dynamic> toJson() => {
        "file_id": fileId,
        "file_unique_id": fileUniqueId,
        "file_size": fileSize,
        "width": width,
        "height": height,
      };
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

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
