class ApiResponse {
  int? errorCode;
  String? message;
  int? timeStamp;
  dynamic data;

  ApiResponse({this.errorCode, this.message, this.timeStamp, this.data});

  ApiResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    message = json['message'] as String;
    timeStamp = json['timeStamp'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['errorCode'] = errorCode;
    data['message'] = message;
    data['timeStamp'] = timeStamp;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}
