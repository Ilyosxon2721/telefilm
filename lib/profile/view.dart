// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class AndroidProfilePage extends GetView<AndroidProfilePageController> {
  const AndroidProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Text("Chats"),
      )),
    );
  }
}
