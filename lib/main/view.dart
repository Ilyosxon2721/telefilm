// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../common/getter/getter.dart';
import '../common/style/color.dart';
import 'general/view.dart';
import 'index.dart';

class AndroidMainPage extends GetView<AndroidMainPageController> {
  const AndroidMainPage({Key? key}) : super(key: key);
  Future<void> _getData() async {
    final controller = Get.put(AndroidMainPageController());
    controller.isProcessing.value = true;

    Timer(const Duration(milliseconds: 250), () {
      controller.getContent();

      controller.isProcessing.value = false;
    });
  }

  Future<void> showLoading() {
    final light = EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.spinningCircle
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.grey
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.grey
      ..textColor = Colors.black
      ..maskColor = Colors.transparent.withOpacity(0.2)
      ..userInteractions = true
      ..dismissOnTap = false;
    final dark = EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.spinningCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.white60
      ..backgroundColor = Colors.black
      ..indicatorColor = Colors.white60
      ..textColor = Colors.white60
      ..maskColor = Colors.transparent.withOpacity(0.2)
      ..userInteractions = true
      ..dismissOnTap = false;
    Get.theme.brightness == Brightness.light ? light : dark;
    // ..customAnimation = CustomAnimation();
    return EasyLoading.show(
      maskType: EasyLoadingMaskType.custom,
      dismissOnTap: false,
      indicator: CupertinoActivityIndicator(
        radius: 25.0,
      ),
    );
  }

  SliverAppBar _buildAppBar() {
    final controller = Get.put(AndroidMainPageController());
    return SliverAppBar(
      title: InkWell(
        onTap: () {
          // String val = "-1001628060608";
          // print(val.substring(4));
          controller.getContent();
        },
        child: Text(
          "TeleFilm",
          style: GoogleFonts.courgette(
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(top: 8.0.h, bottom: 8.0.h, left: 8.0.w),
          child: SizedBox(
            width: 220.w,
            height: 150.h,
            child: TextFormField(
              controller: controller.searchInputController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8)),
                labelStyle: TextStyle(
                  color: Get.theme.brightness == Brightness.light
                      ? AppColor.lightInputLabelColor
                      : AppColor.darkInputLabelColor,
                  fontSize: 15.sp,
                ),
                hintStyle: TextStyle(
                  color: Get.theme.brightness == Brightness.light
                      ? AppColor.lightInputLabelColor
                      : AppColor.darkInputLabelColor,
                  fontSize: 15.sp,
                ),
                prefixIconColor: Get.theme.brightness == Brightness.light
                    ? AppColor.lightInputIconColor
                    : AppColor.darkInputIconColor,
                suffixIconColor: Get.theme.brightness == Brightness.light
                    ? AppColor.lightInputIconColor
                    : AppColor.darkInputIconColor,
                isCollapsed: true,
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 0, vertical: 5.h),
                alignLabelWithHint: true,
                hintText: 'Search'.tr,
                hintTextDirection: TextDirection.ltr,
                filled: true,
                prefixIconConstraints: BoxConstraints(
                  minWidth: 30.w,
                  minHeight: 30.h,
                  maxWidth: 50.w,
                  maxHeight: 70.h,
                ),
                prefixIcon: Icon(
                  CupertinoIcons.search,
                  size: 22.sp,
                ),

                // isDense: true,
                // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              ),
            ),
          ),
        )
      ],
      elevation: 0,
    );
  }

  Widget _buildCustomScrollView() {
    final controller = Get.put(AndroidMainPageController());
    return Obx(
      () {
        print(
            "Chat History Total Count ${telegramDatas.chatHistory.value.totalCount}");
        controller.isProcessing.value
            ? showLoading()
            : EasyLoading.dismiss(animation: true);
        return RefreshIndicator(
          strokeWidth: 4,
          displacement: 40.0,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () => _getData(),
          child: CustomScrollView(
            controller: controller.scrollController,
            physics: BouncingScrollPhysics(),
            slivers: [
              _buildAppBar(),
              telegramDatas.chatHistory.value.totalCount != null &&
                      telegramDatas.chatHistory.value.totalCount != 0 &&
                      telegramDatas.chats.value.result!.isNotEmpty
                  ? AndroidGeneralPage()
                  : SliverToBoxAdapter(
                      child: Center(
                        child: Text("Content not found"),
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildCustomScrollView(),
      ),
    );
  }
}
// class AndroidMainPage extends GetView<AndroidMainPageController> {
//   const AndroidMainPage({Key? key}) : super(key: key);
//
//   SliverAppBar _buildAppBar() {
//     final controller = Get.put(AndroidMainPageController());
//     return SliverAppBar(
//       title: Text(
//         "TeleShop",
//         style: GoogleFonts.courgette(
//           fontSize: 25.sp,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//       actions: [
//         Padding(
//           padding: EdgeInsets.only(top: 8.0.h, bottom: 8.0.h, left: 8.0.w),
//           child: ElevatedButton(
//             onPressed: () {
//               telegramGetters.loadChats().whenComplete(() {
//                 final length = telegramDatas.chats.value.result?.length;
//                 if (length != null) {
//                   for (var i = 0; i > length; i++) {
//                     print(telegramDatas.chats.value.result?[i].type);
//                   }
//                 } else {
//                   print("is null");
//                 }
//               });
//             },
//             style: ElevatedButton.styleFrom(
//               // backgroundColor: AppColor.black,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10),
//                   bottomLeft: Radius.circular(10),
//                 ),
//               ),
//             ),
//             child: Row(
//               children: const [Text('Premium'), Icon(Icons.arrow_forward)],
//             ),
//           ),
//         )
//       ],
//       expandedHeight: 180.0,
//       floating: true,
//       pinned: true,
//       snap: true,
//       elevation: 0,
//       // foregroundColor: AppColor.black,
//       // backgroundColor: Colors.white,
//       flexibleSpace: FlexibleSpaceBar(
//         centerTitle: true,
//         title: Padding(
//           padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w, bottom: 30.0.h),
//           child: TextFormField(
//             controller: controller.searchInputController,
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                   borderSide: BorderSide.none,
//                   borderRadius: BorderRadius.circular(8)),
//               labelStyle: TextStyle(
//                 color: Get.theme.brightness == Brightness.light
//                     ? AppColor.lightInputLabelColor
//                     : AppColor.darkInputLabelColor,
//                 fontSize: 12.sp,
//               ),
//               hintStyle: TextStyle(
//                 color: Get.theme.brightness == Brightness.light
//                     ? AppColor.lightInputLabelColor
//                     : AppColor.darkInputLabelColor,
//                 fontSize: 12.sp,
//               ),
//               prefixIconColor: Get.theme.brightness == Brightness.light
//                   ? AppColor.lightInputIconColor
//                   : AppColor.darkInputIconColor,
//               suffixIconColor: Get.theme.brightness == Brightness.light
//                   ? AppColor.lightInputIconColor
//                   : AppColor.darkInputIconColor,
//               isCollapsed: true,
//               isDense: true,
//               contentPadding:
//                   EdgeInsets.symmetric(horizontal: 0, vertical: 5.h),
//
//               // label: Text('Tovar, Brand or articul'),
//               alignLabelWithHint: true,
//               hintText: 'Tovar, Brand or articul',
//               filled: true,
//               prefixIconConstraints: BoxConstraints(
//                 minWidth: 30,
//                 minHeight: 30,
//                 maxWidth: 50,
//                 maxHeight: 50,
//               ),
//               prefixIcon: Icon(
//                 CupertinoIcons.search,
//                 size: 15,
//               ),
//               suffixIcon: Icon(
//                 CupertinoIcons.camera_viewfinder,
//                 size: 15,
//               ),
//               suffixIconConstraints: BoxConstraints(
//                 minWidth: 30,
//                 minHeight: 30,
//                 maxWidth: 50,
//                 maxHeight: 50,
//               ),
//               // isDense: true,
//               // contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
//             ),
//           ),
//         ),
//       ),
//       bottom: PreferredSize(
//         preferredSize: Size.fromHeight(50.h),
//         child: Padding(
//           padding: EdgeInsets.only(right: 8.0.w, left: 8.0.w),
//           child: Container(
//             height: 35.h,
//             decoration: BoxDecoration(
//               color: Get.theme.brightness == Brightness.dark
//                   ? Colors.white12
//                   : Colors.black12,
//               borderRadius: BorderRadius.circular(
//                 10.0,
//               ),
//             ),
//             child: TabBar(
//               onTap: (index) {
//                 controller.currentTabIndex.value = index;
//               },
//               isScrollable: false,
//               physics: const BouncingScrollPhysics(),
//               padding: EdgeInsets.all(5.0),
//               controller: controller.tabController.value,
//               tabs: controller.tabs,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Future<void> _getData() async {
//     final controller = Get.put(AndroidMainPageController());
//     controller.isProcessing.value = true;
//     Timer(const Duration(seconds: 2),
//         () => controller.isProcessing.value = false);
//   }
//
//   Future<void> showLoading() {
//     final light = EasyLoading.instance
//       ..displayDuration = const Duration(milliseconds: 2000)
//       ..indicatorType = EasyLoadingIndicatorType.spinningCircle
//       ..loadingStyle = EasyLoadingStyle.light
//       ..indicatorSize = 45.0
//       ..radius = 10.0
//       ..progressColor = Colors.grey
//       ..backgroundColor = Colors.white
//       ..indicatorColor = Colors.grey
//       ..textColor = Colors.black
//       ..maskColor = Colors.transparent.withOpacity(0.2)
//       ..userInteractions = true
//       ..dismissOnTap = false;
//     final dark = EasyLoading.instance
//       ..displayDuration = const Duration(milliseconds: 2000)
//       ..indicatorType = EasyLoadingIndicatorType.spinningCircle
//       ..loadingStyle = EasyLoadingStyle.dark
//       ..indicatorSize = 45.0
//       ..radius = 10.0
//       ..progressColor = Colors.white60
//       ..backgroundColor = Colors.black
//       ..indicatorColor = Colors.white60
//       ..textColor = Colors.white60
//       ..maskColor = Colors.transparent.withOpacity(0.2)
//       ..userInteractions = true
//       ..dismissOnTap = false;
//     Get.theme.brightness == Brightness.light ? light : dark;
//     // ..customAnimation = CustomAnimation();
//     return EasyLoading.show(
//       maskType: EasyLoadingMaskType.custom,
//       dismissOnTap: false,
//       indicator: CupertinoActivityIndicator(
//         radius: 25.0,
//       ),
//     );
//   }
//
//   Widget _buildCustomScrollView() {
//     final controller = Get.put(AndroidMainPageController());
//     return Obx(
//       () {
//         controller.isProcessing.value
//             ? showLoading()
//             : EasyLoading.dismiss(animation: true);
//         return RefreshIndicator(
//           strokeWidth: 4,
//           displacement: 40.0,
//           triggerMode: RefreshIndicatorTriggerMode.anywhere,
//           onRefresh: () => _getData(),
//           child: CustomScrollView(
//             controller: controller.scrollController,
//             physics: BouncingScrollPhysics(),
//             slivers: [
//               _buildAppBar(),
//               controller.currentTabIndex.value == 0
//                   ? AndroidMainWomenPage()
//                   : controller.currentTabIndex.value == 1
//                       ? SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             (context, index) => Text(
//                               "$index Man",
//                             ),
//                           ),
//                         )
//                       : SliverList(
//                           delegate: SliverChildBuilderDelegate(
//                             (context, index) => Text(
//                               "$index Children",
//                             ),
//                           ),
//                         ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () {
//         final controller = Get.put(AndroidMainPageController());
//         return Scaffold(
//           body: SafeArea(
//             child: DefaultTabController(
//               length: controller.tabs.length,
//               animationDuration: Duration(milliseconds: 250),
//               child: _buildCustomScrollView(),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
