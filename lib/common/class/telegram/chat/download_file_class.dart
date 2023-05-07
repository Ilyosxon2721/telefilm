// To parse this JSON data, do
//
//     final downloadFile = downloadFileFromJson(jsonString);

import 'dart:convert';

DownloadFile downloadFileFromJson(String str) =>
    DownloadFile.fromJson(json.decode(str));

String downloadFileToJson(DownloadFile data) => json.encode(data.toJson());

class DownloadFile {
  String? type;
  int? id;
  int? size;
  int? expectedSize;
  Local? local;
  Remote? remote;

  DownloadFile({
    this.type,
    this.id,
    this.size,
    this.expectedSize,
    this.local,
    this.remote,
  });

  factory DownloadFile.fromJson(Map<String, dynamic> json) => DownloadFile(
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
