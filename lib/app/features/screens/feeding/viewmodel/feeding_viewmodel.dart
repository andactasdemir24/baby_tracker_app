import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../home/view/home_page.dart';
part 'feeding_viewmodel.g.dart';

class FeedingViewModel = _FeedingViewModelBase with _$FeedingViewModel;

abstract class _FeedingViewModelBase with Store {
  @observable
  TimeOfDay? time;

  @observable
  TextEditingController amountController = TextEditingController();

  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  bool isButtonVisible = false;

  @observable
  bool isBlurred = false;

  @action
  void toggleBlur(BuildContext context) {
    if (!isBlurred) {
      isBlurred = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const HomePage(),
        ));
        isBlurred = false;
      });
    }
  }

  @action
  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: time ?? TimeOfDay.now(),
    );
    if (newTime != null) {
      time = newTime;
    }
  }

  @action
  void changeVisible() {
    isButtonVisible = time != null && amountController.text.isNotEmpty && noteController.text.isNotEmpty;
  }

  @action
  void clearTime() {
    time = null;
    amountController.clear();
    noteController.clear();
    changeVisible();
  }
}
