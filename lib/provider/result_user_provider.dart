import 'package:bandongho/model/result_profile.dart';
import 'package:bandongho/service/user_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/result_user.dart';

class ResultUserProvider with ChangeNotifier {
  ResultUser _resultUser = ResultUser();
  ResultProfile _resultProfile = ResultProfile();
  int _code = 0;
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

  Future<bool> checkLogin() async {
    String token = await UserService().read();
    if (token != '') {
      return true;
    } else {
      return false;
    }
  }

  Future<String> getToken() async {
    String token = await UserService().read();
    return token;
  }

  Future<void> signOut() async {
    await UserService().save('');
  }

  Future<void> getProfile() async {
    String token = await UserService().read();
    _resultProfile = await UserService().getProfile(token);
  }
}
