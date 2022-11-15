// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workout_set.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WorkoutSet {
  @HiveField(1)
  String get number => throw _privateConstructorUsedError;
  @HiveField(2)
  String? get reps => throw _privateConstructorUsedError;
  @HiveField(3)
  String? get weight => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get id => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutSetCopyWith<WorkoutSet> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutSetCopyWith<$Res> {
  factory $WorkoutSetCopyWith(
          WorkoutSet value, $Res Function(WorkoutSet) then) =
      _$WorkoutSetCopyWithImpl<$Res, WorkoutSet>;
  @useResult
  $Res call(
      {@HiveField(1) String number,
      @HiveField(2) String? reps,
      @HiveField(3) String? weight,
      @HiveField(4) String? id});
}

/// @nodoc
class _$WorkoutSetCopyWithImpl<$Res, $Val extends WorkoutSet>
    implements $WorkoutSetCopyWith<$Res> {
  _$WorkoutSetCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? id = freezed,
  }) {
    return _then(_value.copyWith(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      reps: freezed == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutSetCopyWith<$Res>
    implements $WorkoutSetCopyWith<$Res> {
  factory _$$_WorkoutSetCopyWith(
          _$_WorkoutSet value, $Res Function(_$_WorkoutSet) then) =
      __$$_WorkoutSetCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(1) String number,
      @HiveField(2) String? reps,
      @HiveField(3) String? weight,
      @HiveField(4) String? id});
}

/// @nodoc
class __$$_WorkoutSetCopyWithImpl<$Res>
    extends _$WorkoutSetCopyWithImpl<$Res, _$_WorkoutSet>
    implements _$$_WorkoutSetCopyWith<$Res> {
  __$$_WorkoutSetCopyWithImpl(
      _$_WorkoutSet _value, $Res Function(_$_WorkoutSet) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? number = null,
    Object? reps = freezed,
    Object? weight = freezed,
    Object? id = freezed,
  }) {
    return _then(_$_WorkoutSet(
      number: null == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String,
      reps: freezed == reps
          ? _value.reps
          : reps // ignore: cast_nullable_to_non_nullable
              as String?,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 1, adapterName: "WorkoutSetAdapter")
class _$_WorkoutSet implements _WorkoutSet {
  _$_WorkoutSet(
      {@HiveField(1) required this.number,
      @HiveField(2) this.reps,
      @HiveField(3) this.weight,
      @HiveField(4) this.id});

  @override
  @HiveField(1)
  final String number;
  @override
  @HiveField(2)
  final String? reps;
  @override
  @HiveField(3)
  final String? weight;
  @override
  @HiveField(4)
  final String? id;

  @override
  String toString() {
    return 'WorkoutSet(number: $number, reps: $reps, weight: $weight, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_WorkoutSet &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.reps, reps) || other.reps == reps) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, number, reps, weight, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutSetCopyWith<_$_WorkoutSet> get copyWith =>
      __$$_WorkoutSetCopyWithImpl<_$_WorkoutSet>(this, _$identity);
}

abstract class _WorkoutSet implements WorkoutSet {
  factory _WorkoutSet(
      {@HiveField(1) required final String number,
      @HiveField(2) final String? reps,
      @HiveField(3) final String? weight,
      @HiveField(4) final String? id}) = _$_WorkoutSet;

  @override
  @HiveField(1)
  String get number;
  @override
  @HiveField(2)
  String? get reps;
  @override
  @HiveField(3)
  String? get weight;
  @override
  @HiveField(4)
  String? get id;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutSetCopyWith<_$_WorkoutSet> get copyWith =>
      throw _privateConstructorUsedError;
}
