import 'package:get/get.dart';

import 'file_manager.dart';

class FileManagerController extends GetxController {
  late String _text;

  String get text => _text;
  readText() async {
    _text = await FileManager().readTextFile();
  }

  writeText(String value) async {
    _text = await FileManager().writeTextFile(value);
  }
}
