import 'package:coke_cupa/app/extensions/globel%20extensions.dart';
import 'package:get/get.dart';

import '../controllers/ordersummary_controller.dart';

class OrdersummaryBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrdersummaryController>(
          () => OrdersummaryController(apiController: apiController),
    );
  }
}
