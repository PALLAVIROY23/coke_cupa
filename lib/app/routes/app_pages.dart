import 'package:get/get.dart';

import '../modules/cart/bindings/cart_binding.dart';
import '../modules/cart/views/cart_view.dart';
import '../modules/catalogue/bindings/catalogue_binding.dart';
import '../modules/catalogue/views/catalogue_view.dart';
import '../modules/homepage/bindings/homepage_binding.dart';
import '../modules/homepage/views/homepage_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/ordersummary/bindings/ordersummary_binding.dart';
import '../modules/ordersummary/views/ordersummary_view.dart';
import '../modules/product/bindings/product_binding.dart';
import '../modules/product/views/product_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOMEPAGE,
      page: () => const HomepageView(),
      binding: HomepageBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT,
      page: () => const ProductView(),
      fullscreenDialog: true,
      transition: Transition.leftToRightWithFade,
      binding: ProductBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ORDERSUMMARY,
      page: () => const OrdersummaryView(),
      transition: Transition.downToUp,
      binding: OrdersummaryBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CART,
      page: () => const CartView(),
      transition: Transition.zoom,
      //transitionDuration: Duration(seconds: 10),
      binding: CartBinding(),
    ),
    GetPage(
      name: _Paths.CATALOGUE,
      page: () => const CatalogueView(),
      transition: Transition.leftToRightWithFade,
      popGesture: true,
      customTransition: null,
      binding: CatalogueBinding(),
    ),

  ];
}
