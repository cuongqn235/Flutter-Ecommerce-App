import 'package:bandongho/enum/status_api.dart';
import 'package:bandongho/model/result.dart';
import 'package:dio/dio.dart';

class ForgotPass {
  Future<Result> forgotPass(String email) async {
    try {
      FormData formData =
          FormData.fromMap({"recipientEmail": "${email.toString()}"});
      final response = await Dio()
          .post('http://192.168.1.20:8080/forgot_password', data: formData);
      if (response.data['message'] == 'OK') {
        return Result.fromJson(response.data, Status.SUCCESS);
      } else {
        return Result.fromJson(response.data, Status.ERROR);
      }
    } catch (e) {
      throw Exception('Error ForgotPass $e');
    }
  }
}
