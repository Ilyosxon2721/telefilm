import 'package:get/get.dart';

import 'controller.dart';

class AndroidVerifyPhoneNumberPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AndroidVerifyPhoneNumberPageController>(
        () => AndroidVerifyPhoneNumberPageController());
  }
}
