// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViews extends StatelessWidget {
  final ChromeSafariBrowser browser = ChromeSafariBrowser();
  final String text;
  final String text2;

  WebViews({
    Key? key,
    required this.text,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () async {
          await browser.open(
              url: Uri.parse(text),
              options: ChromeSafariBrowserClassOptions(
                  android: AndroidChromeCustomTabsOptions(shareState: CustomTabsShareState.SHARE_STATE_OFF),
                  ios: IOSSafariOptions(barCollapsingEnabled: true)));
        },
        child: Text(text2,
            style: const TextStyle(
                color: Color(0xFF1E1F23),
                fontSize: 10,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline)));
  }
}
