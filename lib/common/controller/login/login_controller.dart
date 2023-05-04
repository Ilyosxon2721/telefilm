import 'package:get/get.dart';

class GlobalLoginController extends GetxController {
  RxBool processed = false.obs;
  RxBool isError = false.obs;
  RxBool isSuccess = false.obs;
  RxString errorText = ''.obs;
}
