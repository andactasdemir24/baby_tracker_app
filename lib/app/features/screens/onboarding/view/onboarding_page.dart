import 'package:baby_tracker_app/app/core/constants/text_constants.dart';
import 'package:baby_tracker_app/app/features/screens/onboarding/widgets/custom_container.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/images_constants.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(top: 10, left: 0, right: 0, child: Image.asset(ImageConstants.onboarding1)),
          const CustomContainer(text: TextConstants.onb1Title, text2: TextConstants.onb1Description),
        ],
      ),
    );
  }
}
