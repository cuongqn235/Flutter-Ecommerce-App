import 'package:bandongho/model/product.dart';
import 'package:bandongho/service/product_service.dart';
import 'package:flutter/foundation.dart';

import '../enum/status.dart';
import '../service/user_service.dart';

class ProductDetailProvider with ChangeNotifier {
  Product _product = Product();
  Status _status = Status.loading;
  Product get product => _product;
  Status get status => _status;
  ProductDetailProvider() {
    _status = Status.loading;
  }
  void setStatus(Status status) {
    _status = status;
    notifyListeners();
  }

  void setProduct(Product product) {
    _product = product;
  }

  Future<void> fetAndGetData({required int idProduct}) async {
    String token = await UserService().read();
    _product = await ProductService()
        .getProductDetail(token: token, idProduct: idProduct);
    setStatus(Status.loading);
    await Future.delayed(const Duration(seconds: 1));
    if (_product.id != -1) {
      setStatus(Status.success);
    } else {
      setStatus(Status.error);
    }
  }
}
