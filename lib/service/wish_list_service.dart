import 'dart:convert';

import 'package:bandongho/service/user_service.dart';
import 'package:dio/dio.dart';

import '../model/product.dart';
import '../values/app_url.dart';

class WishListService {
  Future<bool> checkWishList(int productID) async {
    String token = await UserService().read();
    Map<String, dynamic> pagrams = {"productId": productID};

    var response = await Dio().get('${AppURL.appURL}api/wishlist/check',
        queryParameters: pagrams,
        options: Options(headers: {"Authorization": "Bearer $token"}));
    if (response.statusCode == 200) {
      return response.data['data'];
    } else {
      return false;
    }
  }

  Future<int> addWishList(int idProduct) async {
    try {
      String token = await UserService().read();
      Map<String, int> params = {
        "productId": idProduct,
      };
      var response = await Dio().post('${AppURL.appURL}api/wishlist/add',
          queryParameters: params,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.data['errorCode'] as int == 200) {
        return 200;
      } else {
        return 406003;
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<int> deteleWishList(int idProduct) async {
    try {
      String token = await UserService().read();
      Map<String, int> params = {
        "productId": idProduct,
      };
      var response = await Dio().delete('${AppURL.appURL}api/wishlist/delete',
          queryParameters: params,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.data['errorCode'] as int == 200) {
        return 200;
      } else {
        return 406003;
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Product>> getWishList() async {
    try {
      String token = await UserService().read();
      var response = await Dio().get('${AppURL.appURL}api/wishlist/list',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.data['errorCode'] == 200) {
        List<Product> temp = List<Product>.from(
            response.data['data'].map((item) => Product.fromJson(item)));
        return temp;
      } else {
        return [];
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
