import 'dart:io';

import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/controller/telegram/telegram_controller.dart';
import 'index.dart';

class AndroidGeneralPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AndroidGeneralPageController();
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
  @override
  void onInit() {
    super.onInit();
  }
}
