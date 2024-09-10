// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sheet.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SheetAdapter extends TypeAdapter<Sheet> {
  @override
  final int typeId = 1;

  @override
  Sheet read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Sheet(
      id: fields[0] as String,
      name: fields[1] as String,
      count: fields[2] as int,
      filledCount: fields[3] as int,
      lastFilledDate: fields[4] as DateTime?,
      ableToCheck: fields[5] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Sheet obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.count)
      ..writeByte(3)
      ..write(obj.filledCount)
      ..writeByte(4)
      ..write(obj.lastFilledDate)
      ..writeByte(5)
      ..write(obj.ableToCheck);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SheetAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
