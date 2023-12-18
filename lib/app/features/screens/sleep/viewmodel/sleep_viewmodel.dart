import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../home/view/home_page.dart';
part 'sleep_viewmodel.g.dart';

class SleepViewModel = _SleepViewModelBase with _$SleepViewModel;

abstract class _SleepViewModelBase with Store {
  @observable
  TimeOfDay? time1;

  @observable
  TimeOfDay? time2;

  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  bool isButtonVisible2 = false;

  @observable
  bool isBlurred2 = false;

  @action
  void toggleBlur2(BuildContext context) {
    if (!isBlurred2) {
      isBlurred2 = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ));
        isBlurred2 = false;
      });
    }
  }

  @action
  Future<void> selectTime1(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time1 ?? TimeOfDay.now(),
    );
    if (newTime != null) {
      time1 = newTime;
    }
  }

  @action
  Future<void> selectTime2(BuildContext context) async {
    final TimeOfDay? newTime2 = await showTimePicker(
      context: context,
      initialTime: time2 ?? TimeOfDay.now(),
    );
    if (newTime2 != null) {
      time2 = newTime2;
    }
  }

  @action
  void changeVisible() {
    isButtonVisible2 = time1 != null && time2 != null && noteController.text.isNotEmpty;
  }

  @action
  void clearTime() {
    time1 = null;
    time2 = null;
    noteController.clear();
    changeVisible();
  }
}
