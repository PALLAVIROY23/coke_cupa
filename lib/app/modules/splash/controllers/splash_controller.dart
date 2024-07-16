import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../data/Contanst.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController {
  GetStorage box = GetStorage();
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    Future.delayed(const Duration (seconds:  3), (){
      if(box.read(Contanst.TOKEN) == null || box.read(Contanst.TOKEN) == ""){
        Get.offAllNamed(Routes.LOGIN);
      }else{
        Get.offAllNamed(Routes.HOMEPAGE);
      }
    });
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
