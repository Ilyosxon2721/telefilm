import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../common/controller/telegram/telegram_controller.dart';
import 'index.dart';

class AndroidGeneralPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AndroidGeneralPageController();
  Rx<ChewieController> chewieController = ChewieController(
          videoPlayerController: VideoPlayerController.file(File('')))
      .obs;
  final isProcessing = false.obs;
  RxInt currentImageIndex = 0.obs;
  List currentImageIndexList = [].obs;
  Rx<File> photo = File('').obs;
  Rx<File> video = File('').obs;
  RxList<File> post = <File>[].obs;

  final CarouselController carouselController = CarouselController();
  final scrollController = ScrollController();
  List imagePaths = [
    'assets/images/test.jpg',
    'assets/images/test1.jpg',
    'assets/images/test2.jpg',
    'assets/images/test3.jpg'
  ];
  RxInt currentTabIndex = 0.obs;
  final state = AndroidMGeneralPageState();
  var searchInputController = TextEditingController();
  final tg = Get.put(TelegramController());
  void setVideoController(File video) {
    chewieController.value = ChewieController(
        videoPlayerController: VideoPlayerController.file(video),
        aspectRatio: 3 / 2,
        autoInitialize: true,
        autoPlay: false,
        looping: false,
        errorBuilder: (context, errorMessage) {
          return Center(
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.white),
            ),
          );
        });
  }

  @override
  void onInit() {
    super.onInit();
  }

  // @override
  // void dispose() {
  //   chewieController.value.dispose();
  //   super.dispose();
  // }
}
