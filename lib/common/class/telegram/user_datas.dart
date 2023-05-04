// To parse this JSON data, do
//
//     final userDatas = userDatasFromJson(jsonString);

import 'dart:convert';

UserDatas userDatasFromJson(String str) => UserDatas.fromJson(json.decode(str));

String userDatasToJson(UserDatas data) => json.encode(data.toJson());

class UserDatas {
  UserDatas({
    required this.type,
    required this.user,
  });

  String type;
  User user;

  factory UserDatas.fromJson(Map<String, dynamic> json) => UserDatas(
        type: json["@type"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.type,
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.usernames,
    required this.phoneNumber,
    required this.status,
    required this.isContact,
    required this.isMutualContact,
    required this.isVerified,
    required this.isPremium,
    required this.isSupport,
    required this.restrictionReason,
    required this.isScam,
    required this.isFake,
    required this.haveAccess,
    required this.userType,
    required this.languageCode,
    required this.addedToAttachmentMenu,
  });

  String type;
  int id;
  String firstName;
  String lastName;
  Usernames usernames;
  String phoneNumber;
  Status status;
  bool isContact;
  bool isMutualContact;
  bool isVerified;
  bool isPremium;
  bool isSupport;
  String restrictionReason;
  bool isScam;
  bool isFake;
  bool haveAccess;
  Type userType;
  String languageCode;
  bool addedToAttachmentMenu;

  factory User.fromJson(Map<String, dynamic> json) => User(
        type: json["@type"],
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        usernames: Usernames.fromJson(json["usernames"]),
        phoneNumber: json["phone_number"],
        status: Status.fromJson(json["status"]),
        isContact: json["is_contact"],
        isMutualContact: json["is_mutual_contact"],
        isVerified: json["is_verified"],
        isPremium: json["is_premium"],
        isSupport: json["is_support"],
        restrictionReason: json["restriction_reason"],
        isScam: json["is_scam"],
        isFake: json["is_fake"],
        haveAccess: json["have_access"],
        userType: Type.fromJson(json["type"]),
        languageCode: json["language_code"],
        addedToAttachmentMenu: json["added_to_attachment_menu"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "usernames": usernames.toJson(),
        "phone_number": phoneNumber,
        "status": status.toJson(),
        "is_contact": isContact,
        "is_mutual_contact": isMutualContact,
        "is_verified": isVerified,
        "is_premium": isPremium,
        "is_support": isSupport,
        "restriction_reason": restrictionReason,
        "is_scam": isScam,
        "is_fake": isFake,
        "have_access": haveAccess,
        "type": userType.toJson(),
        "language_code": languageCode,
        "added_to_attachment_menu": addedToAttachmentMenu,
      };
}

class Status {
  Status({
    required this.type,
    required this.wasOnline,
  });

  String type;
  int wasOnline;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        type: json["@type"],
        wasOnline: json["was_online"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "was_online": wasOnline,
      };
}

class Type {
  Type({
    required this.type,
  });

  String type;

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        type: json["@type"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
      };
}

class Usernames {
  Usernames({
    required this.type,
    required this.activeUsernames,
    required this.disabledUsernames,
    required this.editableUsername,
  });

  String type;
  List<String> activeUsernames;
  List<dynamic> disabledUsernames;
  String editableUsername;

  factory Usernames.fromJson(Map<String, dynamic> json) => Usernames(
        type: json["@type"],
        activeUsernames:
            List<String>.from(json["active_usernames"].map((x) => x)),
        disabledUsernames:
            List<dynamic>.from(json["disabled_usernames"].map((x) => x)),
        editableUsername: json["editable_username"],
      );

  Map<String, dynamic> toJson() => {
        "@type": type,
        "active_usernames": List<dynamic>.from(activeUsernames.map((x) => x)),
        "disabled_usernames":
            List<dynamic>.from(disabledUsernames.map((x) => x)),
        "editable_username": editableUsername,
      };
}
