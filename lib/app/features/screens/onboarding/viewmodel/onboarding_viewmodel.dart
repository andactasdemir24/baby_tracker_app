import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../model/onboarding_model.dart';
part 'onboarding_viewmodel.g.dart';

class OnboardingViewmodel = _OnboardingViewmodelBase with _$OnboardingViewmodel;

abstract class _OnboardingViewmodelBase with Store {
  @observable
  PageController controller = PageController();

  @observable
  List<OnboardingModel> onbList = [
    OnboardingModel(ImageConstants.onboarding1, TextConstants.onb1Title, TextConstants.onb1Description),
    OnboardingModel(ImageConstants.onboarding2, TextConstants.onb2Title, TextConstants.onb2Description),
  ];

  @observable
  int currentIndex = 0;

  @action
  void changeIndex(int index) {
    currentIndex = index;
  }
}
