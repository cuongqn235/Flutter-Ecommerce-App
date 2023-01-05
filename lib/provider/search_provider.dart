import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/product.dart';

class SearchProvider with ChangeNotifier {
  bool _loading = false;
  List<Product> _produsts = [];
  List<String> _keywords = [];

  bool get loading => _loading;

  void setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  SearchProvider() {
    fetAndGetKeyword();
  }
  Future<void> fetAndGetKeyword() async {
    final prefs = await SharedPreferences.getInstance();
    var data = prefs.getString('keyworks');
    if (data == null) {
      return;
    } else {
      _keywords = List<String>.from(
          json.decode(data).map((item) => _keywords.add(item)));
    }
  }

  Future<void> saveKeyword(String keyword) async {
    _keywords.forEach((element) {
      if (element == keyword) {
        return;
      }
    });
    _keywords.add(keyword);
  }
}
