import 'package:hive/hive.dart';

part 'feeding_model.g.dart';

@HiveType(typeId: 0)
class Feeding {
  @HiveField(0)
  DateTime time;

  @HiveField(1)
  int amount;

  @HiveField(2)
  String text;

  Feeding({required this.time, required this.amount, required this.text});
}
