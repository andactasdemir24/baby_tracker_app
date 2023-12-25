// ignore_for_file: non_constant_identifier_names, library_private_types_in_public_api

import 'package:baby_tracker_app/app/core/hive/datasource/sleep_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/datasource/symptomps_datasource.dart';
import 'package:baby_tracker_app/app/core/hive/model/feeding_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/sleep_model.dart';
import 'package:baby_tracker_app/app/core/hive/model/symptomps_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import '../../../../core/getIt/locator.dart';
import '../../../../core/hive/datasource/feeding_datasource.dart';
part 'calender_viewmodel.g.dart';

class CalenderViewModel = _CalenderViewModelBase with _$CalenderViewModel;

abstract class _CalenderViewModelBase with Store {
  var feedingDatasource = locator.get<FeedingDatasource>();
  var sleepDatasource = locator.get<SleepDatasource>();
  var symptompsDatasource = locator.get<SymptompsDatasource>();

  @observable
  DateTime dateTime = DateTime.now();

  @observable
  List<Feeding> feedingList = [];

  @observable
  List<Sleep> sleepList = [];

  @observable
  List<Symptomps> symptompsList = [];

  @observable
  bool isSelected = false;

  _CalenderViewModelBase() {
    init();
  }

  @action
  Future<void> init() async {
    await getFeeding();
    await getSleep();
    await getSymptomps();
  }

  @action
  Future<DateTime?> pickDate(BuildContext context) =>
      showDatePicker(context: context, initialDate: dateTime, firstDate: DateTime(1900), lastDate: DateTime(2100));

  //ALL FEEDİNG FUNCTİON -------------
  //bastığım indexe göre algılama
  @action
  void toggleSelected(int index) {
    var feeding = feedingList[index];
    var updatedFeeding = feeding.copyWith(isSelected: !feeding.isSelected);
    feedingList = List.from(feedingList)..[index] = updatedFeeding;
  }

  @action
  void addFeedingToList(Feeding newFeeding) {
    feedingList = List.from(feedingList)..add(newFeeding);
  }

  @action
  Future<void> getFeeding() async {
    var feedingData = await feedingDatasource.getAll();
    feedingList.addAll(feedingData.data!);
  }

  @action
  Future<void> deleteFeeding(String id) async {
    await feedingDatasource.delete(id);
    feedingList.removeWhere((feeding) => feeding.id.toString() == id);
  }

  @action
  Future<void> refreshFeedingList() async {
    var feedingData = await feedingDatasource.getAll();
    feedingList = feedingData.data ?? [];
  }

  //ALL SLEEP FUNCTİON --------
  @action
  void toggleSelected1(int index) {
    var sleep = sleepList[index];
    var updatedSleep = sleep.copyWith(isSelected: !sleep.isSelected);
    sleepList = List.from(sleepList)..[index] = updatedSleep;
  }

  @action
  Future<void> getSleep() async {
    var sleepData = await sleepDatasource.getAll();
    sleepList.addAll(sleepData.data!);
  }

  @action
  void addSleepToList(Sleep newSleep) {
    sleepList = List.from(sleepList)..add(newSleep);
  }

  @action
  Future<void> deleteSleep(String id) async {
    await sleepDatasource.delete(id);
    sleepList.removeWhere((sleep) => sleep.id.toString() == id);
  }

  @action
  Future<void> refreshSleepList() async {
    var sleepData = await sleepDatasource.getAll();
    sleepList = sleepData.data ?? [];
  }

  //ALL SYMPTOMPS FUNCTİON
  @action
  void toogleSelected2(int index) {
    var symptomps = symptompsList[index];
    var updatedSymptomps = symptomps.copyWith(isSelected: !symptomps.isSelected);
    symptompsList = List.from(symptompsList)..[index] = updatedSymptomps;
  }

  @action
  Future<void> getSymptomps() async {
    var symptompsData = await symptompsDatasource.getAll();
    symptompsList.addAll(symptompsData.data!);
  }

  @action
  void addSymptompsToList(Symptomps newSymptomps) {
    symptompsList = List.from(symptompsList)..add(newSymptomps);
  }

  @action
  Future<void> deleteSymptomps(String id) async {
    await symptompsDatasource.delete(id);
    symptompsList.removeWhere((symptomps) => symptomps.id.toString() == id);
  }

  @action
  Future<void> refreshSymptompsList() async {
    var sympData = await symptompsDatasource.getAll();
    symptompsList = sympData.data ?? [];
  }
}
