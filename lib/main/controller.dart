import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefilm/common/class/telegram/chat/channel_class.dart';
import 'package:telefilm/common/class/telegram/chat/chat_histories/bots_class.dart';
import 'package:telefilm/common/class/telegram/chat/private_chats_class.dart';
import 'package:telefilm/common/class/telegram/chat/super_group_class.dart';

import '../common/class/telegram/chats.dart';
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
  void sortByType(Chats chats) {
    List<Result> chatslist = chats.result ?? [];
    for (var i = 0; i < chatslist.length; i++) {
      switch (chatslist[i].type) {
        case Type.PRIVATE:
          if (chatslist[i].isBot != null) {
            if (chatslist[i].isBot!) {
              final json = jsonEncode(chatslist[i]);
              Bots bots = botsFromJson(json);
              bool isEqual = telegramDatas.botsList
                      .where((element) => element.id != bots.id)
                      .toList()
                      .isEmpty
                  ? true
                  : false;
              telegramDatas.botsList.addIf(isEqual, bots);
            } else {
              final json = jsonEncode(chatslist[i]);
              PrivateChats privateChats = privateChatsFromJson(json);
              bool isEqual = telegramDatas.privateChatsList
                      .where((element) => element.id != privateChats.id)
                      .toList()
                      .isEmpty
                  ? true
                  : false;
              telegramDatas.privateChatsList.addIf(isEqual, privateChats);
            }
          }
          break;
        case Type.CHANNEL:
          final json = jsonEncode(chatslist[i]);
          Channel channel = channelFromJson(json);
          bool isEqual = telegramDatas.channelList
                  .where((element) => element.id != channel.id)
                  .toList()
                  .isEmpty
              ? true
              : false;
          telegramDatas.channelList.addIf(isEqual, channel);
          break;
        case Type.SUPERGROUP:
          final json = jsonEncode(chatslist[i]);
          SuperGroup superGroup = superGroupFromJson(json);
          bool isEqual = telegramDatas.superGroupList
                  .where((element) => element.id != superGroup.id)
                  .toList()
                  .isEmpty
              ? true
              : false;
          telegramDatas.superGroupList.addIf(isEqual, superGroup);
          break;
        default:
      }
    }
  }

  void getChatHistories() {
    List<Bots> botslist = telegramDatas.botsList;
    List<Channel> channellist = telegramDatas.channelList;
    List<SuperGroup> superGrouplist = telegramDatas.superGroupList;
    List<PrivateChats> privateslist = telegramDatas.privateChatsList;
    if (botslist.isNotEmpty) {
      for (var i = 0; i < botslist.length; i++) {
        telegramGetters
            .getChatHistory(botslist[i].id ?? 0, 0, 0, 20, false)
            .then((value) {
          telegramDatas.chatHistoryListFromBots.insert(i, value);
        });
      }
    }
    if (channellist.isNotEmpty) {
      for (var i = 0; i < channellist.length; i++) {
        telegramGetters
            .getChatHistory(channellist[i].id ?? 0, 0, 0, 20, false)
            .then((value) {
          telegramDatas.chatHistoryListFromChannels.insert(i, value);
        });
      }
    }
    if (superGrouplist.isNotEmpty) {
      for (var i = 0; i < superGrouplist.length; i++) {
        telegramGetters
            .getChatHistory(superGrouplist[i].id ?? 0, 0, 0, 20, false)
            .then((value) {
          telegramDatas.chatHistoryListFromSuperGroups.insert(i, value);
        });
      }
    }
    if (privateslist.isNotEmpty) {
      for (var i = 0; i < privateslist.length; i++) {
        telegramGetters
            .getChatHistory(privateslist[i].id ?? 0, 0, 0, 20, false)
            .then((value) {
          telegramDatas.chatHistoryListFromPrivates.insert(i, value);
        });
      }
    }
    List<Result> chatslist = telegramDatas.chats.value.result ?? [];
    for (var i = 0; i < chatslist.length; i++) {
      telegramGetters
          .getChatHistory(chatslist[i].id ?? 0, 0, 0, 20, false)
          .then((value) {
        telegramDatas.chatHistoryList.insert(i, value);
      });
    }
  }

  Future<void> getContent() async {
    final chats = telegramDatas.chats.value.result ?? [];
    chats.isEmpty ? telegramGetters.loadChats() : null;

    // log(telegramDatas.chats.value.result!.length.toString());
  }
}
