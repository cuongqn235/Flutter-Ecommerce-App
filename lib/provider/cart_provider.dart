import 'package:bandongho/model/item_cart.dart';
import 'package:bandongho/service/cart_service.dart';
import 'package:flutter/material.dart';

import '../model/product.dart';

class CartProvider with ChangeNotifier {
  List<ItemCart> _carts = [];
  List<ItemCart> get carts => _carts;

  fetAndGetData() {
    CartService().getCarts().then((value) => _carts = value);
  }

  Future<void> addCart(Product product, int size, int quantity) async {
    for (var element in _carts) {
      if (element.product == product && element.size == size) {
        element.quantity += quantity;
        CartService().autoSaveCart(_carts);
        notifyListeners();
        return;
      }
    }
    _carts.add(ItemCart(product: product, size: size, quantity: quantity));
    notifyListeners();
    CartService().autoSaveCart(_carts);
  }

  Future<void> updateCart(ItemCart itemCart, bool check) async {
    for (var element in _carts) {
      if (element == itemCart) {
        if (check) {
          element.quantity += itemCart.quantity;
        } else {
          element.quantity -= itemCart.quantity;
        }
        CartService().autoSaveCart(_carts);
        notifyListeners();
        return;
      }
    }
  }

  deleteCart(ItemCart itemCart) {
    _carts.remove(itemCart);
    notifyListeners();
    CartService().autoSaveCart(_carts);
  }

  int getTotal() {
    int total = 0;
    _carts.forEach((element) {
      total += element.total();
    });
    return total;
  }
}
