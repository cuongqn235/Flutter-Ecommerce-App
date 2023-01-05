import 'package:bandongho/model/product.dart';

class ResultListProduct {
  int errorCode = -1;
  String message = '';
  int timeStamp = -1;
  List<Product> products = [];
  ResultListProduct();
  ResultListProduct.add(
      this.errorCode, this.message, this.timeStamp, this.products);

  ResultListProduct.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    message = json['message'];
    timeStamp = json['timeStamp'];
    if (json['data'] != null) {
      json['data']['list'].forEach((v) {
        products.add(Product.fromJson(v));
      });
    }
  }
}
