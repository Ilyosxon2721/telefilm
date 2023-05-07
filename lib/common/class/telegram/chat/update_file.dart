// To parse this JSON data, do
//
//     final updateFile = updateFileFromJson(jsonString);

import 'dart:convert';

UpdateFile updateFileFromJson(String str) =>
    UpdateFile.fromJson(json.decode(str));

String updateFileToJson(UpdateFile data) => json.encode(data.toJson());

class UpdateFile {
  String? type;
  FileClass? file;

  UpdateFile({
    this.type,
    this.file,
  });

  factory UpdateFile.fromJson(Map<String, dynamic> json) => UpdateFile(
        type: json["@type"],
        file: json["file"] == null ? null : FileClass.fromJson(json["file"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "file": file?.toJson(),
      };
}

class FileClass {
  String? type;
  int? id;
  int? size;
  int? expectedSize;
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
