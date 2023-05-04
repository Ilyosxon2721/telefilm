// ignore_for_file: avoid_print, invalid_return_type_for_catch_error

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../common/routes/names.dart';
import '../common/getter/getter.dart';
import '../common/style/color.dart';
import 'index.dart';

class AndroidWelcomePage extends GetView<AndroidWelcomePageController> {
  const AndroidWelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Center(
                child: Text(
                  "TeleFilm",
                  style: GoogleFonts.courgette(
                    fontSize: 50.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  telegramGetters.getCountries().then((value) {
                    Get.toNamed(AppRoutes.setPhoneNumber);
                  }).catchError((onError) => print(onError));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Get.theme.brightness == Brightness.light
                      ? AppColor.black
                      : AppColor.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  minimumSize:
                      Size(MediaQuery.of(context).size.width - 30.w, 40.h),
                  fixedSize:
                      Size(MediaQuery.of(context).size.width - 30.w, 40.h),
                  maximumSize:
                      Size(MediaQuery.of(context).size.width - 30.w, 40.h),
                ),
                child: Text(
                  "Continue".tr,
                  style: GoogleFonts.amaranth(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
