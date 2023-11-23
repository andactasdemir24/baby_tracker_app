import 'package:hive/hive.dart';

import '../../../features/model/symptomps_model.dart';

part 'symptomps_model.g.dart';

@HiveType(typeId: 2)
class Symptomps {
  @HiveField(0)
  DateTime symTime;

  @HiveField(1)
  List<SymptopmsModel> sympList;

  @HiveField(2)
  String text;

  Symptomps({required this.symTime, required this.sympList, required this.text});
}
