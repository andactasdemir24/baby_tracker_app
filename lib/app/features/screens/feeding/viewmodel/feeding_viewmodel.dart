import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
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
