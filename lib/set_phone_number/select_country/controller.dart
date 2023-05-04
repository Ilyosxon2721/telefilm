import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../common/class/telegram/countries.dart';
import 'index.dart';

class AndroidSelectCountryPageController extends GetxController {
  AndroidSelectCountryPageController();
  final state = AndroidSelectCountryPageState();
  Rx<TextEditingController> searchInputController = TextEditingController().obs;
  RxBool isShowSearch = false.obs;
  RxList<Country> countryResults = <Country>[].obs;
  @override
  void onInit() {
    super.onInit();
  }
}
