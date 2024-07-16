import 'dart:async';

import 'package:coke_cupa/api/api/api_controller.dart';
import 'package:coke_cupa/app/modules/login/extensions/login%20extensions.dart';
import 'package:coke_cupa/app/modules/login/models/login.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../../../routes/app_pages.dart';
import '../models/verifymodel.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  ApiController apiController;

  LoginController({required this.apiController});

  var loginModel = Login().obs;
  var verifyModel = Verifyotp().obs;
  final count = 0.obs;


  RxBool isChecked = false.obs;
  RxBool isSendOtp = false.obs;
  var isOtpValid = false.obs;
  RxBool isOtpSubmit = false.obs;
  var canResendOtp = true.obs;
  var pinFilled = false.obs;
  var countdown = 0.obs;

  TextEditingController pin = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController submit = TextEditingController();
  TextEditingController otp = TextEditingController();

   login() {
    if (emailController.text.isEmpty) {
      EasyLoading.showInfo("Enter your email id");
    } else if (!emailController.text.isEmail) {
      EasyLoading.showInfo("Enter your valid email id");
    } else if (!isChecked.value) {
      EasyLoading.showInfo("Please check terms & condition");
    } else {
      print(isSendOtp.value);
     // isSendOtp.value = true;
      print("updated value-------------${isSendOtp.value}");
      sendOtp();
    }
  }

  sendOtp() async {
    var res = await apiController.loginWithEmailApi(emailController.text);
    if (res.success == true) {
      isSendOtp.value = true;
      EasyLoading.showSuccess("${res.message}");
    }else{
      EasyLoading.showError("${res.message}");
    }
  }


  void verifyOtpControl(String otp) {
    if (pin.text.isEmpty) {
      EasyLoading.showError('Please Enter your otp');
    } else if (pin.text.length < 5) {
      EasyLoading.showInfo('Complete Your Otp pin');
    } else {
      Submit();
    }
  }

  Submit() async {
    var response = await apiController.verifyOtp(emailController.text, pin.text);
    if (response.success == true) {
      EasyLoading.showSuccess("${response.message}");
      await apiController.getStorage.write("token", response.accessToken);
      verifyModel.value = response;
      EasyLoading.showSuccess("${response.message}");
      Get.offAllNamed(Routes.HOMEPAGE);
    }else{
      EasyLoading.showError("OTP is Invalid");
    }

  }

   resendOtp() {
    canResendOtp.value = false;
    countdown.value = 30;
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (countdown.value == 0) {
        canResendOtp.value = true;
        timer.cancel();
      } else {
        countdown.value--;
      }
    });
    // Your resend OTP logic here
  }
   updatePin(String value) {
    pinFilled.value = value.length == 5;
   }
}
// Hand
