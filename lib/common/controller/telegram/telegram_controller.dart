// ignore_for_file: avoid_print, constant_identifier_names

import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:telegram_client/telegram_client.dart';

import '../../class/telegram/author_state.dart';
import '../../class/telegram/update_option.dart';
import '../../routes/names.dart';
import '../connect/config/telegram/tdlib_config/config.dart';
import '../connect/tg_connect.dart';

class UpdateOptionState {
  static const updateOption = 'updateOption';
  static const updateAuthState = 'updateAuthorizationState';
  static const updateUser = 'updateUser';
  static const authentication_token = 'authentication_token';
  static const authorization_date = 'authorization_date';
  static const my_id = 'my_id';
  static const calls_enabled = 'calls_enabled';
  static const archive_and_mute_new_chats_from_unknown_users =
      'archive_and_mute_new_chats_from_unknown_users';
  static const ignore_sensitive_content_restrictions =
      'ignore_sensitive_content_restrictions';
  static const can_ignore_sensitive_content_restrictions =
      'can_ignore_sensitive_content_restrictions';
}

class AuthorizationStateType {
  static const waitTdlibParameters = 'authorizationStateWaitTdlibParameters';
  static const waitRegistration = 'authorizationStateWaitRegistration';
  static const loginOut = 'authorizationStateLoggingOut';
  static const closed = 'authorizationStateClosed';
  static const waitPhoneNumber = 'authorizationStateWaitPhoneNumber';
  static const waitEmailCode = 'authorizationStateWaitEmailCode';
  static const waitTelegramCode = 'authenticationCodeTypeTelegramMessage';
  static const waitSmsCode = 'authenticationCodeTypeSms';
  static const waitPhoneCallCode = 'authenticationCodeTypePhoneCall';
  static const waitQrCode = 'authorizationStateWaitQrCode';
  static const waitCode = 'authorizationStateWaitCode';
  static const waitPassword = 'authorizationStateWaitPassword';
  static const ready = 'authorizationStateReady';
}

class TelegramController extends GetxController {
  // late var registerController;
  final Tdlib tg = Get.put(GlobalConnectClass()).tg;
  final config = Get.put(TdlibConfig());
  void task() async {
    tg.on(tg.event_update, callback);
  }

  @override
  void onInit() {
    task();
    super.onInit();
  }

  void whenUpdateOption(Map<dynamic, dynamic> value) {
    final json = jsonEncode(value);
    UpdateOption updateOption = updateOptionFromJson(json);
    // switch(updateOption.name){
    //   case
    // }
  }

  Future<void> whenUpdateAuthorizationState(
      Map<dynamic, dynamic> value, UpdateTd updateTd) async {
    final json = jsonEncode(value);
    AuthorizationState authorizationState = authorizationStateFromJson(json);
    switch (authorizationState.authorizationState.type) {
      case AuthorizationStateType.waitTdlibParameters:
        await tg
            .request(
              "setTdlibParameters",
              parameters: updateTd.client_option.cast<String, dynamic>(),
              clientId: updateTd.client_id,
              isVoid: true,
              extra: 'Set parameters',
            )
            .then((value) => print(value))
            .catchError((onError) => print(onError));
        break;
      case AuthorizationStateType.waitPhoneNumber:
        Get.offAndToNamed(AppRoutes.welcome);
        break;
      case AuthorizationStateType.waitCode:
        Get.toNamed(AppRoutes.verifyPhoneNumber);
        break;
      case AuthorizationStateType.ready:
        if (Platform.isAndroid) {
          Get.toNamed(AppRoutes.androidHome);
        }
        break;
    }
  }

  void updateUser(Map<dynamic, dynamic> value, UpdateTd updateTd) {
    final json = jsonEncode(value);
  }

  dynamic callback(UpdateTd updateTd) async {
    Future(() async {
      if (kDebugMode) {
        print(jsonEncode(updateTd.raw));
      }
      final type = updateTd.raw["@type"];
      switch (type) {
        case UpdateOptionState.updateOption:
          whenUpdateOption(updateTd.raw);
          break;
        case UpdateOptionState.updateAuthState:
          whenUpdateAuthorizationState(updateTd.raw, updateTd);
          break;
        case UpdateOptionState.updateUser:
          updateUser(updateTd.raw, updateTd);
          break;
      }
      // final authorizationState = updateTd.raw["authorization_state"] ?? '';
      // var authStateType = updateTd.raw["authorization_state"]["@type"] ?? '';
      // if (updateTd.raw["@type"] == AuthorizationStateType.updateAuthState) {
      //   if (updateTd.raw["authorization_state"] is Map) {
      //     switch (updateTd.raw["authorization_state"]["@type"]) {
      //       case AuthorizationStateType.waitTdlibParameters:
      //         print('authorizationState');
      //         setTdlibParameters(updateTd);
      //         // await tg.initClient(updateTd,
      //         //     clientId: updateTd.client_id,
      //         //     tdlibParameters: updateTd.client_option,
      //         //     isVoid: true);
      //         break;
      //       case AuthorizationStateType.waitRegistration:
      //         break;
      //       case AuthorizationStateType.loginOut:
      //         break;
      //       case AuthorizationStateType.closed:
      //         break;
      //
      //       case AuthorizationStateType.waitPhoneNumber:
      //         break;
      //     }
      //   }
      // }
    });
  }
}
