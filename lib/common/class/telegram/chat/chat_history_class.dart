// To parse this JSON data, do
//
//     final chatHistory = chatHistoryFromJson(jsonString);

// ignore_for_file: constant_identifier_names

import 'dart:convert';

ChatHistory chatHistoryFromJson(String str) =>
    ChatHistory.fromJson(json.decode(str));

String chatHistoryToJson(ChatHistory data) => json.encode(data.toJson());

class ChatHistory {
  String? type;
  int? totalCount = 0;
  List<Message>? messages;

  ChatHistory({
    this.type,
    this.totalCount,
    this.messages,
  });

  factory ChatHistory.fromJson(Map<String, dynamic> json) => ChatHistory(
        type: json["@type"],
        totalCount: json["total_count"],
        messages: json["messages"] == null
            ? []
            : List<Message>.from(
                json["messages"]!.map((x) => Message.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "total_count": totalCount,
        "messages": messages == null
            ? []
            : List<dynamic>.from(messages!.map((x) => x.toJson())),
      };
}

class Message {
  MessageType? type;
  dynamic id;
  SenderId? senderId;
  dynamic chatId;
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
  dynamic date;
  dynamic editDate;
  InteractionInfo? interactionInfo;
  List<dynamic>? unreadReactions;
  dynamic replyInChatId;
  dynamic replyToMessageId;
  dynamic messageThreadId;
  dynamic selfDestructTime;
  dynamic selfDestructIn;
  dynamic autoDeleteIn;
  dynamic viaBotUserId;
  String? authorSignature;
  String? mediaAlbumId;
  String? restrictionReason;
  Content? content;

  Message({
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
    this.interactionInfo,
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
  });

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        type: messageTypeValues.map[json["@type"]]!,
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
        interactionInfo: json["interaction_info"] == null
            ? null
            : InteractionInfo.fromJson(json["interaction_info"]),
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
      );

  Map<String, dynamic> toJson() => {
        "@type": messageTypeValues.reverse[type],
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
        "interaction_info": interactionInfo?.toJson(),
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
      };
}

class Content {
  String? type;
  ContentVideo? video;
  Ption? caption;
  bool? hasSpoiler;
  bool? isSecret;
  Text? text;
  WebPage? webPage;
  ContentPhoto? photo;
  String? title;

  Content({
    this.type,
    this.video,
    this.caption,
    this.hasSpoiler,
    this.isSecret,
    this.text,
    this.webPage,
    this.photo,
    this.title,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: json["@type"],
        video:
            json["video"] == null ? null : ContentVideo.fromJson(json["video"]),
        caption:
            json["caption"] == null ? null : Ption.fromJson(json["caption"]),
        hasSpoiler: json["has_spoiler"],
        isSecret: json["is_secret"],
        text: json["text"] == null ? null : Text.fromJson(json["text"]),
        webPage: json["web_page"] == null
            ? null
            : WebPage.fromJson(json["web_page"]),
        photo:
            json["photo"] == null ? null : ContentPhoto.fromJson(json["photo"]),
        title: json["title"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "video": video?.toJson(),
        "caption": caption?.toJson(),
        "has_spoiler": hasSpoiler,
        "is_secret": isSecret,
        "text": text?.toJson(),
        "web_page": webPage?.toJson(),
        "photo": photo?.toJson(),
        "title": title,
      };
}

class Ption {
  CaptionType? type;
  String? text;
  List<CaptionEntity>? entities;

  Ption({
    this.type,
    this.text,
    this.entities,
  });

  factory Ption.fromJson(Map<String, dynamic> json) => Ption(
        type: captionTypeValues.map[json["@type"]]!,
        text: json["text"],
        entities: json["entities"] == null
            ? []
            : List<CaptionEntity>.from(
                json["entities"]!.map((x) => CaptionEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": captionTypeValues.reverse[type],
        "text": text,
        "entities": entities == null
            ? []
            : List<dynamic>.from(entities!.map((x) => x.toJson())),
      };
}

class CaptionEntity {
  EntityTypeEnum? type;
  dynamic offset;
  dynamic length;
  Format? entityType;

  CaptionEntity({
    this.type,
    this.offset,
    this.length,
    this.entityType,
  });

  factory CaptionEntity.fromJson(Map<String, dynamic> json) => CaptionEntity(
        type: entityTypeEnumValues.map[json["@type"]]!,
        offset: json["offset"],
        length: json["length"],
        entityType: json["type"] == null ? null : Format.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": entityTypeEnumValues.reverse[type],
        "offset": offset,
        "length": length,
        "type": entityType?.toJson(),
      };
}

class Format {
  FormatType? type;

  Format({
    this.type,
  });

  factory Format.fromJson(Map<String, dynamic> json) => Format(
        type: formatTypeValues.map[json["@type"]]!,
      );

  Map<String, dynamic> toJson() => {
        "@type": formatTypeValues.reverse[type],
      };
}

enum FormatType {
  TEXT_ENTITY_TYPE_BOLD,
  TEXT_ENTITY_TYPE_URL,
  THUMBNAIL_FORMAT_JPEG
}

final formatTypeValues = EnumValues({
  "textEntityTypeBold": FormatType.TEXT_ENTITY_TYPE_BOLD,
  "textEntityTypeUrl": FormatType.TEXT_ENTITY_TYPE_URL,
  "thumbnailFormatJpeg": FormatType.THUMBNAIL_FORMAT_JPEG
});

enum EntityTypeEnum { TEXT_ENTITY }

final entityTypeEnumValues =
    EnumValues({"textEntity": EntityTypeEnum.TEXT_ENTITY});

enum CaptionType { FORMATTED_TEXT }

final captionTypeValues =
    EnumValues({"formattedText": CaptionType.FORMATTED_TEXT});

class ContentPhoto {
  String? type;
  String? id;
  dynamic addedDate;
  Minithumbnail? minithumbnail;
  List<Size>? sizes;

  ContentPhoto({
    this.type,
    this.id,
    this.addedDate,
    this.minithumbnail,
    this.sizes,
  });

  factory ContentPhoto.fromJson(Map<String, dynamic> json) => ContentPhoto(
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
  MinithumbnailType? type;
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
        type: minithumbnailTypeValues.map[json["@type"]]!,
        width: json["width"],
        height: json["height"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "@type": minithumbnailTypeValues.reverse[type],
        "width": width,
        "height": height,
        "data": data,
      };
}

enum MinithumbnailType { MINITHUMBNAIL }

final minithumbnailTypeValues =
    EnumValues({"minithumbnail": MinithumbnailType.MINITHUMBNAIL});

class Size {
  SizeType? type;
  String? sizeType;
  FileClass? photo;
  dynamic width;
  dynamic height;
  List<int>? progressiveSizes;

  Size({
    this.type,
    this.sizeType,
    this.photo,
    this.width,
    this.height,
    this.progressiveSizes,
  });

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        type: sizeTypeValues.map[json["@type"]]!,
        sizeType: json["type"],
        photo: json["photo"] == null ? null : FileClass.fromJson(json["photo"]),
        width: json["width"],
        height: json["height"],
        progressiveSizes: json["progressive_sizes"] == null
            ? []
            : List<int>.from(json["progressive_sizes"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": sizeTypeValues.reverse[type],
        "type": sizeType,
        "photo": photo?.toJson(),
        "width": width,
        "height": height,
        "progressive_sizes": progressiveSizes == null
            ? []
            : List<dynamic>.from(progressiveSizes!.map((x) => x)),
      };
}

class FileClass {
  FileType? type;
  dynamic id;
  dynamic size;
  dynamic expectedSize;
  Local? local;
  Remote? remote;

  FileClass({
    this.type,
    this.id,
    this.size,
    this.expectedSize,
    this.local,
    this.remote,
  });

  factory FileClass.fromJson(Map<String, dynamic> json) => FileClass(
        type: fileTypeValues.map[json["@type"]]!,
        id: json["id"],
        size: json["size"],
        expectedSize: json["expected_size"],
        local: json["local"] == null ? null : Local.fromJson(json["local"]),
        remote: json["remote"] == null ? null : Remote.fromJson(json["remote"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": fileTypeValues.reverse[type],
        "id": id,
        "size": size,
        "expected_size": expectedSize,
        "local": local?.toJson(),
        "remote": remote?.toJson(),
      };
}

class Local {
  LocalType? type;
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
        type: localTypeValues.map[json["@type"]]!,
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
        "@type": localTypeValues.reverse[type],
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

enum LocalType { LOCAL_FILE }

final localTypeValues = EnumValues({"localFile": LocalType.LOCAL_FILE});

class Remote {
  RemoteType? type;
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
        type: remoteTypeValues.map[json["@type"]]!,
        id: json["id"],
        uniqueId: json["unique_id"],
        isUploadingActive: json["is_uploading_active"],
        isUploadingCompleted: json["is_uploading_completed"],
        uploadedSize: json["uploaded_size"],
      );

  Map<String, dynamic> toJson() => {
        "@type": remoteTypeValues.reverse[type],
        "id": id,
        "unique_id": uniqueId,
        "is_uploading_active": isUploadingActive,
        "is_uploading_completed": isUploadingCompleted,
        "uploaded_size": uploadedSize,
      };
}

enum RemoteType { REMOTE_FILE }

final remoteTypeValues = EnumValues({"remoteFile": RemoteType.REMOTE_FILE});

enum FileType { FILE }

final fileTypeValues = EnumValues({"file": FileType.FILE});

enum SizeType { PHOTO_SIZE }

final sizeTypeValues = EnumValues({"photoSize": SizeType.PHOTO_SIZE});

class Text {
  CaptionType? type;
  String? text;
  List<TextEntity>? entities;

  Text({
    this.type,
    this.text,
    this.entities,
  });

  factory Text.fromJson(Map<String, dynamic> json) => Text(
        type: captionTypeValues.map[json["@type"]]!,
        text: json["text"],
        entities: json["entities"] == null
            ? []
            : List<TextEntity>.from(
                json["entities"]!.map((x) => TextEntity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": captionTypeValues.reverse[type],
        "text": text,
        "entities": entities == null
            ? []
            : List<dynamic>.from(entities!.map((x) => x.toJson())),
      };
}

class TextEntity {
  EntityTypeEnum? type;
  dynamic offset;
  dynamic length;
  EntityType? entityType;

  TextEntity({
    this.type,
    this.offset,
    this.length,
    this.entityType,
  });

  factory TextEntity.fromJson(Map<String, dynamic> json) => TextEntity(
        type: entityTypeEnumValues.map[json["@type"]]!,
        offset: json["offset"],
        length: json["length"],
        entityType:
            json["type"] == null ? null : EntityType.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": entityTypeEnumValues.reverse[type],
        "offset": offset,
        "length": length,
        "type": entityType?.toJson(),
      };
}

class EntityType {
  String? type;
  String? url;

  EntityType({
    this.type,
    this.url,
  });

  factory EntityType.fromJson(Map<String, dynamic> json) => EntityType(
        type: json["@type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "url": url,
      };
}

class ContentVideo {
  TypeEnum? type;
  dynamic duration;
  dynamic width;
  dynamic height;
  String? fileName;
  MimeType? mimeType;
  bool? hasStickers;
  bool? supportsStreaming;
  Minithumbnail? minithumbnail;
  Thumbnail? thumbnail;
  FileClass? video;

  ContentVideo({
    this.type,
    this.duration,
    this.width,
    this.height,
    this.fileName,
    this.mimeType,
    this.hasStickers,
    this.supportsStreaming,
    this.minithumbnail,
    this.thumbnail,
    this.video,
  });

  factory ContentVideo.fromJson(Map<String, dynamic> json) => ContentVideo(
        type: typeEnumValues.map[json["@type"]]!,
        duration: json["duration"],
        width: json["width"],
        height: json["height"],
        fileName: json["file_name"],
        mimeType: mimeTypeValues.map[json["mime_type"]]!,
        hasStickers: json["has_stickers"],
        supportsStreaming: json["supports_streaming"],
        minithumbnail: json["minithumbnail"] == null
            ? null
            : Minithumbnail.fromJson(json["minithumbnail"]),
        thumbnail: json["thumbnail"] == null
            ? null
            : Thumbnail.fromJson(json["thumbnail"]),
        video: json["video"] == null ? null : FileClass.fromJson(json["video"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": typeEnumValues.reverse[type],
        "duration": duration,
        "width": width,
        "height": height,
        "file_name": fileName,
        "mime_type": mimeTypeValues.reverse[mimeType],
        "has_stickers": hasStickers,
        "supports_streaming": supportsStreaming,
        "minithumbnail": minithumbnail?.toJson(),
        "thumbnail": thumbnail?.toJson(),
        "video": video?.toJson(),
      };
}

enum MimeType { VIDEO_MP4 }

final mimeTypeValues = EnumValues({"video/mp4": MimeType.VIDEO_MP4});

class Thumbnail {
  String? type;
  Format? format;
  dynamic width;
  dynamic height;
  FileClass? file;

  Thumbnail({
    this.type,
    this.format,
    this.width,
    this.height,
    this.file,
  });

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        type: json["@type"],
        format: json["format"] == null ? null : Format.fromJson(json["format"]),
        width: json["width"],
        height: json["height"],
        file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "format": format?.toJson(),
        "width": width,
        "height": height,
        "file": file?.toJson(),
      };
}

enum TypeEnum { VIDEO }

final typeEnumValues = EnumValues({"video": TypeEnum.VIDEO});

class WebPage {
  String? type;
  String? url;
  String? displayUrl;
  TypeEnum? webPageType;
  String? siteName;
  String? title;
  Ption? description;
  WebPagePhoto? photo;
  String? embedUrl;
  String? embedType;
  dynamic embedWidth;
  dynamic embedHeight;
  dynamic duration;
  String? author;
  dynamic instantViewVersion;

  WebPage({
    this.type,
    this.url,
    this.displayUrl,
    this.webPageType,
    this.siteName,
    this.title,
    this.description,
    this.photo,
    this.embedUrl,
    this.embedType,
    this.embedWidth,
    this.embedHeight,
    this.duration,
    this.author,
    this.instantViewVersion,
  });

  factory WebPage.fromJson(Map<String, dynamic> json) => WebPage(
        type: json["@type"],
        url: json["url"],
        displayUrl: json["display_url"],
        webPageType: typeEnumValues.map[json["type"]]!,
        siteName: json["site_name"],
        title: json["title"],
        description: json["description"] == null
            ? null
            : Ption.fromJson(json["description"]),
        photo:
            json["photo"] == null ? null : WebPagePhoto.fromJson(json["photo"]),
        embedUrl: json["embed_url"],
        embedType: json["embed_type"],
        embedWidth: json["embed_width"],
        embedHeight: json["embed_height"],
        duration: json["duration"],
        author: json["author"],
        instantViewVersion: json["instant_view_version"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "url": url,
        "display_url": displayUrl,
        "type": typeEnumValues.reverse[webPageType],
        "site_name": siteName,
        "title": title,
        "description": description?.toJson(),
        "photo": photo?.toJson(),
        "embed_url": embedUrl,
        "embed_type": embedType,
        "embed_width": embedWidth,
        "embed_height": embedHeight,
        "duration": duration,
        "author": author,
        "instant_view_version": instantViewVersion,
      };
}

class WebPagePhoto {
  String? type;
  bool? hasStickers;
  Minithumbnail? minithumbnail;
  List<Size>? sizes;

  WebPagePhoto({
    this.type,
    this.hasStickers,
    this.minithumbnail,
    this.sizes,
  });

  factory WebPagePhoto.fromJson(Map<String, dynamic> json) => WebPagePhoto(
        type: json["@type"],
        hasStickers: json["has_stickers"],
        minithumbnail: json["minithumbnail"] == null
            ? null
            : Minithumbnail.fromJson(json["minithumbnail"]),
        sizes: json["sizes"] == null
            ? []
            : List<Size>.from(json["sizes"]!.map((x) => Size.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "has_stickers": hasStickers,
        "minithumbnail": minithumbnail?.toJson(),
        "sizes": sizes == null
            ? []
            : List<dynamic>.from(sizes!.map((x) => x.toJson())),
      };
}

class InteractionInfo {
  InteractionInfoType? type;
  dynamic viewCount;
  dynamic forwardCount;
  List<Reaction>? reactions;

  InteractionInfo({
    this.type,
    this.viewCount,
    this.forwardCount,
    this.reactions,
  });

  factory InteractionInfo.fromJson(Map<String, dynamic> json) =>
      InteractionInfo(
        type: interactionInfoTypeValues.map[json["@type"]]!,
        viewCount: json["view_count"],
        forwardCount: json["forward_count"],
        reactions: json["reactions"] == null
            ? []
            : List<Reaction>.from(
                json["reactions"]!.map((x) => Reaction.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": interactionInfoTypeValues.reverse[type],
        "view_count": viewCount,
        "forward_count": forwardCount,
        "reactions": reactions == null
            ? []
            : List<dynamic>.from(reactions!.map((x) => x.toJson())),
      };
}

class Reaction {
  ReactionTypeEnum? type;
  ReactionType? reactionType;
  dynamic totalCount;
  bool? isChosen;
  List<dynamic>? recentSenderIds;

  Reaction({
    this.type,
    this.reactionType,
    this.totalCount,
    this.isChosen,
    this.recentSenderIds,
  });

  factory Reaction.fromJson(Map<String, dynamic> json) => Reaction(
        type: reactionTypeEnumValues.map[json["@type"]]!,
        reactionType:
            json["type"] == null ? null : ReactionType.fromJson(json["type"]),
        totalCount: json["total_count"],
        isChosen: json["is_chosen"],
        recentSenderIds: json["recent_sender_ids"] == null
            ? []
            : List<dynamic>.from(json["recent_sender_ids"]!.map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "@type": reactionTypeEnumValues.reverse[type],
        "type": reactionType?.toJson(),
        "total_count": totalCount,
        "is_chosen": isChosen,
        "recent_sender_ids": recentSenderIds == null
            ? []
            : List<dynamic>.from(recentSenderIds!.map((x) => x)),
      };
}

class ReactionType {
  PurpleType? type;
  Emoji? emoji;

  ReactionType({
    this.type,
    this.emoji,
  });

  factory ReactionType.fromJson(Map<String, dynamic> json) => ReactionType(
        type: purpleTypeValues.map[json["@type"]]!,
        emoji: emojiValues.map[json["emoji"]]!,
      );

  Map<String, dynamic> toJson() => {
        "@type": purpleTypeValues.reverse[type],
        "emoji": emojiValues.reverse[emoji],
      };
}

enum Emoji { EMPTY, EMOJI, PURPLE, FLUFFY }

final emojiValues = EnumValues({
  "\ud83d\udd25": Emoji.EMOJI,
  "\ud83d\udc4d": Emoji.EMPTY,
  "\ud83e\udee1": Emoji.FLUFFY,
  "❤": Emoji.PURPLE
});

enum PurpleType { REACTION_TYPE_EMOJI }

final purpleTypeValues =
    EnumValues({"reactionTypeEmoji": PurpleType.REACTION_TYPE_EMOJI});

enum ReactionTypeEnum { MESSAGE_REACTION }

final reactionTypeEnumValues =
    EnumValues({"messageReaction": ReactionTypeEnum.MESSAGE_REACTION});

enum InteractionInfoType { MESSAGE_INTERACTION_INFO }

final interactionInfoTypeValues = EnumValues(
    {"messageInteractionInfo": InteractionInfoType.MESSAGE_INTERACTION_INFO});

class SenderId {
  SenderIdType? type;
  dynamic chatId;

  SenderId({
    this.type,
    this.chatId,
  });

  factory SenderId.fromJson(Map<String, dynamic> json) => SenderId(
        type: senderIdTypeValues.map[json["@type"]]!,
        chatId: json["chat_id"],
      );

  Map<String, dynamic> toJson() => {
        "@type": senderIdTypeValues.reverse[type],
        "chat_id": chatId,
      };
}

enum SenderIdType { MESSAGE_SENDER_CHAT }

final senderIdTypeValues =
    EnumValues({"messageSenderChat": SenderIdType.MESSAGE_SENDER_CHAT});

enum MessageType { MESSAGE }

final messageTypeValues = EnumValues({"message": MessageType.MESSAGE});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
