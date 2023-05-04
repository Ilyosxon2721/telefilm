import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileManager {
  // static late FileManager _instance;
  //
  // FileManager._internal() {
  //   _instance = this;
  // }
  // factory FileManager() => _instance ?? FileManager._internal();

  Future<String?> get _directoryPath async {
    Directory? directory = await getExternalStorageDirectory();
    return directory?.path;
  }

  Future<File> get _file async {
    final path = await _directoryPath;
    return File('$path/cheetah.txt');
  }

  readTextFile() async {
    String fileContent = "Cheetah Coding";
    File file = await _file;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
      }
      return fileContent;
    }
  }

  writeTextFile(String text) async {
    // String text = DateFormat('h:mm:ss').format(DateTime.now());
    File file = await _file;
    await file.writeAsString(text);
    return text;
  }

  readJsonFile() async {
    String fileContent = "Cheetah Coding";
    File file = await _file;

    if (await file.exists()) {
      try {
        fileContent = await file.readAsString();
      } catch (e) {
        print(e);
      }
      return fileContent;
    }
  }

  writeJsonFile(String text) async {
    // String text = DateFormat('h:mm:ss').format(DateTime.now());
    File file = await _file;
    await file.writeAsString(text);
    return text;
  }
}
