import 'package:coke_cupa/app/extensions/globel%20extensions.dart';
import 'package:get/get.dart';

import '../controllers/cart_controller.dart';

class CartBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CartController>(
          () => CartController(apiController: apiController),
    );
  }
}
