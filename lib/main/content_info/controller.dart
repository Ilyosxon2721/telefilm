import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/controller/telegram/telegram_controller.dart';
import 'index.dart';

class AndroidContentInfoPageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AndroidContentInfoPageController();
  final state = AndroidContentInfoPageState();
  final isProcessing = false.obs;
  RxInt currentImageIndex = 0.obs;
  RxInt selectedSizeIndex = 0.obs;
  List currentImageIndexList = [].obs;
  final CarouselController carouselController = CarouselController();
  final scrollController = ScrollController();
  List imagePaths = [
    'assets/images/test.jpg',
    'assets/images/test1.jpg',
    'assets/images/test2.jpg',
    'assets/images/test3.jpg'
  ];
  List sizes = [
    35,
    36,
    37,
    38,
    39,
    40,
    41,
    42,
    43,
    44,
  ];
  final tg = Get.put(TelegramController());
  @override
  void onInit() {
    super.onInit();
  }
}
