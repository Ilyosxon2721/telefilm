import 'package:get/get.dart';

import 'controller.dart';

class AndroidSelectCountryPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidSelectCountryPageController>(
        () => AndroidSelectCountryPageController());
  }
}
