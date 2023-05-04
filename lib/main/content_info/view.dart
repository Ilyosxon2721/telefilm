// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../common/controller/functions/hide_and_show_app_bar_title.dart';
import '../../common/style/color.dart';
import 'controller.dart';

class AndroidContentInfoPage extends GetView<AndroidContentInfoPageController> {
  const AndroidContentInfoPage({
    Key? key,
  }) : super(key: key);

  SliverAppBar _buildAppBar(BuildContext context) {
    final data =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final controller = Get.put(AndroidContentInfoPageController());
    controller.currentImageIndex.value = int.parse(data['imageIndex'] ?? "0");
    return SliverAppBar(
      // title: Text(
      //   'Briggs',
      //   style: GoogleFonts.abel(fontWeight: FontWeight.w500, fontSize: 25.sp),
      // ),
      title: SliverAppBarTitleStatus(
        child: Text('Some Name'),
      ),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            backgroundColor: Get.theme.brightness == Brightness.light
                ? AppColor.white
                : AppColor.black,
            foregroundColor: Get.theme.brightness == Brightness.light
                ? AppColor.black
                : AppColor.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(8.0),
            fixedSize: Size(
              25.w,
              25.h,
            ),
            maximumSize: Size(
              25.w,
              25.h,
            ),
            minimumSize: Size(
              25.w,
              25.h,
            ),
          ),
          child: Center(
            child: Icon(
              CupertinoIcons.arrow_left,
              color: Colors.transparent.withAlpha(150),
              size: 22.w,
            ),
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Get.theme.brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              foregroundColor: Get.theme.brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8.0),
              fixedSize: Size(
                35.w,
                35.h,
              ),
              maximumSize: Size(
                35.w,
                35.h,
              ),
              minimumSize: Size(
                35.w,
                35.h,
              ),
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.search,
                color: Colors.transparent.withAlpha(150),
                size: 22.w,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Get.theme.brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
              foregroundColor: Get.theme.brightness == Brightness.light
                  ? AppColor.black
                  : AppColor.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8.0),
              fixedSize: Size(
                35.w,
                35.h,
              ),
              maximumSize: Size(
                35.w,
                35.h,
              ),
              minimumSize: Size(
                35.w,
                35.h,
              ),
            ),
            child: Center(
              child: Icon(
                CupertinoIcons.share_up,
                color: Colors.transparent.withAlpha(150),
                size: 22.w,
              ),
            ),
          ),
        )
      ],
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      snap: false,
      elevation: 0,
      // foregroundColor: AppColor.black,
      // backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Hero(
          tag: "${data['heroTag']}",
          child: CarouselSlider.builder(
            key: GlobalKey(),
            itemCount: controller.imagePaths.length,
            carouselController: controller.carouselController,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) =>
                    Image.asset(
              controller.imagePaths[itemIndex],
              width: MediaQuery.of(context).size.width,
              height: 300,
              fit: BoxFit.fill,
            ),
            options: CarouselOptions(
              height: 300,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: int.parse(data['imageIndex'] ?? "0"),
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: false,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              onPageChanged: (index, value) {
                // controller.currentImageIndexList[index] = index;
              },
              scrollDirection: Axis.horizontal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNameContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Briggs',
              style: GoogleFonts.abel(
                  fontWeight: FontWeight.w500, fontSize: 25.sp),
            ),
            Text(
              'Кроссовки',
              style: GoogleFonts.abel(fontSize: 18.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceContent() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '15 000.00',
              style: GoogleFonts.abel(
                  fontWeight: FontWeight.bold, fontSize: 20.sp),
            ),
            Text(
              'сум',
              style: GoogleFonts.abel(fontSize: 15.sp),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSizeContent(context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          height: 60.h,
          width: MediaQuery.of(context).size.width - 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(flex: 1, child: Text("RUS")),
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: controller.sizes.length,
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return GestureDetector(
                            onTap: () {
                              controller.selectedSizeIndex.value = index;
                            },
                            child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Card(
                                elevation: 3.0,
                                color: Get.theme.brightness == Brightness.light
                                    ? controller.selectedSizeIndex.value ==
                                            index
                                        ? AppColor.black
                                        : AppColor.white
                                    : controller.selectedSizeIndex.value ==
                                            index
                                        ? AppColor.white
                                        : AppColor.black,
                                child: Center(
                                  child: Text(
                                    controller.sizes[index].toString(),
                                    style: TextStyle(
                                      color: Get.theme.brightness ==
                                              Brightness.light
                                          ? controller.selectedSizeIndex
                                                      .value ==
                                                  index
                                              ? AppColor.white
                                              : AppColor.black
                                          : controller.selectedSizeIndex
                                                      .value ==
                                                  index
                                              ? AppColor.black
                                              : AppColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                      }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLinkToSizesTableContent() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Sizes Table',
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToBasketButton(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 10.0, top: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.brightness == Brightness.light
                    ? AppColor.black
                    : AppColor.white,
                foregroundColor: Get.theme.brightness == Brightness.dark
                    ? AppColor.white
                    : AppColor.black,
                maximumSize:
                    Size(MediaQuery.of(context).size.width - 70.w, 40.h),
                fixedSize: Size(MediaQuery.of(context).size.width - 70.w, 40.h),
                minimumSize:
                    Size(MediaQuery.of(context).size.width - 70.w, 40.h)),
            onPressed: () {},
            child: Text(
              'Add to basket',
              style: TextStyle(
                color: Get.theme.brightness == Brightness.light
                    ? AppColor.white
                    : AppColor.black,
                fontSize: 18.sp,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Get.theme.brightness == Brightness.light
                    ? AppColor.black
                    : AppColor.white,
                foregroundColor: Get.theme.brightness == Brightness.dark
                    ? AppColor.white
                    : AppColor.black,
                maximumSize: Size(50.w, 40.h),
                fixedSize: Size(50.w, 40.h),
                minimumSize: Size(50.w, 40.h)),
            onPressed: () {},
            child: Icon(
              Icons.favorite_border,
              color: Get.theme.brightness == Brightness.light
                  ? AppColor.white
                  : AppColor.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddToFavoriteAndShareButtons() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          CupertinoIcons.heart,
                          size: 25.sp,
                        ),
                        Text(
                          'Add to Favorite',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 5.0.w),
                          child: Icon(
                            CupertinoIcons.share_up,
                            size: 25.sp,
                          ),
                        ),
                        Text(
                          'Share',
                          style: TextStyle(fontSize: 18.sp),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextForGetCity() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 40.h,
          child: RichText(
            text: TextSpan(
              text: 'Set your city for taxi.',
              style: TextStyle(color: Colors.black, fontSize: 18),
              children: <TextSpan>[
                TextSpan(
                    text: ' Get city',
                    style: TextStyle(color: Colors.blueAccent, fontSize: 18),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        // navigate to desired screen
                      })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildScrollView(BuildContext context) {
    final controller = Get.put(AndroidContentInfoPageController());
    return CustomScrollView(
      controller: controller.scrollController,
      physics: BouncingScrollPhysics(),
      slivers: [
        _buildAppBar(context),
        _buildNameContent(),
        _buildPriceContent(),
        _buildSizeContent(context),
        _buildLinkToSizesTableContent(),
        _buildAddToFavoriteAndShareButtons(),
        _buildTextForGetCity(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // final data = Get.arguments;

    return Scaffold(
      body: SafeArea(child: _buildScrollView(context)),
      bottomSheet: _buildAddToBasketButton(context),
    );
  }
}
