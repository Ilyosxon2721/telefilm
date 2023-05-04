// ignore_for_file: prefer_const_constructors

import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import '../common/getter/getter.dart';
import '../common/routes/names.dart';
import 'index.dart';

class AndroidVerifyPhoneNumberPage
    extends GetView<AndroidVerifyPhoneNumberPageController> {
  const AndroidVerifyPhoneNumberPage({Key? key}) : super(key: key);

  Widget _buildIcon() {
    return Center(
      child: Image.asset(
        imagesBox.phoneSms,
        width: 250.w,
      ),
    );
  }

  Widget _buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(right: 10, left: 10),
      child: Center(
        child: Column(
          children: [
            Text(
              'telegramVerify'.tr,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'telegramVerifySub'.trParams(
                {
                  'number': telegramDatas.verifyPhoneNumberData.value
                      .authorizationState.codeInfo.phoneNumber
                },
              ),
              style: TextStyle(),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPinPut() {
    return Center(
      child: SizedBox(
        width: 250.w,
        child: Pinput(
          defaultPinTheme: pinPutThemes.defaultPinTheme,
          focusedPinTheme: pinPutThemes.focusedPinTheme,
          submittedPinTheme: pinPutThemes.submittedPinTheme,
          errorPinTheme: pinPutThemes.errorPinTheme,
          senderPhoneNumber: telegramDatas.verifyPhoneNumberData.value
              .authorizationState.codeInfo.phoneNumber,
          pinAnimationType: PinAnimationType.fade,
          pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
          androidSmsAutofillMethod: AndroidSmsAutofillMethod.none,
          smsCodeMatcher: PinputConstants.defaultSmsCodeMatcher,
          listenForMultipleSmsOnAndroid: false,
          controller: controller.pinPutController,
          length: 5,
          onCompleted: (value) {
            telegramSend.checkAuthenticationCode(value);
            // telegramController
            //     .checkAuthenticationCode(value)
            //     .then((value) {
            //   if (kDebugMode) {
            //     print('value: $value');
            //   }
            // });
          },
        ),
      ),
    );
  }

  Widget _buildSelectCountryButton() {
    return Obx(() {
      return OutlinedButton(
        onPressed: () {
          Get.toNamed(AppRoutes.selectCountry);
        },
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            side: const BorderSide(color: Colors.grey)),
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: ListTile(
            leading: telegramDatas.thisCountry.value.countryCode.isNotEmpty
                ? CountryFlags.flag(
                    telegramDatas.thisCountry.value.countryCode,
                    height: 25,
                    width: 25,
                  )
                : null,
            title: Text(
              telegramDatas.thisCountry.value.name,
              style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 25,
              color: Colors.grey,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIcon(),
              _buildHeader(),
              _buildPinPut(),
            ],
          ),
        ),
      ),
    );
  }
}
