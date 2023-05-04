import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../main/view.dart';

class BottomNavBarControllerClass extends GetxController {
  RxInt index = 0.obs;
  List<BottomNavigationBarItem> menuItemList = <BottomNavigationBarItem>[
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.home), label: 'Home'.tr),
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.square_list), label: 'Catalog'.tr),
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.archivebox), label: 'Basket'.tr),
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.heart), label: 'Favorites'.tr),
    BottomNavigationBarItem(
        icon: const Icon(CupertinoIcons.person), label: 'Profile'.tr),
  ];

  List<Widget> buildBody = <Widget>[
    const AndroidMainPage(),
    const AndroidMainPage(),
    const AndroidMainPage(),
    const AndroidMainPage(),
  ];
}
