import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/color.dart';
import 'controller.dart';

Widget buildBottomNavBar() {
  final controller = Get.put(BottomNavBarControllerClass());
  assert(controller.buildBody.length == controller.menuItemList.length);
  return Container(
    decoration: const BoxDecoration(color: Colors.grey),
    child: Padding(
      padding: const EdgeInsets.only(top: 0.5),
      child: BottomNavigationBar(
        elevation: 10,
        fixedColor: Get.theme.brightness == Brightness.light
            ? AppColor.black
            : AppColor.white,
        items: controller.menuItemList,
        currentIndex: controller.index.value,
        onTap: (index) {
          controller.index.value = index;
        },
      ),
    ),
  );
}
