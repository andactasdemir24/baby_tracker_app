import 'package:baby_tracker_app/app/core/components/costum_vidgets/custom_appbar.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/text_constants.dart';
import '../widgets/custom_settings_container.dart';

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
            child: Image.asset(ImageConstants.settingsPremium, height: displayHeight(context) * 0.09),
          ),
          const CustomSettingsContainer(text: rateUs, image: ImageConstants.s1),
          const CustomSettingsContainer(text: termsofuse, image: ImageConstants.s2),
          const CustomSettingsContainer(text: privacy, image: ImageConstants.s3),
          const CustomSettingsContainer(text: contact, image: ImageConstants.s4),
          const CustomSettingsContainer(text: restore, image: ImageConstants.s5),
        ],
      ),
    );
  }
}
