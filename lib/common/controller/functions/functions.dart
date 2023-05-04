import 'dart:convert';

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
}
