import 'package:astrologer_app/constants/colorConst.dart';
import 'package:astrologer_app/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_translator/google_translator.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:astrologer_app/utils/global.dart' as global;

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyCustomAppBar(
        height: 80,
        backgroundColor: COLORS().primaryColor,
        title: const Text("Privacy Policy"),
      ),
      body:  WebView(
        initialUrl: '${global.webBaseUrl}privacy-policy-1',
            /*'https://relationship.developmentalphawizz.com/admin/privacypolicy',*/
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
