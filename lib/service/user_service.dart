// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../model/result_user.dart';

class UserService {
  Future<ResultUser> loginAPI(String email, String password) async {
    try {
      var params = {"email": email, "password": password};
      var response = await Dio().post(
        'http://192.168.1.20:8080/auth/login',
        data: jsonEncode(params),
        options: Options(headers: {
          'Accept': '*/*',
          'Content-Type': 'application/json',
          'Accept-Encoding': 'Accept-Encoding',
        }),
      );
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
}
