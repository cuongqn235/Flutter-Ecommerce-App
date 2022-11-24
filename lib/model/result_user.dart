import 'package:bandongho/model/user.dart';

class ResultUser {
  int errorCode = 0;
  String message = '';
  int timeStamp = 0;
  User data = User();

  ResultUser();

  ResultUser.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    message = json['message'];
    timeStamp = json['timeStamp'];
    var dataRepo = json['data'];
    if (dataRepo != null) {
      User.fromJson(json['data']);
    } else {
      User();
    }
  }
}
