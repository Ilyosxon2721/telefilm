import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/controller/connect/tg_connect.dart';
import 'common/language/language.dart';
import 'common/routes/names.dart';
import 'common/routes/pages.dart';
import 'common/style/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final tgConfig = Get.put(GlobalConnectClass());
  tgConfig.tg.init();
  tgConfig.tg.initIsolate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'TeleShop',
          translations: Languages(),
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('ru', 'RU'),
          darkTheme: ThemeData.dark().copyWith(
            scaffoldBackgroundColor: AppColor.black,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColor.black,
              foregroundColor: AppColor.white,
              elevation: 0,
              scrolledUnderElevation: 1,
              surfaceTintColor: Colors.white,
              iconTheme: IconThemeData(
                size: 15.sp,
                fill: 1.0,
                color: AppColor.white,
              ),
              actionsIconTheme: IconThemeData(
                size: 15.sp,
                fill: 1.0,
                color: AppColor.white,
              ),
              toolbarTextStyle: const TextStyle(
                color: AppColor.white,
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
              ),
            ),
            applyElevationOverlayColor: true,
            tabBarTheme: TabBarTheme(
                indicator: BoxDecoration(
                    color: AppColor.darkInputIconColor,
                    borderRadius: BorderRadius.circular(10.0)),
                dividerColor: AppColor.darkInputIconColor,
                labelColor: AppColor.white,
                unselectedLabelColor: AppColor.white),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              backgroundColor: AppColor.black,
              elevation: 10,
              selectedIconTheme: IconThemeData(color: AppColor.white),
              unselectedIconTheme:
                  IconThemeData(color: AppColor.darkInputIconColor),
              selectedLabelStyle:
                  TextStyle(color: AppColor.darkInputLabelColor),
              unselectedLabelStyle:
                  TextStyle(color: AppColor.darkInputLabelColor),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
            ),
          ),
          theme: ThemeData.light().copyWith(
            scaffoldBackgroundColor: AppColor.white,
            appBarTheme: AppBarTheme(
              backgroundColor: AppColor.white,
              foregroundColor: AppColor.black,
              elevation: 0,
              scrolledUnderElevation: 1,
              surfaceTintColor: Colors.black,
              iconTheme: IconThemeData(
                size: 15.sp,
                fill: 1.0,
                color: AppColor.black,
              ),
              actionsIconTheme: IconThemeData(
                size: 15.sp,
                fill: 1.0,
                color: AppColor.black,
              ),
              toolbarTextStyle: const TextStyle(
                color: AppColor.black,
              ),
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.light,
              ),
            ),
            applyElevationOverlayColor: true,
            tabBarTheme: TabBarTheme(
                indicator: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(10.0)),
                dividerColor: AppColor.lightInputIconColor,
                labelColor: AppColor.black,
                unselectedLabelColor: AppColor.black),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
              backgroundColor: AppColor.white,
              elevation: 10,
              selectedIconTheme: IconThemeData(color: AppColor.black),
              unselectedIconTheme:
                  IconThemeData(color: AppColor.lightInputIconColor),
              selectedLabelStyle: TextStyle(color: AppColor.white),
              unselectedLabelStyle:
                  TextStyle(color: AppColor.lightInputLabelColor),
              showSelectedLabels: false,
              showUnselectedLabels: false,
              type: BottomNavigationBarType.fixed,
            ),
          ),
          themeMode: ThemeMode.system,
          initialRoute: AppRoutes.initial,
          getPages: AppPages.routes,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
