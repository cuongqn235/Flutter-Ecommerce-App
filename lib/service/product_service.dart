import 'dart:convert';

import 'package:dio/dio.dart';

import '../model/brand.dart';
import '../model/category.dart';
import '../model/product.dart';
import '../model/result_list_product.dart';
import '../values/app_url.dart';

class ProductService {
  Future<ResultListProduct> getListProduct(
      {required String token,
      required int brandId,
      String name = '',
      int cateloryId = 0,
      int pageNum = 0,
      int pageSize = 0}) async {
    Map<String, int> params = {
      "brandId": brandId,
      "categoryId": 0,
      "pageNum": 0,
      "pageSize": 10
    };
    try {
      var response = await Dio().get('${AppURL.appURL}api/product/list',
          queryParameters: params,
          options: Options(
              headers: {"Authorization": "Bearer $token"},
              contentType: Headers.jsonContentType));
      return ResultListProduct.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      return ResultListProduct();
    }
  }

  Future<Product> getProductDetail(
      {required String token, required int idProduct}) async {
    Map<String, int> params = {
      "productId": idProduct,
    };
    try {
      var response = await Dio().get('${AppURL.appURL}api/product/detail',
          queryParameters: params,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return Product.fromJson(response.data['data']);
    } on DioError catch (e) {
      return Product();
    }
  }

  Future<ResultListProduct> getListProductByName(
      {required String token,
      required String name,
      int brandId = 0,
      int cateloryId = 0,
      int pageNum = 0,
      int pageSize = 0}) async {
    Map<String, dynamic> params = {
      "brandId": brandId,
      "cateloryId": 0,
      "pageNum": 0,
      "pageSize": 10,
      "name": name
    };
    try {
      var response = await Dio().get('${AppURL.appURL}api/product/list',
          queryParameters: params,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return ResultListProduct.fromJson(response.data);
    } on DioError catch (e) {
      return ResultListProduct();
    }
  }

  Future<ResultListProduct> top5Discout(
    String token,
  ) async {
    try {
      var reponse = await Dio().get('${AppURL.appURL}api/product/top5Discount',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return ResultListProduct.fromJson(reponse.data);
    } on DioError catch (e) {
      print('Error $e');
    }
    return ResultListProduct();
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

  Future<List<Brand>> getBrandList({required String token}) async {
    try {
      var response = await Dio().get('${AppURL.appURL}api/brand/list',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        List<Brand> brands = List<Brand>.from(
            response.data['data'].map((item) => Brand.fromJson(item)));
        return brands;
      } else {
        return [];
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Category>> getCategoryList({required String token}) async {
    try {
      var response = await Dio().get('${AppURL.appURL}api/category/list',
          options: Options(headers: {"Authorization": "Bearer $token"}));
      if (response.statusCode == 200) {
        List<Category> _categorys = List<Category>.from(
            response.data['data'].map((item) => Category.fromJson(item)));
        return _categorys;
      } else {
        return [];
      }
    } on DioError catch (e) {
      throw Exception(e);
    }
  }
}
