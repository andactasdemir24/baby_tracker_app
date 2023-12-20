import 'package:baby_tracker_app/app/core/hive/datasource/feeding_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/getIt/locator.dart';
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

  final feedingviewmodel = locator.get<FeedingDatasource>();

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

  @action
  Future<void> addFeeding() async {
    var uuid = const Uuid();
    if (time != null) {
      final now = DateTime.now();
      final feedingTime = DateTime(
        now.year,
        now.month,
        now.day,
        time!.hour,
        time!.minute,
      );
      Feeding feedingModel = Feeding(
        id: uuid.v4(),
        time: feedingTime,
        amount: int.parse(amountController.text),
        text: noteController.text,
      );
      await feedingviewmodel.add(feedingModel);
    }
  }
}
