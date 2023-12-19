import 'package:hive/hive.dart';

part 'feeding_model.g.dart';

@HiveType(typeId: 0)
class Feeding {
  @HiveField(0)
  String? id;

  @HiveField(1)
  DateTime? time;

  @HiveField(2)
  int? amount;

  @HiveField(3)
  String? text;

  Feeding({required this.id, required this.time, required this.amount, required this.text});
}
