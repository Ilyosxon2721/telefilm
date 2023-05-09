import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefilm/common/class/telegram/chats.dart';

import '../common/controller/telegram/telegram_controller.dart';
import '../common/getter/getter.dart';
import 'index.dart';

class AndroidProfilePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AndroidProfilePageController();
  final isProcessing = false.obs;
  final scrollController = ScrollController();
  RxInt indexOfBottomNavBar = 0.obs;
  RxInt currentTabIndex = 0.obs;

  final state = AndroidProfilePageState();
  var searchInputController = TextEditingController();
  final tg = Get.put(TelegramController());
  Future<void> loadChannelHistory(List<Result> channels) async {
    telegramDatas.chatHistoryList.clear();
    telegramDatas.chatHistoryVideos.clear();
    telegramDatas.videoMessages.clear();
    for (var i = 0; i < channels.length; i++) {
      await telegramGetters
          .getChatHistory(
              // channels[i].id ?? 0,
              int.parse(
                channels[i].id.toString(),
              ),
              0,
              0,
              100,
              false)
          .then((value) => telegramDatas.chatHistoryList.add(value));
    }
  }

  // Future<void> loadChannels(Chats chats) async {
  //   List<Result>? channels =
  //       chats.result?.where((element) => element.type == Type.CHANNEL).toList();
  //   // List<Result>? channels = telegramDatas.chats.value.result
  //   //     ?.where((element) => element.type == Type.CHANNEL)
  //   //     .toList();
  //   telegramDatas.channels = channels ?? [];
  //   int channelLength = channels!.length;
  //   telegramDatas.superGroupFullInfoList.clear();
  //   for (var i = 0; i < channelLength; i++) {
  //     await telegramGetters
  //         .getSupergroupFullInfo(
  //       int.parse(
  //         channels[i].id.toString().substring(4),
  //       ),
  //     )
  //         .then((value) async {
  //       telegramDatas.superGroupFullInfoList
  //           .add(telegramDatas.superGroupFullInfo.value);
  //       int photoId = telegramDatas
  //               .superGroupFullInfo.value.photo?.sizes?.first.photo?.id ??
  //           0;
  //       String path = telegramDatas.superGroupFullInfo.value.photo?.sizes?.first
  //               .photo?.local?.path ??
  //           '';
  //       if (photoId != 0 && path != '') {
  //         await telegramGetters.getFile(
  //           photoId,
  //           1,
  //           1,
  //           0,
  //           true,
  //         );
  //       }
  //     });
  //   }
  //   await loadChannelHistory(channels);
  // }

  Future<void> getContent() async {
    // loadChannels();
  }

  @override
  void onInit() {
    getContent();
    super.onInit();
  }
}
