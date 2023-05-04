import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';

import 'color.dart';

class PinPutThemes extends GetxController {
  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: const Color.fromRGBO(234, 239, 243, 1)),
      borderRadius: BorderRadius.circular(12),
    ),
  );
  late PinTheme focusedPinTheme;
  late PinTheme submittedPinTheme;
  late PinTheme errorPinTheme;
  PinPutThemes() {
    focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(234, 239, 243, 1),
      ),
    );
    errorPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: const Color.fromRGBO(243, 12, 12, 1.0),
      ),
    );
  }
}

class AppTheme {
  static const horizontalMargin = 16.0;
  static const radius = 10.0;

  static ThemeData light = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: AppColor.scaffoldBackground,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primaryColor: AppColor.accentColor,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColor.accentColor,
      ),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: AppColor.primaryText,
        ),
        titleTextStyle: TextStyle(
          color: AppColor.primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
        toolbarTextStyle: TextStyle(
          color: AppColor.primaryText,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.scaffoldBackground,
        unselectedLabelStyle: TextStyle(fontSize: 12),
        selectedLabelStyle: TextStyle(fontSize: 12),
        unselectedItemColor: Color(0xffA2A5B9),
        selectedItemColor: AppColor.accentColor,
      ),
      tabBarTheme: const TabBarTheme(
        indicatorSize: TabBarIndicatorSize.label,
        labelColor: AppColor.accentColor,
        unselectedLabelColor: AppColor.secondaryText,
      ),
      inputDecorationTheme:
          const InputDecorationTheme(labelStyle: TextStyle()));
}
