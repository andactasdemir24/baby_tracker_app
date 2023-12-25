// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calender_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CalenderViewModel on _CalenderViewModelBase, Store {
  late final _$dateTimeAtom =
      Atom(name: '_CalenderViewModelBase.dateTime', context: context);

  @override
  DateTime get dateTime {
    _$dateTimeAtom.reportRead();
    return super.dateTime;
  }

  @override
  set dateTime(DateTime value) {
    _$dateTimeAtom.reportWrite(value, super.dateTime, () {
      super.dateTime = value;
    });
  }

  late final _$feedingListAtom =
      Atom(name: '_CalenderViewModelBase.feedingList', context: context);

  @override
  List<Feeding> get feedingList {
    _$feedingListAtom.reportRead();
    return super.feedingList;
  }

  @override
  set feedingList(List<Feeding> value) {
    _$feedingListAtom.reportWrite(value, super.feedingList, () {
      super.feedingList = value;
    });
  }

  late final _$sleepListAtom =
      Atom(name: '_CalenderViewModelBase.sleepList', context: context);

  @override
  List<Sleep> get sleepList {
    _$sleepListAtom.reportRead();
    return super.sleepList;
  }

  @override
  set sleepList(List<Sleep> value) {
    _$sleepListAtom.reportWrite(value, super.sleepList, () {
      super.sleepList = value;
    });
  }

  late final _$isSelectedAtom =
      Atom(name: '_CalenderViewModelBase.isSelected', context: context);

  @override
  bool get isSelected {
    _$isSelectedAtom.reportRead();
    return super.isSelected;
  }

  @override
  set isSelected(bool value) {
    _$isSelectedAtom.reportWrite(value, super.isSelected, () {
      super.isSelected = value;
    });
  }

  late final _$initAsyncAction =
      AsyncAction('_CalenderViewModelBase.init', context: context);

  @override
  Future<void> init() {
    return _$initAsyncAction.run(() => super.init());
  }

  late final _$getFeedingAsyncAction =
      AsyncAction('_CalenderViewModelBase.getFeeding', context: context);

  @override
  Future<void> getFeeding() {
    return _$getFeedingAsyncAction.run(() => super.getFeeding());
  }

  late final _$deleteFeedingAsyncAction =
      AsyncAction('_CalenderViewModelBase.deleteFeeding', context: context);

  @override
  Future<void> deleteFeeding(String id) {
    return _$deleteFeedingAsyncAction.run(() => super.deleteFeeding(id));
  }

  late final _$refreshFeedingListAsyncAction = AsyncAction(
      '_CalenderViewModelBase.refreshFeedingList',
      context: context);

  @override
  Future<void> refreshFeedingList() {
    return _$refreshFeedingListAsyncAction
        .run(() => super.refreshFeedingList());
  }

  late final _$getSleepAsyncAction =
      AsyncAction('_CalenderViewModelBase.getSleep', context: context);

  @override
  Future<void> getSleep() {
    return _$getSleepAsyncAction.run(() => super.getSleep());
  }

  late final _$deleteSleepAsyncAction =
      AsyncAction('_CalenderViewModelBase.deleteSleep', context: context);

  @override
  Future<void> deleteSleep(String id) {
    return _$deleteSleepAsyncAction.run(() => super.deleteSleep(id));
  }

  late final _$refreshSleepListAsyncAction =
      AsyncAction('_CalenderViewModelBase.refreshSleepList', context: context);

  @override
  Future<void> refreshSleepList() {
    return _$refreshSleepListAsyncAction.run(() => super.refreshSleepList());
  }

  late final _$_CalenderViewModelBaseActionController =
      ActionController(name: '_CalenderViewModelBase', context: context);

  @override
  Future<DateTime?> pickDate(BuildContext context) {
    final _$actionInfo = _$_CalenderViewModelBaseActionController.startAction(
        name: '_CalenderViewModelBase.pickDate');
    try {
      return super.pickDate(context);
    } finally {
      _$_CalenderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSelected(int index) {
    final _$actionInfo = _$_CalenderViewModelBaseActionController.startAction(
        name: '_CalenderViewModelBase.toggleSelected');
    try {
      return super.toggleSelected(index);
    } finally {
      _$_CalenderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addFeedingToList(Feeding newFeeding) {
    final _$actionInfo = _$_CalenderViewModelBaseActionController.startAction(
        name: '_CalenderViewModelBase.addFeedingToList');
    try {
      return super.addFeedingToList(newFeeding);
    } finally {
      _$_CalenderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleSelected1(int index) {
    final _$actionInfo = _$_CalenderViewModelBaseActionController.startAction(
        name: '_CalenderViewModelBase.toggleSelected1');
    try {
      return super.toggleSelected1(index);
    } finally {
      _$_CalenderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addSleepToList(Sleep newSleep) {
    final _$actionInfo = _$_CalenderViewModelBaseActionController.startAction(
        name: '_CalenderViewModelBase.addSleepToList');
    try {
      return super.addSleepToList(newSleep);
    } finally {
      _$_CalenderViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dateTime: ${dateTime},
feedingList: ${feedingList},
sleepList: ${sleepList},
isSelected: ${isSelected}
    ''';
  }
}
