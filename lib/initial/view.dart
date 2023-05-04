import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common/controller/telegram/telegram_controller.dart';
import '../common/style/color.dart';
import 'index.dart';

class InitialPage extends GetView<InitialController> {
  const InitialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tg = Get.put(TelegramController());
    print(tg.tg.client_id);
    return const Scaffold(
        backgroundColor: AppColors.primarySecondaryBackground,
        body: Center(
          child: CircularProgressIndicator(),
        ));
  }
}
