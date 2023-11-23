// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sleep_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SleepAdapter extends TypeAdapter<Sleep> {
  @override
  final int typeId = 1;

  @override
  Sleep read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sleep(
      fellSleep: fields[0] as DateTime,
      wokeUp: fields[1] as DateTime,
      text: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Sleep obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.fellSleep)
      ..writeByte(1)
      ..write(obj.wokeUp)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SleepAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
