import 'package:coke_cupa/app/extensions/globel%20extensions.dart';
import 'package:get/get.dart';

import '../controllers/homepage_controller.dart';

class HomepageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomepageController>(
          () => HomepageController(apiController: apiController),
    );
  }
}
