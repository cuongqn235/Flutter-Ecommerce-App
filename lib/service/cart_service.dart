import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/item_cart.dart';

class CartService {
  Future autoSaveCart(List<ItemCart> carts) async {
    final prefs = await SharedPreferences.getInstance();
    var data = jsonEncode(carts);
    await prefs.setString('carts', data);
  }

  Future<List<ItemCart>> getCarts() async {
    final prefs = await SharedPreferences.getInstance();
    var data = await prefs.getString('carts');
    if (data != null) {
      List<ItemCart> carts = List<ItemCart>.from(
          json.decode(data).map((item) => ItemCart.fromJson(item)));
      return carts;
    } else {
      return [];
    }
  }
}
