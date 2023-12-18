import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'calender_viewmodel.g.dart';

class CalenderViewModel = _CalenderViewModelBase with _$CalenderViewModel;

abstract class _CalenderViewModelBase with Store {
  @observable
  DateTime dateTime = DateTime.now();

  @action
  Future<DateTime?> pickDate(BuildContext context) =>
      showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1900), lastDate: DateTime(2100));
}
