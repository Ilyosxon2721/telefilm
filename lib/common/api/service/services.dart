import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants/api_constants.dart';

class ApiService {
  Future login(String login, String psw) async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginEndpoint);
      print(url);
      final msg = jsonEncode({"login": login, "password": psw});
      Map<String, String> headers = {
        "Content-Type": "application/json; charset=UTF-8",
      };
      var response = await http.post(
        url,
        body: msg,
        headers: headers,
      );

      return response;
    } catch (e) {
      log(e.toString());
    }
  }
}
