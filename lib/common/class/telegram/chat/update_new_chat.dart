// To parse this JSON data, do
//
//     final updateNewChat = updateNewChatFromJson(jsonString);

import 'dart:convert';

UpdateNewChat updateNewChatFromJson(String str) =>
    UpdateNewChat.fromJson(json.decode(str));

String updateNewChatToJson(UpdateNewChat data) => json.encode(data.toJson());

class UpdateNewChat {
  String? type;
  Chat? chat;

  UpdateNewChat({
    this.type,
    this.chat,
  });

  factory UpdateNewChat.fromJson(Map<String, dynamic> json) => UpdateNewChat(
        type: json["@type"],
        chat: json["chat"] == null ? null : Chat.fromJson(json["chat"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "chat": chat?.toJson(),
      };
}

class Chat {
  String? type;
  int? id;
  Type? chatType;
  String? title;
  Photo? photo;
  Permissions? permissions;
  List<dynamic>? positions;
  bool? hasProtectedContent;
  bool? isTranslatable;
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
  int? unreadReactionCount;
  NotificationSettings? notificationSettings;
  AvailableReactions? availableReactions;
  int? messageAutoDeleteTime;
  String? themeName;
  VideoChat? videoChat;
  int? replyMarkupMessageId;
  String? clientData;

  Chat({
    this.type,
    this.id,
    this.chatType,
    this.title,
    this.photo,
    this.permissions,
    this.positions,
    this.hasProtectedContent,
    this.isTranslatable,
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
    this.unreadReactionCount,
    this.notificationSettings,
    this.availableReactions,
    this.messageAutoDeleteTime,
    this.themeName,
    this.videoChat,
    this.replyMarkupMessageId,
    this.clientData,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
        type: json["@type"],
        id: json["id"],
        chatType: json["type"] == null ? null : Type.fromJson(json["type"]),
        title: json["title"],
        photo: json["photo"] == null ? null : Photo.fromJson(json["photo"]),
        permissions: json["permissions"] == null
            ? null
            : Permissions.fromJson(json["permissions"]),
        positions: json["positions"] == null
            ? []
            : List<dynamic>.from(json["positions"]!.map((x) => x)),
        hasProtectedContent: json["has_protected_content"],
        isTranslatable: json["is_translatable"],
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
        unreadReactionCount: json["unread_reaction_count"],
        notificationSettings: json["notification_settings"] == null
            ? null
            : NotificationSettings.fromJson(json["notification_settings"]),
        availableReactions: json["available_reactions"] == null
            ? null
            : AvailableReactions.fromJson(json["available_reactions"]),
        messageAutoDeleteTime: json["message_auto_delete_time"],
        themeName: json["theme_name"],
        videoChat: json["video_chat"] == null
            ? null
            : VideoChat.fromJson(json["video_chat"]),
        replyMarkupMessageId: json["reply_markup_message_id"],
        clientData: json["client_data"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "id": id,
        "type": chatType?.toJson(),
        "title": title,
        "photo": photo?.toJson(),
        "permissions": permissions?.toJson(),
        "positions": positions == null
            ? []
            : List<dynamic>.from(positions!.map((x) => x)),
        "has_protected_content": hasProtectedContent,
        "is_translatable": isTranslatable,
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
        "unread_reaction_count": unreadReactionCount,
        "notification_settings": notificationSettings?.toJson(),
        "available_reactions": availableReactions?.toJson(),
        "message_auto_delete_time": messageAutoDeleteTime,
        "theme_name": themeName,
        "video_chat": videoChat?.toJson(),
        "reply_markup_message_id": replyMarkupMessageId,
        "client_data": clientData,
      };
}

class AvailableReactions {
  String? type;

  AvailableReactions({
    this.type,
  });

  factory AvailableReactions.fromJson(Map<String, dynamic> json) =>
      AvailableReactions(
        type: json["@type"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
      };
}

class Type {
  String? type;
  int? userId;

  Type({
    this.type,
    this.userId,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["@type"],
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "user_id": userId,
      };
}

class NotificationSettings {
  String? type;
  bool? useDefaultMuteFor;
  int? muteFor;
  bool? useDefaultSound;
  String? soundId;
  bool? useDefaultShowPreview;
  bool? showPreview;
  bool? useDefaultDisablePinnedMessageNotifications;
  bool? disablePinnedMessageNotifications;
  bool? useDefaultDisableMentionNotifications;
  bool? disableMentionNotifications;

  NotificationSettings({
    this.type,
    this.useDefaultMuteFor,
    this.muteFor,
    this.useDefaultSound,
    this.soundId,
    this.useDefaultShowPreview,
    this.showPreview,
    this.useDefaultDisablePinnedMessageNotifications,
    this.disablePinnedMessageNotifications,
    this.useDefaultDisableMentionNotifications,
    this.disableMentionNotifications,
  });

  factory NotificationSettings.fromJson(Map<String, dynamic> json) =>
      NotificationSettings(
        type: json["@type"],
        useDefaultMuteFor: json["use_default_mute_for"],
        muteFor: json["mute_for"],
        useDefaultSound: json["use_default_sound"],
        soundId: json["sound_id"],
        useDefaultShowPreview: json["use_default_show_preview"],
        showPreview: json["show_preview"],
        useDefaultDisablePinnedMessageNotifications:
            json["use_default_disable_pinned_message_notifications"],
        disablePinnedMessageNotifications:
            json["disable_pinned_message_notifications"],
        useDefaultDisableMentionNotifications:
            json["use_default_disable_mention_notifications"],
        disableMentionNotifications: json["disable_mention_notifications"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "use_default_mute_for": useDefaultMuteFor,
        "mute_for": muteFor,
        "use_default_sound": useDefaultSound,
        "sound_id": soundId,
        "use_default_show_preview": useDefaultShowPreview,
        "show_preview": showPreview,
        "use_default_disable_pinned_message_notifications":
            useDefaultDisablePinnedMessageNotifications,
        "disable_pinned_message_notifications":
            disablePinnedMessageNotifications,
        "use_default_disable_mention_notifications":
            useDefaultDisableMentionNotifications,
        "disable_mention_notifications": disableMentionNotifications,
      };
}

class Permissions {
  String? type;
  bool? canSendMessages;
  bool? canSendAudios;
  bool? canSendDocuments;
  bool? canSendPhotos;
  bool? canSendVideos;
  bool? canSendVideoNotes;
  bool? canSendVoiceNotes;
  bool? canSendPolls;
  bool? canSendOtherMessages;
  bool? canAddWebPagePreviews;
  bool? canChangeInfo;
  bool? canInviteUsers;
  bool? canPinMessages;
  bool? canManageTopics;

  Permissions({
    this.type,
    this.canSendMessages,
    this.canSendAudios,
    this.canSendDocuments,
    this.canSendPhotos,
    this.canSendVideos,
    this.canSendVideoNotes,
    this.canSendVoiceNotes,
    this.canSendPolls,
    this.canSendOtherMessages,
    this.canAddWebPagePreviews,
    this.canChangeInfo,
    this.canInviteUsers,
    this.canPinMessages,
    this.canManageTopics,
  });

  factory Permissions.fromJson(Map<String, dynamic> json) => Permissions(
        type: json["@type"],
        canSendMessages: json["can_send_messages"],
        canSendAudios: json["can_send_audios"],
        canSendDocuments: json["can_send_documents"],
        canSendPhotos: json["can_send_photos"],
        canSendVideos: json["can_send_videos"],
        canSendVideoNotes: json["can_send_video_notes"],
        canSendVoiceNotes: json["can_send_voice_notes"],
        canSendPolls: json["can_send_polls"],
        canSendOtherMessages: json["can_send_other_messages"],
        canAddWebPagePreviews: json["can_add_web_page_previews"],
        canChangeInfo: json["can_change_info"],
        canInviteUsers: json["can_invite_users"],
        canPinMessages: json["can_pin_messages"],
        canManageTopics: json["can_manage_topics"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "can_send_messages": canSendMessages,
        "can_send_audios": canSendAudios,
        "can_send_documents": canSendDocuments,
        "can_send_photos": canSendPhotos,
        "can_send_videos": canSendVideos,
        "can_send_video_notes": canSendVideoNotes,
        "can_send_voice_notes": canSendVoiceNotes,
        "can_send_polls": canSendPolls,
        "can_send_other_messages": canSendOtherMessages,
        "can_add_web_page_previews": canAddWebPagePreviews,
        "can_change_info": canChangeInfo,
        "can_invite_users": canInviteUsers,
        "can_pin_messages": canPinMessages,
        "can_manage_topics": canManageTopics,
      };
}

class Photo {
  String? type;
  Big? small;
  Big? big;
  Minithumbnail? minithumbnail;
  bool? hasAnimation;
  bool? isPersonal;

  Photo({
    this.type,
    this.small,
    this.big,
    this.minithumbnail,
    this.hasAnimation,
    this.isPersonal,
  });

  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        type: json["@type"],
        small: json["small"] == null ? null : Big.fromJson(json["small"]),
        big: json["big"] == null ? null : Big.fromJson(json["big"]),
        minithumbnail: json["minithumbnail"] == null
            ? null
            : Minithumbnail.fromJson(json["minithumbnail"]),
        hasAnimation: json["has_animation"],
        isPersonal: json["is_personal"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "small": small?.toJson(),
        "big": big?.toJson(),
        "minithumbnail": minithumbnail?.toJson(),
        "has_animation": hasAnimation,
        "is_personal": isPersonal,
      };
}

class Big {
  String? type;
  int? id;
  int? size;
  int? expectedSize;
  Local? local;
  Remote? remote;

  Big({
    this.type,
    this.id,
    this.size,
    this.expectedSize,
    this.local,
    this.remote,
  });

  factory Big.fromJson(Map<String, dynamic> json) => Big(
        type: json["@type"],
        id: json["id"],
        size: json["size"],
        expectedSize: json["expected_size"],
        local: json["local"] == null ? null : Local.fromJson(json["local"]),
        remote: json["remote"] == null ? null : Remote.fromJson(json["remote"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "id": id,
        "size": size,
        "expected_size": expectedSize,
        "local": local?.toJson(),
        "remote": remote?.toJson(),
      };
}

class Local {
  String? type;
  String? path;
  bool? canBeDownloaded;
  bool? canBeDeleted;
  bool? isDownloadingActive;
  bool? isDownloadingCompleted;
  int? downloadOffset;
  int? downloadedPrefixSize;
  int? downloadedSize;

  Local({
    this.type,
    this.path,
    this.canBeDownloaded,
    this.canBeDeleted,
    this.isDownloadingActive,
    this.isDownloadingCompleted,
    this.downloadOffset,
    this.downloadedPrefixSize,
    this.downloadedSize,
  });

  factory Local.fromJson(Map<String, dynamic> json) => Local(
        type: json["@type"],
        path: json["path"],
        canBeDownloaded: json["can_be_downloaded"],
        canBeDeleted: json["can_be_deleted"],
        isDownloadingActive: json["is_downloading_active"],
        isDownloadingCompleted: json["is_downloading_completed"],
        downloadOffset: json["download_offset"],
        downloadedPrefixSize: json["downloaded_prefix_size"],
        downloadedSize: json["downloaded_size"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "path": path,
        "can_be_downloaded": canBeDownloaded,
        "can_be_deleted": canBeDeleted,
        "is_downloading_active": isDownloadingActive,
        "is_downloading_completed": isDownloadingCompleted,
        "download_offset": downloadOffset,
        "downloaded_prefix_size": downloadedPrefixSize,
        "downloaded_size": downloadedSize,
      };
}

class Remote {
  String? type;
  String? id;
  String? uniqueId;
  bool? isUploadingActive;
  bool? isUploadingCompleted;
  int? uploadedSize;

  Remote({
    this.type,
    this.id,
    this.uniqueId,
    this.isUploadingActive,
    this.isUploadingCompleted,
    this.uploadedSize,
  });

  factory Remote.fromJson(Map<String, dynamic> json) => Remote(
        type: json["@type"],
        id: json["id"],
        uniqueId: json["unique_id"],
        isUploadingActive: json["is_uploading_active"],
        isUploadingCompleted: json["is_uploading_completed"],
        uploadedSize: json["uploaded_size"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "id": id,
        "unique_id": uniqueId,
        "is_uploading_active": isUploadingActive,
        "is_uploading_completed": isUploadingCompleted,
        "uploaded_size": uploadedSize,
      };
}

class Minithumbnail {
  String? type;
  int? width;
  int? height;
  String? data;

  Minithumbnail({
    this.type,
    this.width,
    this.height,
    this.data,
  });

  factory Minithumbnail.fromJson(Map<String, dynamic> json) => Minithumbnail(
        type: json["@type"],
        width: json["width"],
        height: json["height"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "width": width,
        "height": height,
        "data": data,
      };
}

class VideoChat {
  String? type;
  int? groupCallId;
  bool? hasParticipants;

  VideoChat({
    this.type,
    this.groupCallId,
    this.hasParticipants,
  });

  factory VideoChat.fromJson(Map<String, dynamic> json) => VideoChat(
        type: json["@type"],
        groupCallId: json["group_call_id"],
        hasParticipants: json["has_participants"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "group_call_id": groupCallId,
        "has_participants": hasParticipants,
      };
}
