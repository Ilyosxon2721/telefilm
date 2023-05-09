import 'package:get/get.dart';

import 'controller.dart';

class AndroidMainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidMainPageController>(() => AndroidMainPageController());
  }
}
