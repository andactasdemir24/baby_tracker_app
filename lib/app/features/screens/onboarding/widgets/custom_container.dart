// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:baby_tracker_app/app/core/constants/color_constants.dart';
import 'package:baby_tracker_app/app/features/screens/inapp/view/inapp_page.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/mediaquery_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/widgets/custom_button.dart';
import '../viewmodel/onboarding_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String text2;
  const CustomContainer({
    Key? key,
    required this.text,
    required this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final onbViewmodel = locator.get<OnboardingViewmodel>();

    return Observer(
      builder: (context) {
        return Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          height: displayHeight(context) * 0.5, // Yüzde 50
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: displayHeight(context) * 0.03, vertical: displayHeight(context) * 0.03),
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 31,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: displayHeight(context) * 0.01),
                  child: Text(
                    text2,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: displayHeight(context) * 0.05),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onbViewmodel.onbList.length,
                      (index) => Container(
                        height: 5,
                        width: onbViewmodel.currentIndex == index ? 30 : 5,
                        margin: const EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: onbViewmodel.currentIndex == index ? ColorConstants.buttonColor : Colors.grey,
                        ),
                      ),
                    ),
                  ),
                ),
                CustomButton(
                  text: const Text(
                    TextConstants.buttonText,
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    if (onbViewmodel.currentIndex == onbViewmodel.onbList.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const InAppPage(),
                        ),
                      );
                    }
                    onbViewmodel.controller.nextPage(
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.bounceIn,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
