import 'package:hive/hive.dart';

part 'sleep_model.g.dart';

@HiveType(typeId: 1)
class Sleep {
  @HiveField(0)
  DateTime fellSleep;

  @HiveField(1)
  DateTime wokeUp;

  @HiveField(2)
  String text;

  Sleep({required this.fellSleep, required this.wokeUp, required this.text});
}
