// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:telefilm/common/getter/getter.dart';

import '../content_info/view.dart';
import 'index.dart';

class AndroidGeneralPage extends GetView<AndroidGeneralPageController> {
  const AndroidGeneralPage({Key? key}) : super(key: key);

  Widget _buildContent(context, int contentIndex) {
    final controller = Get.put(AndroidGeneralPageController());
    return PageStorage(
      bucket: PageStorageBucket(),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 270.h,
        child: Column(
          children: [
            GestureDetector(
              key: GlobalKey(),
              onTap: () {
                PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
                  context,
                  settings: RouteSettings(arguments: {
                    "heroTag": "contentImage$contentIndex",
                    "imageIndex":
                        "${controller.currentImageIndexList[contentIndex]}",
                  }),
                  screen: AndroidContentInfoPage(),
                  withNavBar: true,
                  pageTransitionAnimation: PageTransitionAnimation.rotate,
                );
              },
              // onTap: () => Get.toNamed(AppRoutes.contentInfo,
              //     arguments: ["contentImage$contentIndex"]),
              child: Hero(
                tag: "contentImage$contentIndex",
                child: PageStorage(
                  bucket: PageStorageBucket(),
                  child: CarouselSlider.builder(
                    itemCount: controller.imagePaths.length,
                    carouselController: controller.carouselController,
                    itemBuilder: (BuildContext context, int itemIndex,
                            int pageViewIndex) =>
                        Card(
                      child: Image.asset(
                        controller.imagePaths[itemIndex],
                        width: MediaQuery.of(context).size.width,
                        height: 200.h,
                        fit: BoxFit.fill,
                      ),
                    ),
                    options: CarouselOptions(
                      height: 250,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: false,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, value) {
                        controller.currentImageIndexList[contentIndex] = index;
                      },
                      scrollDirection: Axis.horizontal,
                    ),
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Container(
                width: 35.w,
                height: 35.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/images/test.jpg',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              title: Text(
                telegramDatas.chatHistory.value.messages?[contentIndex].content
                        ?.caption?.text ??
                    '',
                maxLines: 1,
              ),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    telegramDatas.chats.value.result![0].username ?? '',
                    maxLines: 1,
                    overflow: TextOverflow.clip,
                  ),
                  Text('120 views - last monday'),
                  // Text(telegramDatas.chats.value.result![0].usernames!
                  //     .activeUsernames!.first),
                ],
              ),
              trailing: InkWell(
                onTap: () {},
                child: Icon(Icons.more_vert_rounded),
              ),
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         InkWell(
            //           onTap: () {},
            //           child: Icon(
            //             CupertinoIcons.heart,
            //             size: 25.sp,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10.w,
            //         ),
            //         InkWell(
            //           onTap: () {},
            //           child: Icon(
            //             CupertinoIcons.chat_bubble,
            //             size: 25.sp,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 10.w,
            //         ),
            //         InkWell(
            //           onTap: () {},
            //           child: Icon(
            //             Icons.send_outlined,
            //             size: 25.sp,
            //           ),
            //         ),
            //       ],
            //     ),
            //     Row(
            //       mainAxisAlignment: MainAxisAlignment.center,
            //       children:
            //           controller.imagePaths.asMap().entries.map((entry) {
            //         return GestureDetector(
            //           onTap: () => controller.carouselController
            //               .animateToPage(entry.key),
            //           child: Obx(() {
            //             return Container(
            //               width: 8.0,
            //               height: 8.0,
            //               margin: EdgeInsets.symmetric(
            //                   vertical: 8.0, horizontal: 4.0),
            //               decoration: BoxDecoration(
            //                   shape: BoxShape.circle,
            //                   color: (Theme.of(context).brightness ==
            //                               Brightness.dark
            //                           ? Colors.white
            //                           : Colors.black)
            //                       .withOpacity(
            //                           controller.currentImageIndexList[
            //                                       contentIndex] ==
            //                                   entry.key
            //                               ? 0.9
            //                               : 0.4)),
            //             );
            //           }),
            //         );
            //       }).toList(),
            //     ),
            //     TextButton(
            //       onPressed: () {},
            //       child: Text(
            //         'Add to basket',
            //         style: TextStyle(fontSize: 15),
            //       ),
            //     ),
            //   ],
            // ),
            // RichText(
            //   maxLines: 2,
            //   text: TextSpan(
            //     text: "other.group",
            //     style: TextStyle(fontWeight: FontWeight.bold),
            //     children: const [
            //       TextSpan(
            //         text:
            //             " 223 000 sum Обратите внимание, что я поместил гибкую над отступом, потому что, когда текст увеличивался, отступ также ломал экран. Было бы бесполезно помещать его только в Text . Надеюсь это поможет.",
            //         spellOut: false,
            //         style: TextStyle(
            //           fontWeight: FontWeight.w400,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget _buildMultiSliver(context) {
    final controller = Get.put(AndroidGeneralPageController());

    return MultiSliver(
      children: [
        // _buildHistoryPanel(),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            childCount: telegramDatas.chatHistoryVideos.value.length,
            (context, index) {
              return _buildContent(context, index);
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageStorage(
        bucket: PageStorageBucket(), child: _buildMultiSliver(context));
  }
}
