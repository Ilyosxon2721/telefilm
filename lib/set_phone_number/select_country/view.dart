// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:country_flags/country_flags.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../common/getter/getter.dart';
import '../../common/class/telegram/selected_country.dart';
import '../../common/style/color.dart';
import 'index.dart';

class AndroidSelectCountryPage
    extends GetView<AndroidSelectCountryPageController> {
  const AndroidSelectCountryPage({Key? key}) : super(key: key);

  Widget _buildSearchInput() {
    return TextField(
      controller: controller.searchInputController.value,
      decoration: InputDecoration(
        // labelText: "search".tr,
        hintText: "search".tr,
        filled: true,
        fillColor: Colors.transparent,
      ),
      onChanged: (value) {
        controller.countryResults.clear();
        for (var country in telegramDatas.countries.value.countries) {
          if (country.name.toUpperCase().contains(value.toUpperCase()) ||
              country.englishName.toUpperCase().contains(value.toUpperCase()) ||
              country.countryCode.toUpperCase().contains(value.toUpperCase()) ||
              country.callingCodes.contains(value)) {
            controller.countryResults.add(country);
            print(country.toJson());
          }
        }
      },
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: AppColor.scaffoldBackground,
      foregroundColor: AppColor.primaryText,
      title: controller.isShowSearch.value
          ? _buildSearchInput()
          : Text(
              'choose_a_country'.tr,
            ),
      leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new)),
      actions: [
        IconButton(
          onPressed: () {
            controller.isShowSearch.value = !controller.isShowSearch.value;
            controller.countryResults.clear();
            controller.searchInputController.value.text = '';
          },

          // onPressed: () => Get.put(ShowSearchPanel()).showSearchScreen(),
          icon: Icon(
            controller.isShowSearch.value ? Icons.close : Icons.search,
          ),
        ),
      ],
    );
  }

  Widget _buildList() {
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: telegramDatas.countries.value.countries.length,
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              print(jsonEncode(
                  telegramDatas.countries.value.countries[index].toJson()));
              final json = jsonEncode(
                  telegramDatas.countries.value.countries[index].toJson());
              ThisCountry result = thisCountryFromJson(json);
              telegramDatas.thisCountry.value = result;
              Get.back();
            },
            leading: CountryFlags.flag(
              telegramDatas.countries.value.countries[index].countryCode,
              height: 25,
              width: 25,
            ),
            title: Text(
              telegramDatas.countries.value.countries[index].name,
            ),
            subtitle: Text(
                telegramDatas.countries.value.countries[index].countryCode),
            trailing: Text(
              '+${telegramDatas.countries.value.countries[index].callingCodes}',
              style: const TextStyle(color: Colors.blue),
            ),
          );
        });
  }

  Widget _buildSearchList() {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemCount: controller.countryResults.length,
      itemBuilder: (context, index) {
        return ListTile(
          onTap: () {
            print(jsonEncode(controller.countryResults[index].toJson()));
            final json = jsonEncode(controller.countryResults[index].toJson());
            ThisCountry result = thisCountryFromJson(json);
            telegramDatas.thisCountry.value = result;
            Get.back();
          },
          leading: CountryFlags.flag(
            controller.countryResults[index].countryCode,
            height: 25,
            width: 25,
          ),
          title: Text(
            controller.countryResults[index].name,
          ),
          subtitle: Text(controller.countryResults[index].countryCode),
          trailing: Text(
            '+${controller.countryResults[index].callingCodes}',
            style: const TextStyle(color: Colors.blue),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          backgroundColor: AppColor.scaffoldBackground,
          appBar: _buildAppBar(),
          body:
              controller.isShowSearch.value ? _buildSearchList() : _buildList(),
        );
      },
    );
  }
}
