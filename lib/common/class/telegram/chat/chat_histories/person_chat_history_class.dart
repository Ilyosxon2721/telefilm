// To parse this JSON data, do
//
//     final personChatHistory = personChatHistoryFromJson(jsonString);

import 'dart:convert';

PersonChatHistory personChatHistoryFromJson(String str) =>
    PersonChatHistory.fromJson(json.decode(str));

String personChatHistoryToJson(PersonChatHistory data) =>
    json.encode(data.toJson());

class PersonChatHistory {
  String? type;
  int? totalCount;
  List<Message>? messages;

  PersonChatHistory({
    this.type,
    this.totalCount,
    this.messages,
  });

  factory PersonChatHistory.fromJson(Map<String, dynamic> json) =>
      PersonChatHistory(
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
      };
}

class Content {
  String? type;
  Text? text;
  WebPage? webPage;

  Content({
    this.type,
    this.text,
    this.webPage,
  });

  factory Content.fromJson(Map<String, dynamic> json) => Content(
        type: json["@type"],
        text: json["text"] == null ? null : Text.fromJson(json["text"]),
        webPage: json["web_page"] == null
            ? null
            : WebPage.fromJson(json["web_page"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "text": text?.toJson(),
        "web_page": webPage?.toJson(),
      };
}

class Text {
  String? type;
  String? text;
  List<Entity>? entities;

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
            : List<Entity>.from(
                json["entities"]!.map((x) => Entity.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "text": text,
        "entities": entities == null
            ? []
            : List<dynamic>.from(entities!.map((x) => x.toJson())),
      };
}

class Entity {
  String? type;
  int? offset;
  int? length;
  Type? entityType;

  Entity({
    this.type,
    this.offset,
    this.length,
    this.entityType,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => Entity(
        type: json["@type"],
        offset: json["offset"],
        length: json["length"],
        entityType: json["type"] == null ? null : Type.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "offset": offset,
        "length": length,
        "type": entityType?.toJson(),
      };
}

class Type {
  String? type;

  Type({
    this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["@type"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
      };
}

class WebPage {
  String? type;
  String? url;
  String? displayUrl;
  String? webPageType;
  String? siteName;
  String? title;
  Text? description;
  WebPagePhoto? photo;
  String? embedUrl;
  String? embedType;
  int? embedWidth;
  int? embedHeight;
  int? duration;
  String? author;
  int? instantViewVersion;

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
        webPageType: json["type"],
        siteName: json["site_name"],
        title: json["title"],
        description: json["description"] == null
            ? null
            : Text.fromJson(json["description"]),
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
        "type": webPageType,
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

class Size {
  String? type;
  String? sizeType;
  SizePhoto? photo;
  int? width;
  int? height;
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
  int? id;
  int? size;
  int? expectedSize;
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
