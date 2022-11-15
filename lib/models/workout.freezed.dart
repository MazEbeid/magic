// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'workout.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Workout {
  @HiveField(0)
  String get title => throw _privateConstructorUsedError;
  @HiveField(1)
  String get level => throw _privateConstructorUsedError;
  @HiveField(2)
  String get imagePath => throw _privateConstructorUsedError;
  @HiveField(3)
  List<WorkoutSet> get sets => throw _privateConstructorUsedError;
  @HiveField(4)
  String? get muscleGroup => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WorkoutCopyWith<Workout> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkoutCopyWith<$Res> {
  factory $WorkoutCopyWith(Workout value, $Res Function(Workout) then) =
      _$WorkoutCopyWithImpl<$Res, Workout>;
  @useResult
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) String level,
      @HiveField(2) String imagePath,
      @HiveField(3) List<WorkoutSet> sets,
      @HiveField(4) String? muscleGroup});
}

/// @nodoc
class _$WorkoutCopyWithImpl<$Res, $Val extends Workout>
    implements $WorkoutCopyWith<$Res> {
  _$WorkoutCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? level = null,
    Object? imagePath = null,
    Object? sets = null,
    Object? muscleGroup = freezed,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
      muscleGroup: freezed == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_WorkoutCopyWith<$Res> implements $WorkoutCopyWith<$Res> {
  factory _$$_WorkoutCopyWith(
          _$_Workout value, $Res Function(_$_Workout) then) =
      __$$_WorkoutCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@HiveField(0) String title,
      @HiveField(1) String level,
      @HiveField(2) String imagePath,
      @HiveField(3) List<WorkoutSet> sets,
      @HiveField(4) String? muscleGroup});
}

/// @nodoc
class __$$_WorkoutCopyWithImpl<$Res>
    extends _$WorkoutCopyWithImpl<$Res, _$_Workout>
    implements _$$_WorkoutCopyWith<$Res> {
  __$$_WorkoutCopyWithImpl(_$_Workout _value, $Res Function(_$_Workout) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? level = null,
    Object? imagePath = null,
    Object? sets = null,
    Object? muscleGroup = freezed,
  }) {
    return _then(_$_Workout(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as String,
      imagePath: null == imagePath
          ? _value.imagePath
          : imagePath // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<WorkoutSet>,
      muscleGroup: freezed == muscleGroup
          ? _value.muscleGroup
          : muscleGroup // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@HiveType(typeId: 0, adapterName: "WorkoutAdapter")
class _$_Workout extends _Workout {
  _$_Workout(
      {@HiveField(0) required this.title,
      @HiveField(1) required this.level,
      @HiveField(2) required this.imagePath,
      @HiveField(3) required final List<WorkoutSet> sets,
      @HiveField(4) this.muscleGroup})
      : _sets = sets,
        super._();

  @override
  @HiveField(0)
  final String title;
  @override
  @HiveField(1)
  final String level;
  @override
  @HiveField(2)
  final String imagePath;
  final List<WorkoutSet> _sets;
  @override
  @HiveField(3)
  List<WorkoutSet> get sets {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  @HiveField(4)
  final String? muscleGroup;

  @override
  String toString() {
    return 'Workout(title: $title, level: $level, imagePath: $imagePath, sets: $sets, muscleGroup: $muscleGroup)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Workout &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.imagePath, imagePath) ||
                other.imagePath == imagePath) &&
            const DeepCollectionEquality().equals(other._sets, _sets) &&
            (identical(other.muscleGroup, muscleGroup) ||
                other.muscleGroup == muscleGroup));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title, level, imagePath,
      const DeepCollectionEquality().hash(_sets), muscleGroup);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_WorkoutCopyWith<_$_Workout> get copyWith =>
      __$$_WorkoutCopyWithImpl<_$_Workout>(this, _$identity);
}

abstract class _Workout extends Workout {
  factory _Workout(
      {@HiveField(0) required final String title,
      @HiveField(1) required final String level,
      @HiveField(2) required final String imagePath,
      @HiveField(3) required final List<WorkoutSet> sets,
      @HiveField(4) final String? muscleGroup}) = _$_Workout;
  _Workout._() : super._();

  @override
  @HiveField(0)
  String get title;
  @override
  @HiveField(1)
  String get level;
  @override
  @HiveField(2)
  String get imagePath;
  @override
  @HiveField(3)
  List<WorkoutSet> get sets;
  @override
  @HiveField(4)
  String? get muscleGroup;
  @override
  @JsonKey(ignore: true)
  _$$_WorkoutCopyWith<_$_Workout> get copyWith =>
      throw _privateConstructorUsedError;
}
