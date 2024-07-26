import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../../../api/api/api_controller.dart';
import '../../../../api/api/api_url.dart';
import '../models/login.model.dart';
import '../models/verifymodel.dart';

extension HomeExtension on ApiController {
  Future<Login> loginWithEmailApi(var emailController) async {
    try {
      EasyLoading.show(status: "Loading");
      var res = await httpClient.post(AppUrl.loginUrl, body: {"email": emailController});
      if (res.statusCode == 200) {
        EasyLoading.dismiss();
        return Login.fromJson(jsonDecode(res.bodyString ?? "{}"));
      }
      return Login();
    } catch (e) {
      print(e.toString());

      return Login();
    }
  }

  Future<VerifyOtp> verifyOtpApi(String email, String otp) async {
    try {
      EasyLoading.show(status: "Loading");
      var res = await httpClient.post(AppUrl.otpVerify,
          body: {"email": email, "otp":otp});
      print(res.body);
      if (res.statusCode == 200) {
        EasyLoading.dismiss();
        var verifyOtp = VerifyOtp.fromJson(res.body);
        return verifyOtp;
      } else {
        EasyLoading.dismiss();
        EasyLoading.showError(
            "${jsonDecode(res.bodyString ?? "")["message"] ?? "Something went wrong"}");
      }
    } catch (e) {
      print(e.toString());
    }

    return VerifyOtp();
  }
}
