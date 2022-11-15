// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workout.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WorkoutAdapter extends TypeAdapter<_$_Workout> {
  @override
  final int typeId = 0;

  @override
  _$_Workout read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Workout(
      title: fields[0] as String,
      level: fields[1] as String,
      imagePath: fields[2] as String,
      sets: (fields[3] as List).cast<WorkoutSet>(),
      muscleGroup: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, _$_Workout obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.level)
      ..writeByte(2)
      ..write(obj.imagePath)
      ..writeByte(4)
      ..write(obj.muscleGroup)
      ..writeByte(3)
      ..write(obj.sets);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WorkoutAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
