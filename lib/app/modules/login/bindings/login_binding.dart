import 'package:coke_cupa/app/extensions/globel%20extensions.dart';
import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
          () => LoginController(apiController: apiController),
    );
  }
}
