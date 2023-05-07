// To parse this JSON data, do
//
//     final superGroupFullInfo = superGroupFullInfoFromJson(jsonString);

import 'dart:convert';

SuperGroupFullInfo superGroupFullInfoFromJson(String str) =>
    SuperGroupFullInfo.fromJson(json.decode(str));

String superGroupFullInfoToJson(SuperGroupFullInfo data) =>
    json.encode(data.toJson());

class SuperGroupFullInfo {
  String? type;
  SuperGroupFullInfoPhoto? photo;
  String? description;
  dynamic memberCount;
  dynamic administratorCount;
  dynamic restrictedCount;
  dynamic bannedCount;
  dynamic linkedChatId;
  dynamic slowModeDelay;
  dynamic slowModeDelayExpiresIn;
  bool? canGetMembers;
  bool? hasHiddenMembers;
  bool? canHideMembers;
  bool? canSetUsername;
  bool? canSetStickerSet;
  bool? canSetLocation;
  bool? canGetStatistics;
  bool? canToggleAggressiveAntiSpam;
  bool? isAllHistoryAvailable;
  bool? hasAggressiveAntiSpamEnabled;
  String? stickerSetId;
  InviteLink? inviteLink;
  List<dynamic>? botCommands;
  dynamic upgradedFromBasicGroupId;
  dynamic upgradedFromMaxMessageId;

  SuperGroupFullInfo({
    this.type,
    this.photo,
    this.description,
    this.memberCount,
    this.administratorCount,
    this.restrictedCount,
    this.bannedCount,
    this.linkedChatId,
    this.slowModeDelay,
    this.slowModeDelayExpiresIn,
    this.canGetMembers,
    this.hasHiddenMembers,
    this.canHideMembers,
    this.canSetUsername,
    this.canSetStickerSet,
    this.canSetLocation,
    this.canGetStatistics,
    this.canToggleAggressiveAntiSpam,
    this.isAllHistoryAvailable,
    this.hasAggressiveAntiSpamEnabled,
    this.stickerSetId,
    this.inviteLink,
    this.botCommands,
    this.upgradedFromBasicGroupId,
    this.upgradedFromMaxMessageId,
  });

  factory SuperGroupFullInfo.fromJson(Map<String, dynamic> json) =>
      SuperGroupFullInfo(
        type: json["@type"],
        photo: json["photo"] == null
            ? null
            : SuperGroupFullInfoPhoto.fromJson(json["photo"]),
        description: json["description"],
        memberCount: json["member_count"],
        administratorCount: json["administrator_count"],
        restrictedCount: json["restricted_count"],
        bannedCount: json["banned_count"],
        linkedChatId: json["linked_chat_id"],
        slowModeDelay: json["slow_mode_delay"],
        slowModeDelayExpiresIn: json["slow_mode_delay_expires_in"],
        canGetMembers: json["can_get_members"],
        hasHiddenMembers: json["has_hidden_members"],
        canHideMembers: json["can_hide_members"],
        canSetUsername: json["can_set_username"],
        canSetStickerSet: json["can_set_sticker_set"],
        canSetLocation: json["can_set_location"],
        canGetStatistics: json["can_get_statistics"],
        canToggleAggressiveAntiSpam: json["can_toggle_aggressive_anti_spam"],
        isAllHistoryAvailable: json["is_all_history_available"],
        hasAggressiveAntiSpamEnabled: json["has_aggressive_anti_spam_enabled"],
        stickerSetId: json["sticker_set_id"],
        inviteLink: json["invite_link"] == null
            ? null
            : InviteLink.fromJson(json["invite_link"]),
        botCommands: json["bot_commands"] == null
            ? []
            : List<dynamic>.from(json["bot_commands"]!.map((x) => x)),
        upgradedFromBasicGroupId: json["upgraded_from_basic_group_id"],
        upgradedFromMaxMessageId: json["upgraded_from_max_message_id"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "photo": photo?.toJson(),
        "description": description,
        "member_count": memberCount,
        "administrator_count": administratorCount,
        "restricted_count": restrictedCount,
        "banned_count": bannedCount,
        "linked_chat_id": linkedChatId,
        "slow_mode_delay": slowModeDelay,
        "slow_mode_delay_expires_in": slowModeDelayExpiresIn,
        "can_get_members": canGetMembers,
        "has_hidden_members": hasHiddenMembers,
        "can_hide_members": canHideMembers,
        "can_set_username": canSetUsername,
        "can_set_sticker_set": canSetStickerSet,
        "can_set_location": canSetLocation,
        "can_get_statistics": canGetStatistics,
        "can_toggle_aggressive_anti_spam": canToggleAggressiveAntiSpam,
        "is_all_history_available": isAllHistoryAvailable,
        "has_aggressive_anti_spam_enabled": hasAggressiveAntiSpamEnabled,
        "sticker_set_id": stickerSetId,
        "invite_link": inviteLink?.toJson(),
        "bot_commands": botCommands == null
            ? []
            : List<dynamic>.from(botCommands!.map((x) => x)),
        "upgraded_from_basic_group_id": upgradedFromBasicGroupId,
        "upgraded_from_max_message_id": upgradedFromMaxMessageId,
      };
}

class InviteLink {
  String? type;
  String? inviteLink;
  String? name;
  dynamic creatorUserId;
  dynamic date;
  dynamic editDate;
  dynamic expirationDate;
  dynamic memberLimit;
  dynamic memberCount;
  dynamic pendingJoinRequestCount;
  bool? createsJoinRequest;
  bool? isPrimary;
  bool? isRevoked;

  InviteLink({
    this.type,
    this.inviteLink,
    this.name,
    this.creatorUserId,
    this.date,
    this.editDate,
    this.expirationDate,
    this.memberLimit,
    this.memberCount,
    this.pendingJoinRequestCount,
    this.createsJoinRequest,
    this.isPrimary,
    this.isRevoked,
  });

  factory InviteLink.fromJson(Map<String, dynamic> json) => InviteLink(
        type: json["@type"],
        inviteLink: json["invite_link"],
        name: json["name"],
        creatorUserId: json["creator_user_id"],
        date: json["date"],
        editDate: json["edit_date"],
        expirationDate: json["expiration_date"],
        memberLimit: json["member_limit"],
        memberCount: json["member_count"],
        pendingJoinRequestCount: json["pending_join_request_count"],
        createsJoinRequest: json["creates_join_request"],
        isPrimary: json["is_primary"],
        isRevoked: json["is_revoked"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "invite_link": inviteLink,
        "name": name,
        "creator_user_id": creatorUserId,
        "date": date,
        "edit_date": editDate,
        "expiration_date": expirationDate,
        "member_limit": memberLimit,
        "member_count": memberCount,
        "pending_join_request_count": pendingJoinRequestCount,
        "creates_join_request": createsJoinRequest,
        "is_primary": isPrimary,
        "is_revoked": isRevoked,
      };
}

class SuperGroupFullInfoPhoto {
  String? type;
  String? id;
  dynamic addedDate;
  Minithumbnail? minithumbnail;
  List<Size>? sizes;

  SuperGroupFullInfoPhoto({
    this.type,
    this.id,
    this.addedDate,
    this.minithumbnail,
    this.sizes,
  });

  factory SuperGroupFullInfoPhoto.fromJson(Map<String, dynamic> json) =>
      SuperGroupFullInfoPhoto(
        type: json["@type"],
        id: json["id"],
        addedDate: json["added_date"],
        minithumbnail: json["minithumbnail"] == null
            ? null
            : Minithumbnail.fromJson(json["minithumbnail"]),
        sizes: json["sizes"] == null
            ? []
            : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "id": id,
        "added_date": addedDate,
        "minithumbnail": minithumbnail?.toJson(),
        "sizes": sizes == null
            ? []
            : List<dynamic>.from(sizes!.map((x) => x.toJson())),
      };
}

class Minithumbnail {
  String? type;
  dynamic width;
  dynamic height;
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

class Size {
  String? type;
  String? sizeType;
  SizePhoto? photo;
  dynamic width;
  dynamic height;
  List<dynamic>? progressiveSizes;

  Size({
    this.type,
    this.sizeType,
    this.photo,
    this.width,
    this.height,
    this.progressiveSizes,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        type: json["@type"],
        sizeType: json["type"],
        photo: json["photo"] == null ? null : SizePhoto.fromJson(json["photo"]),
        width: json["width"],
        height: json["height"],
        progressiveSizes: json["progressive_sizes"] == null
            ? []
            : List<dynamic>.from(json["progressive_sizes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "type": sizeType,
        "photo": photo?.toJson(),
        "width": width,
        "height": height,
        "progressive_sizes": progressiveSizes == null
            ? []
            : List<dynamic>.from(progressiveSizes!.map((x) => x)),
      };
}

class SizePhoto {
  String? type;
  dynamic id;
  dynamic size;
  dynamic expectedSize;
  Local? local;
  Remote? remote;

  SizePhoto({
    this.type,
    this.id,
    this.size,
    this.expectedSize,
    this.local,
    this.remote,
  });

  factory SizePhoto.fromJson(Map<String, dynamic> json) => SizePhoto(
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
  dynamic downloadOffset;
  dynamic downloadedPrefixSize;
  dynamic downloadedSize;

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
  dynamic uploadedSize;

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
