// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionAdapter extends TypeAdapter<_$_Session> {
  @override
  final int typeId = 2;

  @override
  _$_Session read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Session(
      workouts: (fields[0] as List).cast<Workout>(),
      date: fields[1] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Session obj) {
    writer
      ..writeByte(2)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(0)
      ..write(obj.workouts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
