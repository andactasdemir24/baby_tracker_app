import 'package:baby_tracker_app/app/features/model/symptomps_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../view/symptomps_page.dart';
part 'symptomps_viewmodel.g.dart';

class SymptompsViewmodel = _SymptompsViewmodelBase with _$SymptompsViewmodel;

abstract class _SymptompsViewmodelBase with Store {
  @observable
  TimeOfDay? time3;

  @observable
  TextEditingController noteController = TextEditingController();

  @observable
  bool isButtonVisible3 = false;

  @observable
  ObservableList<SymptopmsModel> selectedIndices = ObservableList<SymptopmsModel>();

  @observable
  List<SymptopmsModel> symptompsList = [
    SymptopmsModel(image: 'assets/images/RunnyNose.png', name: 'Runny Nose'),
    SymptopmsModel(image: 'assets/images/Heartburn.png', name: 'Heartburn'),
    SymptopmsModel(image: 'assets/images/Noappetive.png', name: 'No Appetite'),
    SymptopmsModel(image: 'assets/images/rush.png', name: 'Rush'),
    SymptopmsModel(image: 'assets/images/lowEnergy.png', name: 'Low Energy'),
    SymptopmsModel(image: 'assets/images/Nussea.png', name: 'Nausea'),
    SymptopmsModel(image: 'assets/images/Cough.png', name: 'Cough'),
    SymptopmsModel(image: 'assets/images/Fever.png', name: 'Fever'),
  ];

  @observable
  bool isBlurred3 = false;

  @action
  void toggleBlur3(BuildContext context) {
    if (!isBlurred3) {
      isBlurred3 = true;
      Future.delayed(const Duration(milliseconds: 1500), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => const SymptompsPage(),
        ));
        isBlurred3 = false;
      });
    }
  }

  @action
  Future<void> selectTime3(BuildContext context) async {
    final TimeOfDay? newTime3 = await showTimePicker(
      context: context,
      initialTime: time3 ?? TimeOfDay.now(),
    );
    if (newTime3 != null) {
      time3 = newTime3;
    }
  }

  @action
  Future<void> changeVisible() async {
    isButtonVisible3 = time3 != null && selectedIndices.isNotEmpty && noteController.text.isNotEmpty;
  }

  @action
  Future<void> clearTime() async {
    time3 = null;
    noteController.clear();
    changeVisible();
  }

  @action
  Future<void> toggleSelectedIndex(SymptopmsModel symptopmsModel) async {
    runInAction(() {
      if (selectedIndices.contains(symptopmsModel)) {
        selectedIndices.remove(symptopmsModel);
      } else {
        selectedIndices.add(symptopmsModel);
      }
    });
  }
}
