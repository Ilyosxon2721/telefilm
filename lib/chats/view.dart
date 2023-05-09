// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telefilm/common/getter/getter.dart';

import 'index.dart';

class AndroidChatsPage extends GetView<AndroidChatsPageController> {
  const AndroidChatsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: telegramDatas.channels.length,
          itemBuilder: (BuildContext context, index) {
            return ListTile(
              title: Text(
                telegramDatas
                        .channels[index].usernames?.activeUsernames?.first ??
                    'None',
              ),
            );
          },
        ),
      ),
    );
  }
}
