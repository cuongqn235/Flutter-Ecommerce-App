import 'package:bandongho/model/result_profile.dart';
import 'package:bandongho/service/user_service.dart';
import 'package:flutter/cupertino.dart';

import '../enum/auth.dart';
import '../model/result_user.dart';

class ResultUserProvider with ChangeNotifier {
  ResultUser _resultUser = ResultUser();
  ResultProfile _resultProfile = ResultProfile();
  bool loading = false;
  int _code = 0;
  Auth check = Auth.Unauthorized;
  ResultUser get resultUser => _resultUser;
  ResultProfile get resultProfile => _resultProfile;
  int get errorCode => _resultUser.errorCode;
  int get code => _code;
  Future<void> login(String email, String password) async {
    _resultUser = await UserService().loginAPI(email, password);
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    int code = await UserService().forgotPass(email);
    _code = code;
    notifyListeners();
  }

  Future<void> checkLogin() async {
    String token = await UserService().read();
    check = await UserService().checkToken(token);
    notifyListeners();
  }

  Future<String> getToken() async {
    String token = await UserService().read();
    return token;
  }

  Future<String> signOut() async {
    await UserService().save('');
    return getToken();
  }

  Future<void> getProfile() async {
    String token = await UserService().read();
    _resultProfile = await UserService().getProfile(token);
  }
}
