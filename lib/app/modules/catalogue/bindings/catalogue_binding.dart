import 'package:coke_cupa/app/extensions/globel%20extensions.dart';
import 'package:get/get.dart';

import '../controllers/catalogue_controller.dart';

class CatalogueBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CatalogueController>(
          () => CatalogueController(apiController: apiController),
    );
  }
}
