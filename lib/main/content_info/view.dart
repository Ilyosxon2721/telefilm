// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:telefilm/common/class/telegram/chat/chat_histories/chat_history_class.dart'
    as history;

import '../../common/getter/getter.dart';
import 'controller.dart';

class AndroidContentInfoPage extends GetView<AndroidContentInfoPageController> {
  const AndroidContentInfoPage({
    Key? key,
  }) : super(key: key);
  void videoDownload(history.Message message, int fileId) {
    String path = message.content?.video?.video?.local?.path ?? '';
    if (path == '') {
      telegramGetters.getFile(
        fileId,
        1,
        1,
        0,
        true,
      );
    }
  }

  Widget _buildVideoPlayerWidget(
      BuildContext context, File video, history.Message message) {
    double videoWith =
        double.parse(message.content?.video?.width.toString() ?? '0');
    double videoHeight =
        double.parse(message.content?.video?.height.toString() ?? '0');
    controller.setVideoController(video);
    return SizedBox(
        width: videoWith != 0 ? videoWith : MediaQuery.of(context).size.width,
        height:
            videoHeight != 0 ? videoHeight : MediaQuery.of(context).size.height,
        child: Chewie(controller: controller.chewieController.value));
  }

  Widget _buildVideoContent(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    history.Message message = data['message'] as history.Message;
    final controller = Get.put(AndroidContentInfoPageController());
    final duration = Duration(seconds: message.content?.video?.duration)
        .toString()
        .split('.')[0]
        .padLeft(8, '0');

    const math = 0.00000095367432;
    double bytes = message.content?.video?.video?.size * math;
    final fileSize = bytes.roundToDouble().toString();
    final photoPath =
        message.content?.video?.thumbnail?.file?.local?.path ?? '';
    final photoFile = File(photoPath);
    final videoPath = message.content?.video?.video?.local?.path ?? '';
    final videoFile = File(videoPath);
    final videoFileId = message.content?.video?.video?.id;
    final videoDownloadedSize =
        message.content?.video?.video?.local?.downloadedSize ?? 0;
    final videoFileSize = message.content?.video?.video?.size ?? 0;
    final updateFileId = telegramDatas.updateFile.value.file?.id;
    final downloadSize =
        (telegramDatas.updateFile.value.file?.local?.downloadedSize ??
                0.0 * math)
            .roundToDouble()
            .toString();
    return Hero(
      tag: "$data['heroTag']",
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: [
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: videoPath != ''
                ? _buildVideoPlayerWidget(context, videoFile, message)
                : photoFile.path != ''
                    ? Image.file(
                        photoFile,
                        width: message.content?.photo?.minithumbnail?.width ??
                            MediaQuery.of(context).size.width,
                        height: message.content?.photo?.minithumbnail?.height ??
                            MediaQuery.of(context).size.width,
                        fit: BoxFit.cover,
                      )
                    : Image.asset(
                        imagesBox.brandLogoFull,
                        width: MediaQuery.of(context).size.width,
                        height: 250,
                        fit: BoxFit.fill,
                      ),
          ),
          videoPath != ''
              ? Container()
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white30,
                    ),
                    width: 120.w,
                    height: 40.h,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            onPressed: () {
                              videoPath != ''
                                  ? null
                                  : videoDownload(message,
                                      message.content?.video?.video?.id);
                            },
                            icon: videoDownloadedSize > 0 &&
                                    videoDownloadedSize < videoFileSize
                                ? updateFileId == videoFileId
                                    ? Text(downloadSize)
                                    : CircularProgressIndicator()
                                : Icon(
                                    videoPath == ''
                                        ? CupertinoIcons.cloud_download_fill
                                        : CupertinoIcons.play_fill,
                                  ),
                          ),
                        ),
                        VerticalDivider(),
                        Expanded(
                          flex: 2,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(duration),
                                Text("$fileSize MB"),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Column(
      children: [_buildVideoContent(context)],
    );
  }

  AppBar _buildAppBar() {
    return AppBar();
  }

  @override
  Widget build(BuildContext context) {
    // final data = Get.arguments;

    return Scaffold(
      appBar: _buildAppBar(),
      body: SafeArea(child: _buildContent(context)),
    );
  }
}
