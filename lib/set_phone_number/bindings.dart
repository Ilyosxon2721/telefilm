import 'package:get/get.dart';

import 'controller.dart';

class AndroidSetPhoneNumberPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidSetPhoneNumberPageController>(
        () => AndroidSetPhoneNumberPageController());
  }
}
