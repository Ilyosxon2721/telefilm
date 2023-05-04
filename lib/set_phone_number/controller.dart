import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../../common/getter/getter.dart';
import '../common/controller/telegram/telegram_controller.dart';
import 'index.dart';

class AndroidSetPhoneNumberPageController extends GetxController {
  AndroidSetPhoneNumberPageController();
  Rx<GlobalKey<FormState>> formKey = GlobalKey<FormState>().obs;
  final state = AndroidSetPhoneNumberPageState();
  Rx<TextEditingController> countryCodeController = TextEditingController(
          text: "+ ${telegramDatas.thisCountry.value.callingCodes[0]}")
      .obs;
  // Rx<TextEditingController> phoneNumberController =
  //     TextEditingController(text: '').obs;
  var phoneNumberController =
      MaskedTextController(mask: '000 00 000 00 00', text: '').obs;
  Rx<TextEditingController> countryController =
      TextEditingController(text: "Choose the country".tr).obs;
  final tg = Get.put(TelegramController());
  @override
  void onInit() {
    super.onInit();
  }
}
