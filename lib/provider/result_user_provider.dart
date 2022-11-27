import 'package:bandongho/service/user_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/result_user.dart';

class ResultUserProvider with ChangeNotifier {
  ResultUser _resultUser = ResultUser();
  int _code = 0;
  ResultUser get resultUser => _resultUser;
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
}
