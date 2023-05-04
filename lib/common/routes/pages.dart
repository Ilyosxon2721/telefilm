import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefilm/home/index.dart';

import '../../initial/index.dart';
import '../../main/index.dart';
import '../../set_phone_number/bindings.dart';
import '../../set_phone_number/select_country/index.dart';
import '../../set_phone_number/view.dart';
import '../../verify/index.dart';
import '../../welcome/bindings.dart';
import '../../welcome/view.dart';
import 'routes.dart';

class AppPages {
  static const initial = AppRoutes.initial;
  static const home = AppRoutes.home;
  static const androidHome = AppRoutes.androidHome;
  static const welcome = AppRoutes.welcome;
  static const setPhoneNumber = AppRoutes.setPhoneNumber;
  static const selectCountry = AppRoutes.selectCountry;
  static const verifyPhoneNumber = AppRoutes.verifyPhoneNumber;
  static const main = AppRoutes.main;
  static const contentInfo = AppRoutes.contentInfo;
  static final RouteObserver<Route> observer = RouteObservers();
  static List<String> history = [];

  static final List<GetPage> routes = [
    // about boot up the app
    GetPage(
      name: initial,
      page: () => const InitialPage(),
      binding: InitialBinding(),
      transition: Transition.size,
      transitionDuration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.bounceIn,
      popGesture: true,
    ),
    GetPage(
      name: androidHome,
      page: () => const AndroidHomePage(),
      binding: AndroidHomePageBinding(),
      transition: Transition.size,
      transitionDuration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.bounceIn,
      popGesture: true,
    ),
    GetPage(
      name: welcome,
      page: () => const AndroidWelcomePage(),
      binding: AndroidWelcomePageBinding(),
      transition: Transition.size,
      transitionDuration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.bounceIn,
      popGesture: true,
    ),
    GetPage(
      name: setPhoneNumber,
      page: () => const AndroidSetPhoneNumberPage(),
      binding: AndroidSetPhoneNumberPageBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.linearToEaseOut,
      popGesture: true,
    ),
    GetPage(
      name: selectCountry,
      page: () => const AndroidSelectCountryPage(),
      binding: AndroidSelectCountryPageBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.linearToEaseOut,
      popGesture: true,
    ),
    GetPage(
      name: verifyPhoneNumber,
      page: () => const AndroidVerifyPhoneNumberPage(),
      binding: AndroidVerifyPhoneNumberPageBinding(),
      transition: Transition.rightToLeftWithFade,
      transitionDuration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.linearToEaseOut,
      popGesture: true,
    ),
    GetPage(
      name: main,
      page: () => const AndroidMainPage(),
      binding: AndroidMainPageBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(
        milliseconds: 250,
      ),
      curve: Curves.linearToEaseOut,
      popGesture: true,
    ),
    // GetPage(
    //   name: contentInfo,
    //   page: () => const AndroidContentInfoPage(),
    //   binding: AndroidContentInfoPageBinding(),
    //   participatesInRootNavigator: true,
    //   showCupertinoParallax: true,
    //   transition: Transition.native,
    //   transitionDuration: const Duration(
    //     milliseconds: 1000,
    //   ),
    //   curve: Curves.easeInOutBack,
    //   popGesture: true,
    // ),
  ];
}
