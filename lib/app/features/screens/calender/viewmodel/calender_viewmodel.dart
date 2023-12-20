// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/getIt/locator.dart';
import '../../../../core/hive/datasource/feeding_datasource.dart';
part 'calender_viewmodel.g.dart';

class CalenderViewModel = _CalenderViewModelBase with _$CalenderViewModel;

abstract class _CalenderViewModelBase with Store {
  final feedingviewmodel = locator.get<FeedingDatasource>();

  @observable
  DateTime dateTime = DateTime.now();

  @observable
  List<Feeding> feedingList = [];

  @observable
  bool isSelected = false;

  _CalenderViewModelBase() {
    init();
  }

  @action
  Future<void> init() async {
    await getFeeding();
  }

  @action
  Future<void> getFeeding() async {
    feedingList.clear();
    var feedingData = await feedingviewmodel.getAll();
    feedingList.addAll(feedingData.data!);
  }

  @action
  Future<DateTime?> pickDate(BuildContext context) =>
      showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1900), lastDate: DateTime(2100));
}
