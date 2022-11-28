import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/result_list_product.dart';
import '../values/app_url.dart';

class ProductService {
  Future<ResultListProduct> getListProduct(String token, int brandId,
      int cateloryId, int pageNum, int pageSize) async {
    Map<String, int> params = {
      "brandId": brandId,
      "cateloryId": cateloryId,
      "pageNum": pageNum,
      "pageSize": pageSize
    };
    try {
      var response = await Dio().get('${AppURL.appURL}api/product/list',
          queryParameters: params,
          options: Options(headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer $token"
          }));
      return ResultListProduct.fromJson(response.data);
    } on DioError catch (e) {
      return ResultListProduct();
    }
  }

  Future<void> addFavorite(int id, String token) async {
    print('id $id ------ token: $token');
    Map<String, int> body = {
      "productId": id,
    };
    var response = await Dio().post('${AppURL.appURL}api/product/favourite/add',
        data: jsonEncode(body),
        options: Options(headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        }));
    if (response.statusCode == 200)
      print('ok');
    else
      print('error');
  }
}
