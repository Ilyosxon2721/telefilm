import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../main/view.dart';
import 'index.dart';

class AndroidHomePageController extends GetxController
    with GetSingleTickerProviderStateMixin {
  AndroidHomePageController();
  Rx<Brightness> themeMode = Get.theme.brightness.obs;
  Rx<Brightness> theme =
      SchedulerBinding.instance.window.platformBrightness.obs;

  PersistentTabController controller = PersistentTabController(initialIndex: 0);

  List<Widget> buildScreens() {
    return [
      const AndroidMainPage(),
      const Center(child: Text('Second')),
      const Center(child: Text('Three')),
      const Center(child: Text('Four')),
      const Center(child: Text('Five')),
    ];
  }

  List<PersistentBottomNavBarItem> navBarsItems() {
    Color activeIconColor = themeMode.value == Brightness.light
        ? CupertinoColors.black
        : CupertinoColors.white;

    return [
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.home),
        title: ("Home"),
        activeColorPrimary: activeIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.square_list),
        title: ("Catalog"),
        activeColorPrimary: activeIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.archivebox),
        title: ("Basket"),
        activeColorPrimary: activeIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.heart),
        title: ("Favorites"),
        activeColorPrimary: activeIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(CupertinoIcons.person),
        title: ("Profile"),
        activeColorPrimary: activeIconColor,
        inactiveColorPrimary: CupertinoColors.systemGrey,
      ),
    ];
  }

  final state = AndroidHomePageState();

  @override
  void onInit() {
    Timer(const Duration(milliseconds: 250), () {
      print(Get.theme.brightness);
      themeMode.value = Get.theme.brightness;
      theme.value = SchedulerBinding.instance.window.platformBrightness;
    });
    super.onInit();
  }

  @override
  void onReady() {
    Timer(const Duration(milliseconds: 250), () {
      print(Get.theme.brightness);
      themeMode.value = Get.theme.brightness;
      theme.value = SchedulerBinding.instance.window.platformBrightness;
    });
    super.onReady();
  }
}
