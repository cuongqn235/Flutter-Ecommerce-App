import 'package:bandongho/model/product.dart';

class ItemCart {
  Product product;
  int quantity;
  ItemCart({required this.product, required this.quantity});
  int total() {
    return product.price() * quantity;
  }
}
