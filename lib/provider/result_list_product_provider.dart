import 'package:bandongho/service/product_service.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
import '../model/result_list_product.dart';
import '../service/user_service.dart';

class ResultListProductProviver with ChangeNotifier {
  ResultListProduct _listProduct = ResultListProduct();
  List<Product> _top5SaleProduct = [];
  List<Product> _brandProducts = [];
  List<Product> _cateloryProducts = [];
  bool loading = false;
  final List<String> _brands = [
    "Adidas",
    "Nike",
    "Converse",
    "Fila",
    "Vans",
    "Puma",
  ];
  final List<String> _catelorys = [
    "Running",
    "Sneaker",
    "Lazy",
    "Sport",
    "Sandal",
  ];
  List<String> get brands => _brands;
  List<String> get catelorys => _catelorys;
  ResultListProduct get listProduct => _listProduct;
  List<Product> get top5SaleProduct => _top5SaleProduct;
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

  Future<void> Top5SaleProduct() async {
    loading = false;
    _top5SaleProduct.clear();
    ResultListProduct temp =
        await ProductService().top5Discout(await UserService().read());
    _top5SaleProduct = temp.products;
    loading = true;
    notifyListeners();
  }
}
