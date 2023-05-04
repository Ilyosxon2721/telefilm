// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:telefilm/common/class/telegram/chat/chat_history_class.dart';
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
        .then((value) async {
      if (value.isNotEmpty) {
        final json = jsonEncode(value);
        try {
          Chats chats = chatsFromJson(json);
          telegramDatas.chats.value = chats;
        } catch (e) {
          print("EEEEEEEEEEEEEEEE $e");
        }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
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
        // final json = jsonEncode(value);
        print(value);
        // try {
        //   Chats chats = chatsFromJson(json);
        //   telegramDatas.chats.value = chats;
        //   print('Resultss ${chats.result}');
        // } catch (e) {
        //   print("EEEEEEEEEEEEEEEE $e");
        // }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
  }

  Future<void> getChatHistory(
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
        // print(json);
        log(json);

        try {
          ChatHistory chatHistory = chatHistoryFromJson(json);
          telegramDatas.chatHistory.value = chatHistory;
          telegramDatas.chatHistoryVideos.value = chatHistory.messages?.where(
                  (element) => element.content?.type == "messageVideo") ??
              const Iterable.empty();
        } catch (e) {
          print("EEEEEEEEEEEEEEEE $e");
        }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
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
        // print(json);
        debugPrint(json);
        // try {
        //   Chats chats = chatsFromJson(json);
        //   telegramDatas.chats.value = chats;
        //   print('Resultss ${chats.result}');
        // } catch (e) {
        //   print("EEEEEEEEEEEEEEEE $e");
        // }
      }
    }).catchError((onError) {
      print("Error $onError");
    });
  }
}
