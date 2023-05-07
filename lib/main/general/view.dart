// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:telefilm/common/getter/getter.dart';

import '../../common/class/telegram/chat/chat_histories/chat_history_class.dart'
    as history;
import '../../common/class/telegram/chats.dart';
import '../content_info/view.dart';
import 'index.dart';

class AndroidGeneralPage extends GetView<AndroidGeneralPageController> {
  const AndroidGeneralPage({Key? key}) : super(key: key);
  Future<File> channelPhoto(history.Message message) async {
    await telegramGetters.getSupergroupFullInfo(
      int.parse(
        message.chatId.toString().substring(4),
      ),
    );
    String path = telegramDatas
            .superGroupFullInfo.value.photo?.sizes?.first.photo?.local?.path ??
        '';
    int photoId =
        telegramDatas.superGroupFullInfo.value.photo?.sizes?.first.photo?.id;
    File file = path != ''
        ? File(path)
        : await telegramGetters.getFile(photoId, 1, 1, 0, true);
    return File(path);
  }

  // void getChannelPhoto(int index) async {
  //   final controller = Get.put(AndroidGeneralPageController());
  //   await telegramGetters
  //       .getSupergroupFullInfo(
  //     int.parse(
  //       telegramDatas.chatHistoryVideos[index].chatId.toString().substring(4),
  //     ),
  //   )
  //       .then((value) {
  //     String path = telegramDatas.superGroupFullInfo.value.photo?.sizes?.first
  //             .photo?.local?.path ??
  //         '';
  //     if (path != '') {
  //       controller.photo.value = File(path);
  //     } else {
  //       int photoId = telegramDatas
  //           .superGroupFullInfo.value.photo?.sizes?.first.photo?.id;
  //       telegramGetters
  //           .getFile(
  //             photoId,
  //             1,
  //             1,
  //             0,
  //             true,
  //           )
  //           .then((value) => controller.photo.value = value);
  //     }
  //   });
  // }

  void getPostPhoto() async {
    final controller = Get.put(AndroidGeneralPageController());
    int contentLength = telegramDatas.chatHistoryVideos.length;
    for (var index = 0; index < contentLength; index++) {
      int photoId = telegramDatas
              .chatHistoryVideos[index].content?.video?.thumbnail?.file?.id ??
          0;
      String path = telegramDatas.chatHistoryVideos[index].content?.video
              ?.thumbnail?.file?.local?.path ??
          '';

      if (path == '') {
        if (photoId != 0) {
          telegramGetters
              .getFile(
            photoId,
            1,
            1,
            0,
            true,
          )
              .then((value) {
            controller.post.add(value);
          });
        }
      } else {
        controller.post.add(File(path));
      }
    }
  }

  void getPostVideo(int index) async {
    final controller = Get.put(AndroidGeneralPageController());
    int fileId =
        telegramDatas.chatHistoryVideos[index].content?.video?.video?.id;
    String path = telegramDatas
            .chatHistoryVideos[index].content?.video?.video?.local?.path ??
        '';

    if (path == '') {
      if (fileId != 0) {
        telegramGetters
            .getFile(
              fileId,
              1,
              1,
              0,
              true,
            )
            .then((value) => controller.post.add(value));
      }
    } else {
      controller.post.add(File(path));
    }
  }

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

  Widget _buildHeaderForPost(
      int index, history.Message message, channel, String date) {
    return ListTile(
      leading: Container(
        width: 40.w,
        height: 35.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.all(0.5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: FutureBuilder(
                future: channelPhoto(message),
                builder: (BuildContext context, AsyncSnapshot file) {
                  final photo = file.data;
                  return photo != null
                      ? Image.file(
                          photo,
                          fit: BoxFit.fill,
                        )
                      : Image.asset(
                          imagesBox.brandLogoFull,
                          fit: BoxFit.fill,
                        );
                }),
            // child: GetX<AndroidGeneralPageController>(
            //   init: AndroidGeneralPageController(),
            //   initState: (_) async {
            //     getChannelPhoto(index);
            //   },
            //   builder: (logic) {
            //     return Image.file(
            //       photo,
            //       fit: BoxFit.fill,
            //     );
            //   },
            // ),
          ),
        ),
      ),
      title: Text(
        message.content?.caption?.text ?? '',
        maxLines: 1,
      ),
      subtitle: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            channel?.first.username ?? '',
            maxLines: 1,
            overflow: TextOverflow.clip,
          ),
          Text(
              '${message.interactionInfo?.viewCount ?? 0} views - added $date'),
        ],
      ),
      trailing: InkWell(
        onTap: () {},
        child: Icon(Icons.more_vert_rounded),
      ),
    );
  }

  Widget _buildPost(BuildContext context, int index, history.Message message) {
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
    final videoDownloadedSize =
        message.content?.video?.video?.local?.downloadedSize ?? 0;
    final videoFileSize = message.content?.video?.video?.size ?? 0;
    return GetX<AndroidGeneralPageController>(
      init: AndroidGeneralPageController(),
      initState: (_) {},
      builder: (logic) {
        return GestureDetector(
          key: GlobalKey(),
          onTap: () {
            PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
              context,
              settings: RouteSettings(arguments: {
                "heroTag": "contentImage",
                "imageIndex": "${logic.post[index]}",
              }),
              screen: AndroidContentInfoPage(),
              withNavBar: true,
              pageTransitionAnimation: PageTransitionAnimation.rotate,
            );
          },
          // onTap: () => Get.toNamed(AppRoutes.contentInfo,
          //     arguments: ["contentImage"]),
          child: logic.post.isNotEmpty
              ? Hero(
                  tag: "contentImage",
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: photoFile.path != ''
                            ? Image.file(
                                photoFile,
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                                imagesBox.brandLogoFull,
                                width: MediaQuery.of(context).size.width,
                                height: 250,
                                fit: BoxFit.fill,
                              ),
                      ),
                      Padding(
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
                                    videoDownload(message,
                                        message.content?.video?.video?.id);
                                  },
                                  icon: videoDownloadedSize > 0 &&
                                          videoDownloadedSize < videoFileSize
                                      ? CircularProgressIndicator()
                                      : Icon(
                                          videoPath == ''
                                              ? CupertinoIcons
                                                  .cloud_download_fill
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                  // child: PageStorage(
                  //   bucket: PageStorageBucket(),
                  //   child: CarouselSlider.builder(
                  //     itemCount: controller.post.length,
                  //     carouselController: controller.carouselController,
                  //     itemBuilder: (BuildContext context, int itemIndex,
                  //             int pageViewIndex) =>
                  //         Card(
                  //       child: Image.file(
                  //         controller.post[itemIndex],
                  //         width: MediaQuery.of(context).size.width,
                  //         height: 108.h,
                  //         fit: BoxFit.fill,
                  //       ),
                  //     ),
                  //     options: CarouselOptions(
                  //       height: 250,
                  //       aspectRatio: 16 / 9,
                  //       viewportFraction: 1,
                  //       initialPage: 0,
                  //       enableInfiniteScroll: true,
                  //       reverse: false,
                  //       autoPlay: false,
                  //       autoPlayInterval: Duration(seconds: 3),
                  //       autoPlayAnimationDuration: Duration(milliseconds: 800),
                  //       autoPlayCurve: Curves.fastOutSlowIn,
                  //       enlargeCenterPage: true,
                  //       enlargeFactor: 0.3,
                  //       onPageChanged: (index, value) {
                  //         controller.currentImageIndexList[index] = index;
                  //       },
                  //       scrollDirection: Axis.horizontal,
                  //     ),
                  //   ),
                  // ),
                )
              : Container(
                  child: Center(
                    child: Text("Image not found"),
                  ),
                ),
        );
      },
    );
  }

  PageStorage _buildContent(context, int contentIndex) {
    Iterable<Result>? channel = telegramDatas.chats.value.result?.where(
        (element) =>
            element.id == telegramDatas.chatHistoryVideos[contentIndex].chatId);
    history.Message message = telegramDatas.chatHistoryVideos[contentIndex];

    final date = DateFormat('dd/MM/yyyy - hh:mm')
        .format(DateTime.fromMillisecondsSinceEpoch(
      message.date * 1000,
    ));

    return PageStorage(
      bucket: PageStorageBucket(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 270.h,
        child: Column(
          children: [
            _buildPost(context, contentIndex, message),
            _buildHeaderForPost(contentIndex, message, channel, date),
          ],
        ),
      ),
    );
  }

  Widget _buildMultiSliver(context) {
    return MultiSliver(
      children: [
        // _buildHistoryPanel(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: telegramDatas.chatHistoryVideos.length,
            (context, index) {
              print("Index $index");
              return _buildContent(context, index);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    getPostPhoto();
    return PageStorage(
        bucket: PageStorageBucket(), child: _buildMultiSliver(context));
  }
}
