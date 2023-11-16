import 'package:baby_tracker_app/app/core/constants/images_constants.dart';
import 'package:baby_tracker_app/app/core/constants/text_constants.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String description;

  OnboardingModel(this.image, this.title, this.description);

  List<OnboardingModel> onbList = [
    OnboardingModel(ImageConstants.onboarding1, TextConstants.onb1Title, TextConstants.onb1Title),
    OnboardingModel(ImageConstants.onboarding2, TextConstants.onb2Title, TextConstants.onb2Description),
  ];
}
