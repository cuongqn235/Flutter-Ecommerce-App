// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/result_profile.dart';
import '../model/result_user.dart';
import '../values/app_url.dart';

class UserService {
  Future<ResultUser> loginAPI(String email, String password) async {
    try {
      var params = {"email": email, "password": password};
      var response = await Dio().post(
        '${AppURL.appURL}api/auth/login',
        data: jsonEncode(params),
        options: Options(headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Accept-Encoding': 'Accept-Encoding',
        }),
      );
      await save(response.data['data']['accessToken']);
      return ResultUser.fromJson(response.data);
    } on DioError catch (e) {
      var error = e.response;
      if (error != null) {
        return ResultUser.fromJson(error.data);
      } else {
        return ResultUser();
      }
    }
  }

  Future<int> forgotPass(String email) async {
    try {
      var params = {"recipientEmail": email};
      final response = await Dio().post(
          '${AppURL.appURL}api/user/forgot_password',
          data: jsonEncode(params));
      int temp = response.data['errorCode'];
      return temp;
    } on DioError catch (e) {
      return 406001;
    }
  }

  Future<ResultProfile> getProfile(String token) async {
    final response = await Dio().get('${AppURL.appURL}api/user/whoami',
        options: Options(headers: {"Authorization": "Bearer $token"}));
    return ResultProfile.fromJson(response.data);
  }

  Future<void> save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('token', token);
  }

  Future<String> read() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }
}
