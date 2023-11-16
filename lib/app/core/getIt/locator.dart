import 'package:baby_tracker_app/app/features/screens/onboarding/viewmodel/onboarding_viewmodel.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => OnboardingViewmodel());
}
