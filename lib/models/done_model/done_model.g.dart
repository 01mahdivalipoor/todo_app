// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DoneAdapter extends TypeAdapter<Done> {
  @override
  final int typeId = 1;

  @override
  Done read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Done()..done = fields[0] as String;
  }

  @override
  void write(BinaryWriter writer, Done obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.done);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DoneAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
