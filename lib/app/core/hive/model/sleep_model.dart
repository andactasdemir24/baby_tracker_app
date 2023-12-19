import 'package:hive/hive.dart';

part 'sleep_model.g.dart';

@HiveType(typeId: 1)
class Sleep {
  @HiveField(0)
  String? id;

  @HiveField(1)
  DateTime? fellSleep;

  @HiveField(2)
  DateTime? wokeUp;

  @HiveField(3)
  String? text;

  Sleep({required this.id, required this.fellSleep, required this.wokeUp, required this.text});
}
