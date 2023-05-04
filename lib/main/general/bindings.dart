import 'package:get/get.dart';

import 'controller.dart';

class AndroidGeneralPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidGeneralPageController>(
        () => AndroidGeneralPageController());
  }
}
