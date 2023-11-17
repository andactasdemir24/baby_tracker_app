import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/images_constants.dart';
import '../../../../core/constants/text_constants.dart';
import '../model/onboarding_model.dart';
part 'onboarding_viewmodel.g.dart';

class OnboardingViewmodel = _OnboardingViewmodelBase with _$OnboardingViewmodel;

abstract class _OnboardingViewmodelBase with Store {
  @observable
  bool isSeen = false;

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
  Future<void> saveIsSeen() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.setBool('seen', true);
  }

  @action
  Future<void> loadIsSeen() async {
    final preferences = await SharedPreferences.getInstance();
    isSeen = preferences.getBool('seen') ?? false;
    print(isSeen);
  }

  @action
  void changeIndex(int index) {
    currentIndex = index;
  }
}
