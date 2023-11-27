import 'package:baby_tracker_app/app/core/components/costum_vidgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:flutter/material.dart';

import '../../../../core/constants/text_constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(appbarText: customAppbarText),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Image.asset(ImageConstants.settingsPremium, height: displayHeight(context) * 0.0874),
          ),
          Container(
            height: displayHeight(context) * 0.0647,
            width: displayWidth(context) * 0.8878,
            decoration: ShapeDecoration(
              color: const Color(0xFFF3F3F3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          )
        ],
      ),
    );
  }
}
