// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'symptomps_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SymptompsAdapter extends TypeAdapter<Symptomps> {
  @override
  final int typeId = 2;

  @override
  Symptomps read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Symptomps(
      symTime: fields[0] as DateTime,
      sympList: (fields[1] as List).cast<SymptopmsModel>(),
      text: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Symptomps obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.symTime)
      ..writeByte(1)
      ..write(obj.sympList)
      ..writeByte(2)
      ..write(obj.text);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SymptompsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
