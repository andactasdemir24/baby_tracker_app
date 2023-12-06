// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feeding_viewmodel.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FeedingViewModel on _FeedingViewModelBase, Store {
  late final _$timeAtom =
      Atom(name: '_FeedingViewModelBase.time', context: context);

  @override
  TimeOfDay? get time {
    _$timeAtom.reportRead();
    return super.time;
  }

  @override
  set time(TimeOfDay? value) {
    _$timeAtom.reportWrite(value, super.time, () {
      super.time = value;
    });
  }

  late final _$selectTimeAsyncAction =
      AsyncAction('_FeedingViewModelBase.selectTime', context: context);

  @override
  Future<void> selectTime(BuildContext context) {
    return _$selectTimeAsyncAction.run(() => super.selectTime(context));
  }

  @override
  String toString() {
    return '''
time: ${time}
    ''';
  }
}
