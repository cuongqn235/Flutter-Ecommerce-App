import 'dart:convert';

import 'package:bandongho/model/profile.dart';
import 'package:bandongho/model/user.dart';
import 'package:bandongho/service/api_client.dart';
import 'package:bandongho/service/api_response.dart';
import 'package:bandongho/service/user_service.dart';
import 'package:bandongho/utils/local_storage_utils.dart';
import 'package:flutter/cupertino.dart';

import '../enum/auth.dart';
import '../values/app_url.dart';

enum UserState { init, loading, success, error }

class UserProvider with ChangeNotifier {
  User _user = User();
  Profile _profile = Profile();
  bool loading = false;
  int _errorCode = 0;
  String? _message;
  Auth check = Auth.Unauthorized;

  User get resultUser => _user;
  Profile get profile => _profile;
  int get errorCode => _errorCode;
  String? get getMessage => _message;
  void setMessage(String? message) {
    _message = message;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    loading = true;
    notifyListeners();
    var params = {"email": email, "password": password};
    ApiClient apiClient = ApiClient();
    ApiResponse response =
        await apiClient.request(url: AppURL.login, data: jsonEncode(params));

    await Future.delayed(const Duration(seconds: 1));
    if (response.errorCode == 200) {
      User temp = User.fromJson(response.data);
      await saveToken(temp.accessToken);
      _user = temp;
      _errorCode = 200;
    } else {
      setMessage(response.message);
    }
    loading = false;
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    loading = true;
    notifyListeners();
    int code = await UserService().forgotPass(email);
    loading = false;
    //_code = code;
    notifyListeners();
  }

  Future<void> checkLogin() async {
    String token = await readToken();
    check = await UserService().checkToken(token);
    notifyListeners();
  }

  Future<String> getToken() async {
    String token = await UserService().read();
    return token;
  }

  Future<String> signOut() async {
    loading = true;
    notifyListeners();
    await saveToken('');
    Future.delayed(const Duration(seconds: 3));
    loading = false;
    notifyListeners();
    return getToken();
  }

  Future<void> getProfile() async {
    String token = await readToken();
    ApiClient apiClient = ApiClient();
    ApiResponse data = await apiClient.request(
        url: AppURL.whoami, token: token, method: ApiClient.GET);
    _profile = Profile.fromJson(data.data);
  }
}
