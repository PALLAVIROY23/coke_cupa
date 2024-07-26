import 'package:coke_cupa/constants/widgets/color.extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../../constants/widgets/customtextfield.dart';
import '../../../../constants/widgets/mybutton.dart';
import '../../../../constants/widgets/sizecong.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      bottomNavigationBar: const Image(image: AssetImage("assets/images/@lmonds ai.png")),
      body: SingleChildScrollView(
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: Get.height * 0.35, // Adjust height as needed
                width: Get.width,
                padding: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/Ellipse 2.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: Image.asset(
                      "assets/images/splash (2).png",
                      height: 90.h,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.06),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Proceed With your ",
                            style: TextStyle(fontSize: 17.4.sp, fontWeight: FontWeight.w500),
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            "Login ",
                            style: TextStyle(
                              fontSize: 25.13.sp,
                              fontWeight: FontWeight.w700,
                              color: HexColor.fromHex("#EB2A2E"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Expanded(
                            child: Obx(
                                  () => CustomTextField(
                                controller: controller.emailController,
                                HintText: "Enter Email Id",
                                Radius: 0,
                                width: Get.width,

                                keyboardType: TextInputType.text,
                                obscureText: false,
                                isOutlineInputBorder: true,
                                IsEnabled: !controller.isSendOtp.value,
                              ),
                            ),
                          ),
                          Obx(
                                () => Visibility(
                              visible: controller.isSendOtp.value,
                              child: IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  controller.isSendOtp.value = false;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Obx(
                              () => IgnorePointer(
                            ignoring: controller.isSendOtp.value,
                            child: Checkbox(
                              value: controller.isChecked.value,
                              onChanged: (value) {
                                controller.isChecked.value = value ?? false;
                              },
                            ),
                          ),
                        ),
                        const Text("I accept all the"),
                        const SizedBox(
                          width: 5,
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'terms and conditions',
                            style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(
                            () => IgnorePointer(
                          ignoring: controller.isSendOtp.value,
                          child: InkWell(
                            onTap: () {
                              controller.login();
                            },
                            child: Container(
                              height: Get.height * 0.07,
                              width: Get.width * 0.9,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: !controller.isSendOtp.value
                                    ? HexColor.fromHex("#EB2A2E")
                                    : HexColor.fromHex("#9C9C9C"),
                              ),
                              child: Center(
                                child: Text(
                                  "Send Otp",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: HexColor.fromHex("#F9F9F9"),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Center(
                      child: Obx(
                            () => Text(
                          "Enter Otp",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: HexColor.fromHex("#000000"),
                            decoration: controller.isSendOtp.value ? TextDecoration.none : TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Obx(
                          () => PinCodeTextField(
                        controller: controller.pin,
                        appContext: context,
                        length: 5,
                        obscureText: false,
                        keyboardType: TextInputType.number,
                        enabled: controller.isSendOtp.value,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(5),
                          fieldHeight: Get.height * 0.06,
                          fieldWidth: Get.width * 0.16,
                          inactiveFillColor: Colors.grey[200],
                          activeFillColor: Colors.white,
                          activeColor: Colors.black,
                          selectedColor: Colors.black,
                          inactiveColor: Colors.grey,
                        ),
                        onChanged: (value) {
                          controller.updatePin(value);
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter OTP';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Obx(
                          () => Visibility(
                        visible: controller.pinFilled.value,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            onTap: controller.canResendOtp.value
                                ? () {
                              controller.resendOtp();
                            }
                                : null,
                            child: myButton(
                              controller.canResendOtp.value
                                  ? "Resend OTP"
                                  : "Resend in ${controller.countdown.value}s",
                              controller.canResendOtp.value
                                  ? const Color(0xFFEB2A2E)
                                  : const Color(0xFFD0D0D0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.h),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Obx(
                            () => IgnorePointer(
                          ignoring: !controller.isSendOtp.value,
                          child: InkWell(
                            onTap: () {
                              controller.verifyOtpControl(controller.pin.text);

                              print("verify otp");
                            },
                            child: button(
                              "Submit",
                              textcolor: HexColor.fromHex("#F9F9F9"),
                              controller.isSendOtp.value
                                  ? const Color(0xFFEB2A2E)
                                  : const Color(0xFFD0D0D0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget myButton(String text, Color color, {Color? textcolor}) {
  return Center(
    child: Text(
      text,
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textcolor,
      ),
    ),
  );
}
