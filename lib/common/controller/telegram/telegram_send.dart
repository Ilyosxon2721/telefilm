// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telegram_client/tdlib/tdlib.dart';

import '../../class/telegram/verify_phone_number_data.dart';
import '../../class/telegram/wrong_phone_number.dart';
import '../../getter/getter.dart';
import '../../routes/names.dart';
import '../connect/tg_connect.dart';

class TelegramSend extends GetxController {
  final Tdlib tg = Get.put(GlobalConnectClass()).tg;

  Future<void> setAuthenticationPhoneNumber(phoneNumber) async {
    await tg
        .request(
      "setAuthenticationPhoneNumber",
      parameters: {
        "phone_number": phoneNumber,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'setAuthenticationPhoneNumber',
    )
        .then((value) {
      final json = jsonEncode(value);
      print(json);
      VerifyPhoneNumberData verifyPhoneNumberData =
          verifyPhoneNumberDataFromJson(json);
      telegramDatas.verifyPhoneNumberData.value = verifyPhoneNumberData;
      Get.toNamed(AppRoutes.verifyPhoneNumber);
    }).catchError((onError) {
      if (onError != null) {
        WrongPhoneNumber wrongPhoneNumber =
            wrongPhoneNumberFromJson(jsonEncode(onError));
        print(wrongPhoneNumber.message.tr);
        Get.back();
        Get.defaultDialog(
          barrierDismissible: false,
          title: wrongPhoneNumber.type.tr,
          middleText: wrongPhoneNumber.message.tr,
          cancel: Container(
            alignment: Alignment.center,
            child: TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text('Edit'.tr),
            ),
          ),
        );
      }
      // Get.dialog(Text('Wrong Phone Number!'.tr));
    });
  }

  Future<void> checkAuthenticationCode(code) async {
    await tg
        .request(
      "checkAuthenticationCode",
      parameters: {
        "code": code,
      },
      clientId: tg.client_id,
      isVoid: true,
      extra: 'checkAuthenticationCode',
    )
        .then((value) {
      final json = jsonEncode(value);
      print(json);
      // VerifyPhoneNumberData verifyPhoneNumberData =
      //     verifyPhoneNumberDataFromJson(json);
      // telegramDatas.verifyPhoneNumberData.value = verifyPhoneNumberData;
      // Get.toNamed(AppRoutes.verifyPhoneNumber);
    }).catchError((onError) {
      final json = jsonEncode(onError);
      print(json);
      if (onError != null) {
        // WrongPhoneNumber wrongPhoneNumber =
        //     wrongPhoneNumberFromJson(jsonEncode(onError));
        // print(wrongPhoneNumber.message.tr);
        // Get.back();
        // Get.defaultDialog(
        //   barrierDismissible: false,
        //   title: wrongPhoneNumber.type.tr,
        //   middleText: wrongPhoneNumber.message.tr,
        //   cancel: Container(
        //     alignment: Alignment.center,
        //     child: TextButton(
        //       onPressed: () {
        //         Get.back();
        //       },
        //       child: Text('Edit'.tr),
        //     ),
        //   ),
        // );
      }
      // Get.dialog(Text('Wrong Phone Number!'.tr));
    });
  }
}
