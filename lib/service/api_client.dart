import 'dart:convert';
import 'dart:io';

import 'package:bandongho/service/user_service.dart';
import 'package:dio/dio.dart';

import 'api_response.dart';

class ApiClient {
  static const String GET = 'GET';
  static const String POST = 'POST';
  static const String DELETE = 'DELETE';
  static const String PATCH = 'PATCH';
  static const String PUT = 'PUT';

  static const CONTENT_TYPE = 'Content-Type';
  static const CONTENT_TYPE_JSON = 'application/json; charset=utf-8';

  static final BaseOptions defaultOptions = BaseOptions(
      connectTimeout: 10000,
      receiveTimeout: 5000,
      responseType: ResponseType.json);

  late Dio _dio = Dio();
  factory ApiClient({BaseOptions? options}) {
    if (options == null) options = defaultOptions;
    final ApiClient apiClient = ApiClient._create(options: options);
    return apiClient;
  }
  ApiClient._create({BaseOptions? options}) {
    if (options == null) options = defaultOptions;
    _dio.options = options;
  }
  Future<ApiResponse> request(
      {required String url,
      String? token,
      String? endpointKey,
      String method = POST,
      String? data,
      Map<String, dynamic>? formData,
      Map<String, dynamic>? queryParameters}) async {
    // String locationId = await AppDataCenter.getLocationId();
    Map<String, dynamic> headerMap =
        token != null ? {'Authorization': 'Bearer $token'} : {};
    // headerMap.putIfAbsent('accept', () => '*/*');
    // headerMap.putIfAbsent('locationId', () => locationId);
    Response response;
    try {
      response = await _dio.request(url,
          data: formData != null
              ? FormData.fromMap(formData)
              : data ?? jsonEncode({}),
          options: Options(
              method: method,
              sendTimeout: 10000,
              receiveTimeout: 10000,
              headers: headerMap,
              contentType: formData != null ? 'multipart/form-data' : null),
          queryParameters: queryParameters);
      var apiResponse = ApiResponse.fromJson(response.data);
      return apiResponse;
    } on DioError catch (e) {
      final response = e.response;
      if (response != null) {
        return ApiResponse(
          data: null,
          message: response.statusMessage,
          errorCode: response.statusCode,
        );
      }
      if (e.error is SocketException) {
        SocketException socketException = e.error as SocketException;
        return ApiResponse(
          data: null,
          message: socketException.osError != null
              ? socketException.osError?.message
              : '',
        );
      }
      return ApiResponse(
        data: null,
        message: e.error ?? '',
        errorCode: -9999,
      );
    }
  }
}
