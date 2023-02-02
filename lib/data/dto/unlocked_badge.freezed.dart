// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'unlocked_badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UnlockedBadge _$UnlockedBadgeFromJson(Map<String, dynamic> json) {
  return _UnlockedBadge.fromJson(json);
}

/// @nodoc
mixin _$UnlockedBadge {
  @JsonKey()
  int? get condition => throw _privateConstructorUsedError;
  @JsonKey()
  String get date => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnlockedBadgeCopyWith<UnlockedBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnlockedBadgeCopyWith<$Res> {
  factory $UnlockedBadgeCopyWith(
          UnlockedBadge value, $Res Function(UnlockedBadge) then) =
      _$UnlockedBadgeCopyWithImpl<$Res, UnlockedBadge>;
  @useResult
  $Res call({@JsonKey() int? condition, @JsonKey() String date});
}

/// @nodoc
class _$UnlockedBadgeCopyWithImpl<$Res, $Val extends UnlockedBadge>
    implements $UnlockedBadgeCopyWith<$Res> {
  _$UnlockedBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
    Object? date = null,
  }) {
    return _then(_value.copyWith(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UnlockedBadgeCopyWith<$Res>
    implements $UnlockedBadgeCopyWith<$Res> {
  factory _$$_UnlockedBadgeCopyWith(
          _$_UnlockedBadge value, $Res Function(_$_UnlockedBadge) then) =
      __$$_UnlockedBadgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey() int? condition, @JsonKey() String date});
}

/// @nodoc
class __$$_UnlockedBadgeCopyWithImpl<$Res>
    extends _$UnlockedBadgeCopyWithImpl<$Res, _$_UnlockedBadge>
    implements _$$_UnlockedBadgeCopyWith<$Res> {
  __$$_UnlockedBadgeCopyWithImpl(
      _$_UnlockedBadge _value, $Res Function(_$_UnlockedBadge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
    Object? date = null,
  }) {
    return _then(_$_UnlockedBadge(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as int?,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UnlockedBadge implements _UnlockedBadge {
  const _$_UnlockedBadge(
      {@JsonKey() this.condition, @JsonKey() this.date = ''});

  factory _$_UnlockedBadge.fromJson(Map<String, dynamic> json) =>
      _$$_UnlockedBadgeFromJson(json);

  @override
  @JsonKey()
  final int? condition;
  @override
  @JsonKey()
  final String date;

  @override
  String toString() {
    return 'UnlockedBadge(condition: $condition, date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UnlockedBadge &&
            (identical(other.condition, condition) ||
                other.condition == condition) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, condition, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UnlockedBadgeCopyWith<_$_UnlockedBadge> get copyWith =>
      __$$_UnlockedBadgeCopyWithImpl<_$_UnlockedBadge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UnlockedBadgeToJson(
      this,
    );
  }
}

abstract class _UnlockedBadge implements UnlockedBadge {
  const factory _UnlockedBadge(
      {@JsonKey() final int? condition,
      @JsonKey() final String date}) = _$_UnlockedBadge;

  factory _UnlockedBadge.fromJson(Map<String, dynamic> json) =
      _$_UnlockedBadge.fromJson;

  @override
  @JsonKey()
  int? get condition;
  @override
  @JsonKey()
  String get date;
  @override
  @JsonKey(ignore: true)
  _$$_UnlockedBadgeCopyWith<_$_UnlockedBadge> get copyWith =>
      throw _privateConstructorUsedError;
}
