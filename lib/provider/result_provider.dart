import 'package:bandongho/model/result.dart';
import 'package:bandongho/service/forgot_pass.dart';
import 'package:flutter/cupertino.dart';

import '../enum/status_api.dart';

class ResultProviver with ChangeNotifier {
  Result _result = Result();
  Result get result => _result;
  Future<void> setStatusResult(Status value) async {
    _result.statusResult = value;
    notifyListeners();
  }

  Status get statusResult => _result.statusResult;
  Future<void> resetPassword(String email) async {
    try {
      Result result = await ForgotPass().forgotPass(email);
      _result = result;
      notifyListeners();
    } catch (e) {
      print('ResultProviver error $e');
    }
  }
}
