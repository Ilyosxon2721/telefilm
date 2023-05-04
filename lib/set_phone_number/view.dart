// ignore_for_file: prefer_const_constructors

import 'package:country_flags/country_flags.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common/style/color.dart';
import '../common/getter/getter.dart';
import '../common/routes/names.dart';
import 'index.dart';

class AndroidSetPhoneNumberPage
    extends GetView<AndroidSetPhoneNumberPageController> {
  const AndroidSetPhoneNumberPage({Key? key}) : super(key: key);

  Widget _buildIcon() {
    return Center(
      child: Image.asset(
        imagesBox.phone,
        width: 250.w,
      ),
    );
  }

  Widget _buildHeader() {
    return Center(
      child: Text(
        "Set Phone Number",
        style: GoogleFonts.courgette(
          fontSize: 40.sp,
          fontWeight: FontWeight.bold,
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

  Widget _buildPhoneNumberTextField() {
    return Obx(() {
      return TextFormField(
        controller: controller.phoneNumberController.value,
        onChanged: (value) {
          functions.editPhoneNumberInputFunction(controller, value);
        },
        onTap: () {},
        keyboardType: TextInputType.phone,
        decoration: InputDecoration(
          prefixText: "+",
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          labelText: 'phone'.tr,
        ),
        validator: (value) {
          if (value != null) {
            if (value.length ==
                controller.phoneNumberController.value.text.length) {
              return '';
            }
          }
          return null;
        },
        maxLines: 1,
        // maxLength: controller.phoneNumberController.value.mask.length,
      );
    });
  }

  _buildDialog(
    context,
  ) {
    return Get.defaultDialog(
      barrierDismissible: false,
      title: 'correctNumber?'.tr,
      content: Text(
        "+ ${controller.phoneNumberController.value.text}",
        textAlign: TextAlign.start,
      ),
      radius: 15,
      cancel: Container(
        width: MediaQuery.of(context).size.width / 4,
        alignment: Alignment.centerLeft,
        child: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Edit'.tr),
        ),
      ),
      confirm: Container(
          width: MediaQuery.of(context).size.width / 4,
          alignment: Alignment.centerRight,
          child: TextButton(
              onPressed: () {
                telegramSend.setAuthenticationPhoneNumber(controller
                    .phoneNumberController.value.text
                    .replaceAll(' ', ''));
              },
              child: Text('Yes'.tr))),
      onConfirm: () {
        if (kDebugMode) {
          print("confirm");
        }
      },
      onCancel: () {
        if (kDebugMode) {
          print('OnCancel');
        }
      },
    );
  }

  Widget _buildSubmitButton(context) {
    return ElevatedButton(
      onPressed: () {
        // if (!controller.formKey.value.currentState!.validate()) {
        //   _buildDialog(context);
        // }
        _buildDialog(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Get.theme.brightness == Brightness.light
            ? AppColor.black
            : AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        minimumSize: Size(MediaQuery.of(context).size.width - 30.w, 40.h),
        fixedSize: Size(MediaQuery.of(context).size.width - 30.w, 40.h),
        maximumSize: Size(MediaQuery.of(context).size.width - 30.w, 40.h),
      ),
      child: Text(
        "Continue".tr,
        style: GoogleFonts.amaranth(
          fontSize: 25.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: controller.formKey.value,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildIcon(),
                _buildHeader(),
                _buildSelectCountryButton(),
                _buildPhoneNumberTextField(),
                _buildSubmitButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
