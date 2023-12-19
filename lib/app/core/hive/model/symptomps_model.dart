import 'package:hive/hive.dart';

import '../../../features/model/symptomps_model.dart';

part 'symptomps_model.g.dart';

@HiveType(typeId: 2)
class Symptomps {
  @HiveField(0)
  String? id;

  @HiveField(1)
  DateTime? symTime;

  @HiveField(2)
  List<SymptopmsModel> sympList;

  @HiveField(3)
  String? text;

  Symptomps({required this.id, required this.symTime, required this.sympList, required this.text});
}
