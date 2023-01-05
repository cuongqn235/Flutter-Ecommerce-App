import 'package:bandongho/model/brand.dart';
import 'package:bandongho/service/api_client.dart';
import 'package:bandongho/service/api_response.dart';
import 'package:bandongho/utils/local_storage_utils.dart';
import 'package:bandongho/values/app_url.dart';
import 'package:flutter/material.dart';
import '../model/category.dart';
import '../model/product.dart';

class ProductProviver with ChangeNotifier {
  final List<Product> _top5SaleProduct = [];
  final List<Brand> _brands = [];
  List<Product> _listProductByBrand = [];
  List<Category> _cateloryProducts = [];
  bool loading = false;
  int _selectBrand = 0;
  void setSelectBrand(int select) {
    _selectBrand = select;
    notifyListeners();
  }

  List<Product> get listProductBrand => _listProductByBrand;
  int get getSelectBrand => _selectBrand;
  List<Brand> get brands => _brands;
  List<Category> get categorys => _cateloryProducts;
  List<Product> get top5SaleProduct => _top5SaleProduct;

  Future<void> fetAndGetData() async {
    String token = await readToken();
    ApiResponse response1 = await ApiClient()
        .request(url: AppURL.brandList, method: ApiClient.GET, token: token);
    List<Brand> temp1 =
        List<Brand>.from(response1.data.map((item) => Brand.fromJson(item)));
    _brands.addAll(temp1);

    ApiResponse response2 = await ApiClient()
        .request(url: AppURL.categoryList, method: ApiClient.GET, token: token);
    List<Category> temp2 = List<Category>.from(
        response2.data.map((item) => Category.fromJson(item)));
    _cateloryProducts.addAll(temp2);
    if (_brands.isNotEmpty) {
      listProductByBrand(_brands[_selectBrand].id);
    }
  }

  Future<void> listProductByBrand(int idBrand) async {
    _listProductByBrand.clear();
    String token = await readToken();
    Map<String, int> params = {
      "brandId": idBrand,
      "categoryId": 0,
      "pageNum": 0,
      "pageSize": 10
    };
    ApiResponse response = await ApiClient().request(
        url: AppURL.productList,
        method: ApiClient.GET,
        token: token,
        queryParameters: params);
    response.data['list'].forEach((v) {
      _listProductByBrand.add(Product.fromJson(v));
    });
    notifyListeners();
  }

  Future<void> top5Discount() async {
    _top5SaleProduct.clear();
    String token = await readToken();
    ApiResponse response = await ApiClient()
        .request(url: AppURL.top5Discount, method: ApiClient.GET, token: token);
    response.data.forEach((v) {
      _top5SaleProduct.add(Product.fromJson(v));
    });
    notifyListeners();
  }
}
