import 'package:bandongho/model/product.dart';

class ItemCart {
  Product product;
  int quantity;
  ItemCart({required this.product, required this.quantity});
  int total() {
    return product.price() * quantity;
  }

  ItemCart.fromJson(Map<String, dynamic> json)
      : quantity = json['quantity'],
        product = Product.fromJson(json['product']);
  Map<String, dynamic> toJson() {
    return {'product': product.toJson(), 'quantity': quantity};
  }
}
