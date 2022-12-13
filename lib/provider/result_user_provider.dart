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
    loading = true;
    notifyListeners();
    _resultUser = await UserService().loginAPI(email, password);
    await Future.delayed(Duration(seconds: 1));
    loading = false;
    notifyListeners();
  }

  Future<void> resetPassword(String email) async {
    loading = true;
    int code = await UserService().forgotPass(email);
    loading = false;
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
    loading = true;
    notifyListeners();
    await UserService().save('');
    await Future.delayed(Duration(seconds: 1));
    loading = false;
    notifyListeners();
    return getToken();
  }

  Future<void> getProfile() async {
    String token = await UserService().read();
    _resultProfile = await UserService().getProfile(token);
  }
}
