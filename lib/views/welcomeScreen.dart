// import 'package:AstroGuru/constants/colors.dart';
import 'package:astrologer_app/constants/colorConst.dart';
import 'package:astrologer_app/views/Authentication/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
// import 'package:lottie/lottie.dart';

// import 'journey1.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              height: (MediaQuery.of(context).size.height) / 1.5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Center(
                      child: Text(
                    'Welcome to \nRelationship Revive.',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.headlineLarge,
                  )),
                  Container(
                      height: 300,
                      width: 300,
                      child: Lottie.asset("assets/animation/welcome.json")),
                  Text(
                    ' Let’s begin the journey \ntowards a better \ntomorrow….',
                    textAlign: TextAlign.center,
                    style: Get.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0, right: 10),
              child: GestureDetector(
                  onTap: () {
                    Get.to(LoginScreen());
                  },
                  child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: COLORS.gradient2,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        ' Let’s continue...',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ))),
            ),
          ],
        ),
      ),
    );
  }
}
