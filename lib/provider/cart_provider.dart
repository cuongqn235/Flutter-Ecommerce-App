import 'package:bandongho/model/item_cart.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class CartProvider with ChangeNotifier {
  List<ItemCart> _carts = [];
  List<ItemCart> get carts => _carts;

  Future<void> addCart(Product product, int quantity) async {
    for (var element in _carts) {
      if (element.product == product) {
        element.quantity += quantity;
        notifyListeners();
        return;
      }
    }
    _carts.add(ItemCart(product: product, quantity: quantity));
    notifyListeners();
  }

  Future<void> updateCart(ItemCart itemCart, bool check) async {
    for (var element in _carts) {
      if (element == itemCart) {
        if (check)
          element.quantity += itemCart.quantity;
        else
          element.quantity -= itemCart.quantity;
        notifyListeners();
        return;
      }
    }
  }

  deleteCart(ItemCart itemCart) {
    _carts.remove(itemCart);
    print(_carts.length);
    notifyListeners();
  }

  int getTotal() {
    int total = 0;
    _carts.forEach((element) {
      total += element.total();
    });
    return total;
  }
}
