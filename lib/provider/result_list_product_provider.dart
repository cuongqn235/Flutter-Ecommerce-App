import 'package:bandongho/service/product_service.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import '../model/result_list_product.dart';
import '../service/user_service.dart';

class ResultListProductProviver with ChangeNotifier {
  ResultListProduct _listProduct = ResultListProduct();
  List<Product> _brandProducts = [];
  List<Product> _cateloryProducts = [];
  final List<String> _brands = [
    "ADIDAS",
    "NIKE",
    "CONVERSE",
    "FILA",
    "VANS",
    "PUMA",
  ];
  final List<String> _catelorys = [
    "Running",
    "Sneaker",
    "Lazy",
    "Sport",
    "Sandal",
    "Golf",
    "Football",
  ];
  List<String> get brands => _brands;
  List<String> get catelorys => _catelorys;
  ResultListProduct get listProduct => _listProduct;
  Future<void> fetAndGetData() async {
    String token = await UserService().read();
    _listProduct = await ProductService().getListProduct(token, 1, 1, 0, 6);
    notifyListeners();
  }

  List<Product> ListProductByBrand(String brand) {
    _brandProducts.clear();
    _listProduct.products.forEach((element) {
      if (element.brandName == brand) _brandProducts.add(element);
    });
    return _brandProducts;
  }

  List<Product> ListProductByCatelory(String catelory) {
    _cateloryProducts.clear();
    _listProduct.products.forEach((element) {
      if (element.cateloryName == catelory) _cateloryProducts.add(element);
    });
    return _cateloryProducts;
  }
}
