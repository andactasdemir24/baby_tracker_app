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
  String toString() {
    return '''
dateTime: ${dateTime}
    ''';
  }
}
