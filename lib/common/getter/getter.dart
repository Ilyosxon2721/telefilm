import 'package:get/get.dart';
import 'package:telefilm/common/class/telegram/chat/download_file_class.dart';
import 'package:telefilm/common/controller/progres_controllers/telegram_progress.dart';

import '../api/data/user/user_datas.dart';
import '../api/service/services.dart';
import '../controller/functions/functions.dart';
import '../controller/login/login_controller.dart';
import '../controller/telegram/telegram_getters.dart';
import '../controller/telegram/telegram_send.dart';
import '../data/telegram/telegram_datas.dart';
import '../navbar/controller.dart';
import '../style/images.dart';
import '../style/theme.dart';

ImagesBox imagesBox = Get.put(ImagesBox());
ApiService apiService = Get.put(ApiService());
GlobalLoginController globalLoginController = Get.put(GlobalLoginController());
UserDatasController userDatasController = Get.put(UserDatasController());
TelegramDatas telegramDatas = Get.put(TelegramDatas());
DownloadFile downloadFile = Get.put(DownloadFile());
TelegramGetters telegramGetters = Get.put(TelegramGetters());
TelegramSend telegramSend = Get.put(TelegramSend());
Functions functions = Get.put(Functions());
PinPutThemes pinPutThemes = Get.put(PinPutThemes());
BottomNavBarControllerClass bottomNavBarControllerClass =
    Get.put(BottomNavBarControllerClass());
TelegramProgress telegramProgress = Get.put(TelegramProgress());
