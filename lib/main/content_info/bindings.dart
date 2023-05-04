import 'package:get/get.dart';

import 'controller.dart';

class AndroidContentInfoPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidContentInfoPageController>(
        () => AndroidContentInfoPageController());
  }
}
