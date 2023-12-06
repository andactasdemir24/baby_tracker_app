import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'feeding_viewmodel.g.dart';

class FeedingViewModel = _FeedingViewModelBase with _$FeedingViewModel;

abstract class _FeedingViewModelBase with Store {
  @observable
  TimeOfDay? time;

  @observable
  TextEditingController amountController = TextEditingController();

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
}
