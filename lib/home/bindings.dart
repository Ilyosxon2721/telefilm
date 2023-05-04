import 'package:get/get.dart';

import 'controller.dart';

class AndroidHomePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidHomePageController>(() => AndroidHomePageController());
  }
}
