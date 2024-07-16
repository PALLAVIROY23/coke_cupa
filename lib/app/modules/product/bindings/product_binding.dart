import 'package:coke_cupa/app/extensions/globel%20extensions.dart';
import 'package:get/get.dart';

import '../controllers/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(
          () => ProductController(apiController: apiController),
    );
  }
}
