class AppURL {
  static String appURL = 'http://192.168.1.5:8080/';
  static String whoami = '${appURL}api/user/whoami';
  static String login = '${appURL}api/auth/login';
  static String forgotPass = '${appURL}api/user/forgot_password';
  static String top5Discount = '${appURL}api/product/top5Discount';
  static String productList = '${AppURL.appURL}api/product/list';
  static String brandList = '${AppURL.appURL}api/brand/list';
  static String categoryList = '${AppURL.appURL}api/category/list';
  static String addWishlist = '${AppURL.appURL}api/product/wishlist/add';
  static String deleteWishlist = '${AppURL.appURL}api/product/wishlist/delete';
}
