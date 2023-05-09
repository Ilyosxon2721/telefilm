import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/controller/telegram/telegram_controller.dart';
import '../common/getter/getter.dart';
import 'index.dart';

class AndroidMainPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AndroidMainPageController();

  final isProcessing = false.obs;
  final scrollController = ScrollController();
  RxInt indexOfBottomNavBar = 0.obs;
  RxInt currentTabIndex = 0.obs;

  final state = AndroidMainPageState();
  var searchInputController = TextEditingController();
  final tg = Get.put(TelegramController());
  // Future<void> loadChannelHistory(List<Result> channels) async {
  //   for (var i = 0; i < channels.length; i++) {
  //     await telegramGetters.getChatHistory(
  //         // channels[i].id ?? 0,
  //         int.parse(
  //           channels[i].id.toString(),
  //         ),
  //         0,
  //         0,
  //         100,
  //         false);
  //   }
  //   telegramDatas.chatHistory.listen((callback) {
  //     List<ChatHistory> isEqual = telegramDatas.chatHistoryList
  //         .where((element) => identical(element, callback))
  //         .toList();
  //     print("ChatHistory list $isEqual");
  //     isEqual.isEmpty ? telegramDatas.chatHistoryList.add(callback) : null;
  //   });
  // }
  //
  // Future<void> loadChannels(Chats chats) async {
  //   List<Result> channels = chats.result
  //           ?.where((element) => element.type == Type.CHANNEL)
  //           .toList() ??
  //       [];
  //   telegramDatas.channels = channels;
  //   int channelsLength = channels.length;
  //   for (var i = 0; i < channelsLength; i++) {
  //     int supergroupId = int.parse(channels[i].id.toString().substring(4));
  //     telegramGetters.getSupergroupFullInfo(supergroupId);
  //   }
  //
  //   ever(telegramDatas.superGroupFullInfo, (callback) {
  //     List<SuperGroupFullInfo> isEqual = telegramDatas.superGroupFullInfoList
  //         .where((element) => identical(element, callback))
  //         .toList();
  //     print("SuperGroupFullInfo list $isEqual");
  //     isEqual.isEmpty
  //         ? telegramDatas.superGroupFullInfoList.add(callback)
  //         : null;
  //   });
  //
  //   loadChannelHistory(channels);
  // }

  Future<void> getContent() async {
    telegramGetters.loadChats();
    log(telegramDatas.chats.value.result!.length.toString());
  }
}
