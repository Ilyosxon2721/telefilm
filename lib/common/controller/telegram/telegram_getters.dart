// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:get/get.dart';
import 'package:telefilm/common/class/telegram/chat/chat_histories/chat_history_class.dart';
import 'package:telefilm/common/class/telegram/chat/chat_histories/video_messages.dart';
import 'package:telefilm/common/class/telegram/chat/download_file_class.dart';
import 'package:telefilm/common/class/telegram/chat/super_group_full_info_class.dart';
import 'package:telegram_client/tdlib/tdlib.dart';

import '../../class/telegram/chats.dart';
import '../../class/telegram/countries.dart';
import '../../getter/getter.dart';
import '../connect/tg_connect.dart';

class TelegramGetters extends GetxController {
  final Tdlib tg = Get.put(GlobalConnectClass()).tg;

  Future<void> getCountries() async {
    await tg
        .request(
      "getCountries",
      parameters: {},
      clientId: tg.client_id,
      isVoid: true,
      extra: 'Countries',
    )
        .then((value) {
      if (value.isNotEmpty) {
        print(value);
        final json = jsonEncode(value);
        print(json);
        Countries countries = countriesFromJson(json);
        telegramDatas.countries.value = countries;
      }
    }).catchError((onError) => print(onError));
  }

  Future<void> getCountryCode() async {
    await tg
        .invoke(
      "getCountryCode",
      parameters: {},
      clientId: tg.client_id,
      isVoid: true,
      extra: 'Country Code',
    )
        .then((value) {
      print(value);
      // if (value.isNotEmpty) {
      //   final json = jsonEncode(value);
      //   Countries countries = countriesFromJson(json);
      //   telegramDatas.countries.value = countries;
      // }
    }).catchError((onError) => print(onError));
  }

  Future<void> sendMessage(
    message,
    id,
  ) async {
    await tg
        .request(
      "sendMessage",
      parameters: {"chat_id": id, "text": message},
      clientId: tg.client_id,
      isVoid: true,
      extra: 'checkAuthenticationCode',
    )
        .then((value) {
      final json = jsonEncode(value);
      print("Success $json");
      // VerifyPhoneNumberData verifyPhoneNumberData =
      //     verifyPhoneNumberDataFromJson(json);
      // telegramDatas.verifyPhoneNumberData.value = verifyPhoneNumberData;
      // Get.toNamed(AppRoutes.verifyPhoneNumber);
    }).catchError((onError) {
      final json = jsonEncode(onError);
      print("Error  $json");
      if (onError != null) {
        // WrongPhoneNumber wrongPhoneNumber =
        //     wrongPhoneNumberFromJson(jsonEncode(onError));
        // print(wrongPhoneNumber.message.tr);
        // Get.back();
        // Get.defaultDialog(
        //   barrierDismissible: false,
        //   title: wrongPhoneNumber.type.tr,
        //   middleText: wrongPhoneNumber.message.tr,
        //   cancel: Container(
        //     alignment: Alignment.center,
        //     child: TextButton(
        //       onPressed: () {
        //         Get.back();
        //       },
        //       child: Text('Edit'.tr),
        //     ),
        //   ),
        // );
      }
      // Get.dialog(Text('Wrong Phone Number!'.tr));
    });
  }

  Future<void> loadChats() async {
    telegramProgress.loadChatsStatus.value = true;
    await tg
        .request(
      "getChats",
      parameters: {
        "chat_list": null,
        "limit": 400,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getChats',
    )
        .catchError((onError) {
      print("Error $onError");
    }).then((value) {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        try {
          Chats chats = chatsFromJson(json);
          telegramDatas.chats.value = chats;
        } catch (e) {
          print("Error Load Chats $e");
        }
      } else {
        print("Chats result json is Empty");
      }
    }).catchError((onError) {
      log("Error when load chats $onError");
    }).whenComplete(() => telegramProgress.loadChatsStatus.value = false);
  }

  Future<void> getUser(int userId) async {
    await tg
        .request(
      "getUser",
      parameters: {
        "user_id": userId,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getUser',
    )
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        log(json);
        // try {
        //   Chats chats = chatsFromJson(json);
        //   telegramDatas.chats.value = chats;
        // } catch (e) {
        //   print("EEEEEEEEEEEEEEEE $e");
        // }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
  }

  Future<void> getMe() async {
    await tg
        .request(
      "getMe",
      parameters: {},
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getMe',
    )
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        log(json);
        // try {
        //   Chats chats = chatsFromJson(json);
        //   telegramDatas.chats.value = chats;
        // } catch (e) {
        //   print("EEEEEEEEEEEEEEEE $e");
        // }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
  }

  Future<void> getUserProfilePhotos(int userId, int offset, int limit) async {
    await tg
        .request(
      "getUserProfilePhotos",
      parameters: {
        "user_id": userId,
        "offset": offset,
        "limit": limit,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getUserProfilePhotos',
    )
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        log(json);
        // try {
        //   Chats chats = chatsFromJson(json);
        //   telegramDatas.chats.value = chats;
        // } catch (e) {
        //   print("EEEEEEEEEEEEEEEE $e");
        // }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
  }

  Future<void> getSupergroupFullInfo(int supergroupId) async {
    Map<dynamic, dynamic> result = await tg
        .request(
      "getSupergroupFullInfo",
      parameters: {
        "supergroup_id": supergroupId,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getSupergroupFullInfo',
    )
        .catchError((onError) {
      print("Error $onError");
    });

    if (result.isNotEmpty) {
      final json = jsonEncode(result);
      try {
        SuperGroupFullInfo superGroupFullInfo =
            superGroupFullInfoFromJson(json);

        telegramDatas.superGroupFullInfo.value = superGroupFullInfo;
      } catch (e) {
        print("Error ${e.reactive}");
      }
    } else {}
  }

  Future<void> getChat(int chatId) async {
    await tg
        .request(
      "getChat",
      parameters: {
        "chat_id": chatId,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getChat',
    )
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        log(json);
        // try {
        //   Chats chats = chatsFromJson(json);
        //   telegramDatas.chats.value = chats;
        // } catch (e) {
        //   print("EEEEEEEEEEEEEEEE $e");
        // }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
  }

  Future<DownloadFile> downloadFile(
    int fileId,
    int priority,
    int offset,
    int limit,
    bool synchronous,
  ) async {
    await tg
        .request(
      "downloadFile",
      parameters: {
        "file_id": fileId,
        "priority": priority,
        "offset": offset,
        "limit": limit,
        "synchronous": synchronous,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'downloadFile',
    )
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        log(json);
        try {
          DownloadFile downloadFile = downloadFileFromJson(json);
          telegramDatas.downloadFile.value = downloadFile;
          return downloadFile;
        } catch (e) {
          print("EEEEEEEEEEEEEEEE $e");
        }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
    return telegramDatas.downloadFile.value;
  }

  Future<File> getFile(
    int fileId,
    int priority,
    int offset,
    int limit,
    bool synchronous,
  ) async {
    // File result = File(
    //     '/data/data/app.telefilm.org.telefilm/files/photos/5377749695901845792_97.jpg');
    DownloadFile downloadResult =
        await downloadFile(fileId, priority, offset, limit, synchronous);

    File result = File(downloadResult.local?.path ?? '');
    return result;
  }

  Future<void> getChatListsToAddChat(int chatId) async {
    await tg
        .request(
      "getChatListsToAddChat",
      parameters: {
        "chat_id": chatId,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getChats',
    )
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        log(json);
      }
    }).catchError((onError) {
      print("Error $onError");
    });
  }

  Future<ChatHistory> getChatHistory(
    int chatId,
    int fromMessageId,
    int offset,
    int limit,
    bool onlyLocal,
  ) async {
    await tg
        .request(
      "getChatHistory",
      parameters: {
        "chat_id": chatId,
        "from_message_id": fromMessageId,
        "offset": offset,
        "limit": limit,
        "only_local": onlyLocal,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getChatHistory',
    )
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        log(json);
        try {
          ChatHistory chatHistory = chatHistoryFromJson(json);
          telegramDatas.chatHistory.value = chatHistory;
          List<Message> list = chatHistory.messages
                  ?.where((element) => element.content?.type == "messageVideo")
                  .toList() ??
              [];
          // groupInfo = telegramDatas.superGroupFullInfoList.where((element) => element.reactive.)

          for (var i = 0; i < list.length; i++) {
            print('History list count $i');
            final groupId = list[i].chatId;
            await telegramGetters.getSupergroupFullInfo(int.parse(
              groupId.toString().substring(4),
            ));
            telegramDatas.superGroupFullInfo.listen((callback) {
              List<VideoMessages> isEqual = telegramDatas.videoMessages
                  .where((element) => element.message.id = list[i].id)
                  .toList();
              print("VideoMessages List ${isEqual.isEmpty} ");
              isEqual.isEmpty
                  ? telegramDatas.videoMessages
                      .add(VideoMessages(i, callback, list[i]))
                  : null;
            });
            List<Message> isEqual = telegramDatas.chatHistoryVideos
                .where((element) => identical(element, list[i]))
                .toList();
            print("Message List $isEqual ");
            isEqual.isEmpty
                ? telegramDatas.chatHistoryVideos.add(list[i])
                : null;
          }
        } catch (e) {
          print("Error Chat History $e");
        }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
    return telegramDatas.chatHistory.value;
  }

  Future<void> getChatStatistics(
    int chatId,
    bool isDark,
  ) async {
    await tg
        .request(
      "getChatStatistics",
      parameters: {
        "chat_id": chatId,
        "is_dark": isDark,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'getChatHistory',
    )
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
      }
    }).catchError((onError) {
      print("Error $onError");
    });
  }
}
