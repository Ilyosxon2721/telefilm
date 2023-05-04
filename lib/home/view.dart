// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../../../common/style/color.dart';
import 'index.dart';

class AndroidHomePage extends GetView<AndroidHomePageController> {
  const AndroidHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      print(controller.themeMode.value.name);
      print("theme ${controller.theme.value.name}");
      return PersistentTabView(
        context,
        controller: controller.controller,
        screens: controller.buildScreens(),
        items: controller.navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: controller.theme.value == Brightness.light
            ? AppColor.white
            : AppColor.black, // Default is Colors.white.
        handleAndroidBackButtonPress: true, // Default is true.
        resizeToAvoidBottomInset:
            true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        stateManagement: true, // Default is true.
        hideNavigationBarWhenKeyboardShows:
            true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        popAllScreensOnTapAnyTabs: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: controller.theme.value == Brightness.light
              ? AppColor.white
              : AppColor.black,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          // Navigation Bar's items animation properties.
          duration: Duration(milliseconds: 250),
          curve: Curves.linear,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          animateTabTransition: true,
          curve: Curves.linear,
          duration: Duration(milliseconds: 250),
        ),
        navBarStyle:
            NavBarStyle.style6, // Choose the nav bar style with this property.
      );
    });
  }
}
