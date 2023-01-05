import 'package:bandongho/enum/check_change_wish_list.dart';
import 'package:bandongho/model/product.dart';
import 'package:bandongho/service/%08wish_list_service.dart';
import 'package:bandongho/service/api_client.dart';
import 'package:bandongho/utils/local_storage_utils.dart';
import 'package:bandongho/values/app_url.dart';
import 'package:flutter/foundation.dart';

class WishListProvider with ChangeNotifier {
  List<Product> _products = [];
  bool _check = false;
  CheckChangeWishList _checkChange = CheckChangeWishList.no;
  Future<void> checkProductInWishList(int productID) async {
    _checkChange = CheckChangeWishList.no;
    bool temp = await WishListService().checkWishList(productID);
    _check = temp;
  }

  Future<void> saveWishList(int productID, bool checkChange) async {
    if (_check == checkChange) {
      return;
    } else {
      String token = await readToken();
      Map<String, int> params = {
        "productId": productID,
      };
      await ApiClient().request(
          url: checkChange ? AppURL.addWishlist : AppURL.deleteWishlist,
          method: checkChange ? ApiClient.POST : ApiClient.DELETE,
          queryParameters: params,
          token: token);
    }
  }

  Future<void> getWishList() async {
    var temp = await WishListService().getWishList();
    _products = temp;
    notifyListeners();
  }

  bool getCheck() => _check;
  void setCheck() {
    _check = !_check;
    if (_check) {
      _checkChange = CheckChangeWishList.add;
    } else {
      _checkChange = CheckChangeWishList.delete;
    }
    notifyListeners();
  }

  List<Product> get products => _products;

  CheckChangeWishList get checkChange => _checkChange;
  void setCheckChange(CheckChangeWishList checkChange) {
    _checkChange = checkChange;
  }
}
