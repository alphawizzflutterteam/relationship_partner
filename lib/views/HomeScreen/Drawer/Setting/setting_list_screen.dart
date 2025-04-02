// ignore_for_file: must_be_immutable

import 'package:astrologer_app/constants/colorConst.dart';
import 'package:astrologer_app/constants/messageConst.dart';
import 'package:astrologer_app/controllers/Authentication/login_controller.dart';
import 'package:astrologer_app/controllers/Authentication/login_otp_controller.dart';
import 'package:astrologer_app/controllers/Authentication/signup_controller.dart';
import 'package:astrologer_app/utils/extentions.dart';
import 'package:astrologer_app/views/Authentication/login_screen.dart';
import 'package:astrologer_app/views/HomeScreen/Drawer/Setting/privacy_policy_screen.dart';
import 'package:astrologer_app/views/HomeScreen/Drawer/Setting/term_and_condition_screen.dart';
import 'package:astrologer_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:astrologer_app/utils/global.dart' as global;
import 'package:google_translator/google_translator.dart';
import 'package:share_plus/share_plus.dart';

class SettingListScreen extends StatelessWidget {
  SettingListScreen({Key? key}) : super(key: key);
  SignupController signupController = Get.find<SignupController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: MyCustomAppBar(
          height: 80,
          backgroundColor: COLORS().whiteColor,
          title: const Text("Settings"),
        ),
        body: Container(
          decoration: GradientBoxDecoration.customGradient(),
          child: Column(
            children: [
              ListTile(
                enabled: true,
                tileColor: Colors.white,
                leading: Icon(
                  Icons.work,
                  color: COLORS().primaryColor,
                ),
                title: Text(
                  "Terms and Condition",
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ).translate(),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: COLORS().primaryColor),
                onTap: () {
                  Get.to(() => TermAndConditionScreen());
                },
              ),
              Divider(
                color: COLORS().primaryColor,
              ),
              ListTile(
                enabled: true,
                tileColor: Colors.white,
                leading: Icon(
                  Icons.work,
                  color: COLORS().primaryColor,
                ),
                title: Text(
                  "Privacy Policy",
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ).translate(),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: COLORS().primaryColor),
                onTap: () {
                  Get.to(() => PrivacyPolicyScreen());
                },
              ),
              Divider(
                color: COLORS().primaryColor,
              ),
              ListTile(
                enabled: true,
                tileColor: Colors.white,
                leading: Icon(
                  Icons.share,
                  color: COLORS().primaryColor,
                ),
                title: Text(
                  "Share App",
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ).translate(),
                trailing:
                Icon(Icons.arrow_forward_ios, color: COLORS().primaryColor),
                onTap: () {
                  Share.share('Hey! check out this new app https://play.google.com/store/apps/details?id=com.relationship_app', subject: 'Relationship Revive');
                },
              ),
              Divider(
                color: COLORS().primaryColor,
              ),
              ListTile(
                enabled: true,
                tileColor: Colors.white,
                leading: Icon(
                  Icons.logout,
                  color: COLORS().primaryColor,
                ),
                title: Text(
                  "Logout my account",
                  style: Theme.of(context).primaryTextTheme.subtitle1,
                ).translate(),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: COLORS().primaryColor),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title: const Text("Are you sure you want to logout?")
                          .translate(),
                      content: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child:
                                  const Text(MessageConstants.No).translate(),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: ElevatedButton(
                              onPressed: () async {
                                final LoginController loginController =
                                    Get.find<LoginController>();
                                final LoginOtpController loginOtpController =
                                    Get.put(LoginOtpController());
                                global.showOnlyLoaderDialog();
                                loginOtpController.cMobileNumber.clear();
                                await loginController.init();
                                global.hideLoader();
                                await global.logoutUser();
                              },
                              child:
                                  const Text(MessageConstants.YES).translate(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Divider(
                color: COLORS().primaryColor,
              ),
              ListTile(
                enabled: true,
                tileColor: Colors.white,
                leading: Icon(
                  Icons.delete,
                  color: COLORS().errorColor,
                ),
                title: Text(
                  "Delete my account",
                  style: TextStyle(
                      color: COLORS().errorColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 16),
                ).translate(),
                trailing:
                    Icon(Icons.arrow_forward_ios, color: COLORS().primaryColor),
                onTap: () {
                  Get.dialog(
                    AlertDialog(
                      title:  Text(
                              "Are you sure you want to delete this Account?",style: Get.textTheme.titleMedium?.copyWith(fontSize: 14)),
                      content: Row(
                        children: [
                          Expanded(
                            flex: 4,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.back();
                              },
                              child:
                                   Text(MessageConstants.No,style: Get.textTheme.titleMedium?.copyWith(fontSize: 14,color: Colors.white)),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            flex: 4,
                            child: ElevatedButton(
                              onPressed: () {
                                int id = global.user.id ?? 0;
                                signupController.deleteAstrologer(id);
                                Get.offUntil(
                                    MaterialPageRoute(
                                        builder: (context) => LoginScreen()),
                                    (route) => false);
                              },
                              child:
                                   Text(MessageConstants.YES,style: Get.textTheme.titleMedium?.copyWith(fontSize: 14,color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
              Divider(
                color: COLORS().primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
