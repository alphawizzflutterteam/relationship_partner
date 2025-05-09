// ignore_for_file: must_be_immutable, avoid_print

import 'package:astrologer_app/constants/messageConst.dart';
import 'package:astrologer_app/controllers/Authentication/login_controller.dart';
import 'package:astrologer_app/controllers/Authentication/login_otp_controller.dart';
import 'package:astrologer_app/controllers/Authentication/signup_controller.dart';
import 'package:astrologer_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_translator/google_translator.dart';

import '../../../constants/colorConst.dart';

class LoginOtpScreen extends StatelessWidget {
  String? mobileNumber;
  String? verificationId;
  String? otp;
  bool? fromSignup;

  LoginOtpScreen(
      {Key? key,
      this.mobileNumber,
      this.verificationId,
      this.otp,
      this.fromSignup})
      : super(key: key);

  final LoginOtpController loginOtpController = Get.put(LoginOtpController());
  LoginController loginController = Get.find<LoginController>();
  SignupController signupController = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: MyCustomAppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            ),
          ),
          height: 80,
          elevation: 0.5,
          appbarPadding: 0,
          title: const Text(
            MessageConstants.VERIFY_PHONE,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w300, fontSize: 19),
          ),
          backgroundColor: Colors.grey[100],
        ),
        body: Container(
          height: double.maxFinite,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.2, 0.5, 0.8, 0.9],
            colors: [
              COLORS.gradient1,
              COLORS.gradient2,
              COLORS.gradient3,
              COLORS.gradient4,
            ],
          )),
          child: Center(
            child: SizedBox(
              width: Get.width - Get.width * 0.1,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'OTP Send to ${loginOtpController.countryCode}-$mobileNumber',
                      style: const TextStyle(color: Colors.black),
                    ),
                    /*Text(
                      'OTP: $otp',
                      style: const TextStyle(color: Colors.black),
                    ),*/
                    const SizedBox(
                      height: 40,
                    ),
                    SizedBox(
                      height: 50,
                      child: OtpTextField(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        numberOfFields: 4,
                        showFieldAsBox: true,
                        textStyle: const TextStyle(color: Colors.black),
                        onCodeChanged: (value) {},
                        onSubmit: (value) {
                          loginOtpController.smsCode = value;
                          loginOtpController.update();
                          print('smscode from : ${loginOtpController.smsCode}');
                        },
                        filled: true,
                        fillColor: Colors.white,
                        fieldWidth: 48,
                        keyboardType: const TextInputType.numberWithOptions(
                            decimal: true, signed: true),
                        borderColor: Colors.transparent,
                        enabledBorderColor: Colors.transparent,
                        focusedBorderColor: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                        margin: const EdgeInsets.only(right: 4),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          /*loginOtpController.checkOtp(
                            mobileNumber!,
                            verificationId!,
                            loginOtpController.smsCode,
                          );*/

                          if (loginOtpController.smsCode == otp) {
                            await loginController.loginAstrologer(mobileNumber);
                          }
                          loginOtpController.update();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                width: 0.5, color: Colors.grey),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(12),
                          backgroundColor: Get.theme.primaryColor,
                          textStyle: const TextStyle(
                              fontSize: 18, color: Colors.black),
                        ),
                        child: const Text(
                          MessageConstants.SUBMIT_CAPITAL,
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    GetBuilder<LoginOtpController>(builder: (c) {
                      return SizedBox(
                          child: loginOtpController.maxSecond != 0
                              ? Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Resend OTP Available in ${loginOtpController.maxSecond} s',
                                      style: const TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.w500),
                                    )
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      const Text(
                                        'Resend OTP Available',
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () {
                                              String phoneNumber =
                                                  loginOtpController
                                                      .cMobileNumber.text;
                                              loginController
                                                  .sendLoginOTP(phoneNumber);
                                            },
                                            style: ButtonStyle(
                                              shape: MaterialStateProperty.all(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      const EdgeInsets.only(
                                                          left: 25, right: 25)),
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Get.theme.primaryColor),
                                              textStyle:
                                                  MaterialStateProperty.all(
                                                      const TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.black)),
                                            ),
                                            child: const Text(
                                              'Resend OTP on SMS',
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                        ],
                                      )
                                    ]));
                    })
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
