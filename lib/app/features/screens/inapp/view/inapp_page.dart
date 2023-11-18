import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/mediaquery_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/core/widgets/custom_button.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/view/webview.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/widgets/cancel_icon.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/widgets/custom_desc_row.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/widgets/get_premium.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/widgets/price_container.dart';
import 'package:flutter/material.dart';

class InAppPage extends StatelessWidget {
  const InAppPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const CancelIcon(),
          Padding(
              padding: EdgeInsets.only(right: displayWidth(context) * 0.25),
              child: Image.asset(ImageConstants.inApp // Adjust as needed
                  )),
          AspectRatio(aspectRatio: displayHeight(context) * 0.02),
          const GetPremium(),
          AspectRatio(aspectRatio: displayHeight(context) * 0.02),
          const CustomDescRow(text: TextConstants.preDesc1),
          const CustomDescRow(text: TextConstants.preDesc2),
          const CustomDescRow(text: TextConstants.preDesc3),
          AspectRatio(aspectRatio: displayHeight(context) * 0.01),
          const PriceContainer(),
          AspectRatio(aspectRatio: displayHeight(context) * 0.007),
          CustomButton(
            text: const Text(TextConstants.inappCustomButtonText,
                style: TextStyle(color: ColorConstants.buttonTextColor)),
            onPressed: () {},
          ),
          WebViews(text: 'https://www.youtube.com/'),
        ],
      ),
    );
  }
}
