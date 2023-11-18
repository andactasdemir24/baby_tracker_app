// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViews extends StatelessWidget {
  final ChromeSafariBrowser browser = ChromeSafariBrowser();
  final String text;

  WebViews({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () async {
            await browser.open(
                url: Uri.parse(text),
                options: ChromeSafariBrowserClassOptions(
                    android: AndroidChromeCustomTabsOptions(shareState: CustomTabsShareState.SHARE_STATE_OFF),
                    ios: IOSSafariOptions(barCollapsingEnabled: true)));
          },
          child: const Text("Open Chrome Safari Browser")),
    );
  }
}
