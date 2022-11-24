import 'package:bandongho/enum/status_api.dart';

class Result {
  int errorCode = 0;
  String message = '';
  int timeStamp = 0;
  String data = '';
  Status statusResult = Status.NULL;
  Result();

  Result.fromJson(Map<String, dynamic> json, Status status) {
    errorCode = json['errorCode'];
    message = json['message'];
    timeStamp = json['timeStamp'];
    data = json['data'] == null ? '' : json['data'];
    statusResult = status;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['message'] = this.message;
    data['timeStamp'] = this.timeStamp;
    data['data'] = this.data;
    return data;
  }
}
