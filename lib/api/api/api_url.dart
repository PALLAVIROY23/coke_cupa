class AppUrl{
  static const String BaseUrl ="http://35.154.22.223:3015";
  static const String apiUrl = "$BaseUrl/api";
  static const String loginUrl = "$apiUrl/auth/login-with-email";
  static const String otpVerify = "$apiUrl/auth/otp-verify-email";
  static const String getBanners = "$apiUrl/data/banners";
  static const String getAllProducts = "$apiUrl/data/products";
  static const String orderSummary = "$apiUrl/loyalty/user/order/summary";
  static const String viewAllProducts = "$apiUrl/data/products";
  static const String addToCart = "$apiUrl/data/add-to-cart";
  static const String getUserCart = "$apiUrl/data/getProductsFromCart";
  static const String updateCart = "$apiUrl/data/update-cart";
  static const String removeCart = "$apiUrl/data/remove-from-Cart";
  static const String placeOrder = "$apiUrl/loyalty/order/request";


}