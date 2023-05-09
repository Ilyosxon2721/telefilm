import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../../class/telegram/selected_country.dart';
import '../../getter/getter.dart';

class Functions extends GetxController {
  void editPhoneNumberInputFunction(controller, String value) {
    if (value.isNotEmpty) {
      for (var country in telegramDatas.countries.value.countries) {
        if (country.callingCodes.contains(value)) {
          final json = jsonEncode(country.toJson());
          ThisCountry result = thisCountryFromJson(json);
          telegramDatas.thisCountry.value = result;
          controller.phoneNumberController.value
              .updateMask(telegramDatas.masks[0][country.countryCode]);
        }
      }
    }
  }

  Future<void> showLoading() {
    final light = EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.spinningCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.grey
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.grey
      ..textColor = Colors.black
      ..maskColor = Colors.transparent.withOpacity(0.2)
      ..userInteractions = true
      ..dismissOnTap = false;
    final dark = EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.spinningCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white60
      ..backgroundColor = Colors.black
      ..indicatorColor = Colors.white60
      ..textColor = Colors.white60
      ..maskColor = Colors.transparent.withOpacity(0.2)
      ..userInteractions = true
      ..dismissOnTap = false;
    Get.theme.brightness == Brightness.light ? light : dark;
    // ..customAnimation = CustomAnimation();
    return EasyLoading.show(
      maskType: EasyLoadingMaskType.custom,
      dismissOnTap: false,
      indicator: const CupertinoActivityIndicator(
        radius: 25.0,
      ),
    );
  }
}
