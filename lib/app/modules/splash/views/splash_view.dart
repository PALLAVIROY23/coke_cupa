import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.count;
    return Scaffold(
      backgroundColor: Color(0xffE31E24),
      body:  Center(
        child:
          Image(image: AssetImage("assets/images/splash (2).png")
    )
      ),

    );
  }
}
