// To parse this JSON data, do
//
//     final superGroup = superGroupFromJson(jsonString);

import 'dart:convert';

SuperGroup superGroupFromJson(String str) =>
    SuperGroup.fromJson(json.decode(str));

String superGroupToJson(SuperGroup data) => json.encode(data.toJson());

class SuperGroup {
  int? id;
  String? title;
  String? status;
  String? type;
  SuperGroupDetail? detail;
  LastMessage? lastMessage;

  SuperGroup({
    this.id,
    this.title,
    this.status,
    this.type,
    this.detail,
    this.lastMessage,
  });

  factory SuperGroup.fromJson(Map<String, dynamic> json) => SuperGroup(
        id: json["id"],
        title: json["title"],
        status: json["status"],
        type: json["type"],
        detail: json["detail"] == null
            ? null
            : SuperGroupDetail.fromJson(json["detail"]),
        lastMessage: json["last_message"] == null
            ? null
            : LastMessage.fromJson(json["last_message"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "status": status,
        "type": type,
        "detail": detail?.toJson(),
        "last_message": lastMessage?.toJson(),
      };
}

class SuperGroupDetail {
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

  SuperGroupDetail({
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
  });

  factory SuperGroupDetail.fromJson(Map<String, dynamic> json) =>
      SuperGroupDetail(
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
      };
}

class LastMessage {
  bool? isOutgoing;
  bool? isPinned;
  From? from;
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
  List<From>? newMembers;
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
    this.newMembers,
    this.entities,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) => LastMessage(
        isOutgoing: json["is_outgoing"],
        isPinned: json["is_pinned"],
        from: json["from"] == null ? null : From.fromJson(json["from"]),
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
        newMembers: json["new_members"] == null
            ? []
            : List<From>.from(
                json["new_members"]!.map((x) => From.fromJson(x))),
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
        "new_members": newMembers == null
            ? []
            : List<dynamic>.from(newMembers!.map((x) => x.toJson())),
        "entities":
            entities == null ? [] : List<dynamic>.from(entities!.map((x) => x)),
      };
}

class Chat {
  int? id;
  String? title;
  String? type;
  LastMessageClass? detail;
  LastMessageClass? lastMessage;

  Chat({
    this.id,
    this.title,
    this.type,
    this.detail,
    this.lastMessage,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        id: json["id"],
        title: json["title"],
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
        "title": title,
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

class From {
  int? id;
  String? firstName;
  String? type;
  LastMessageClass? lastMessage;

  From({
    this.id,
    this.firstName,
    this.type,
    this.lastMessage,
  });

  factory From.fromJson(Map<String, dynamic> json) => From(
        id: json["id"],
        firstName: json["first_name"],
        type: json["type"],
        lastMessage: json["last_message"] == null
            ? null
            : LastMessageClass.fromJson(json["last_message"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "type": type,
        "last_message": lastMessage?.toJson(),
      };
}
