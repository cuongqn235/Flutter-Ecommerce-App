import 'package:bandongho/service/user_service.dart';
import 'package:flutter/cupertino.dart';

import '../model/result_user.dart';

class ResultUserProvider with ChangeNotifier {
  ResultUser _resultUser = ResultUser();
  ResultUser get resultUser => _resultUser;
  int get errorCode => _resultUser.errorCode;
  Future<void> login(String email, String password) async {
    _resultUser = await UserService().loginAPI(email, password);
    notifyListeners();
  }
}
