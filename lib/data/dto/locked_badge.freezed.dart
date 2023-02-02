// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locked_badge.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LockedBadge _$LockedBadgeFromJson(Map<String, dynamic> json) {
  return _LockedBadge.fromJson(json);
}

/// @nodoc
mixin _$LockedBadge {
  @JsonKey()
  int? get condition => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LockedBadgeCopyWith<LockedBadge> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LockedBadgeCopyWith<$Res> {
  factory $LockedBadgeCopyWith(
          LockedBadge value, $Res Function(LockedBadge) then) =
      _$LockedBadgeCopyWithImpl<$Res, LockedBadge>;
  @useResult
  $Res call({@JsonKey() int? condition});
}

/// @nodoc
class _$LockedBadgeCopyWithImpl<$Res, $Val extends LockedBadge>
    implements $LockedBadgeCopyWith<$Res> {
  _$LockedBadgeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
  }) {
    return _then(_value.copyWith(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LockedBadgeCopyWith<$Res>
    implements $LockedBadgeCopyWith<$Res> {
  factory _$$_LockedBadgeCopyWith(
          _$_LockedBadge value, $Res Function(_$_LockedBadge) then) =
      __$$_LockedBadgeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey() int? condition});
}

/// @nodoc
class __$$_LockedBadgeCopyWithImpl<$Res>
    extends _$LockedBadgeCopyWithImpl<$Res, _$_LockedBadge>
    implements _$$_LockedBadgeCopyWith<$Res> {
  __$$_LockedBadgeCopyWithImpl(
      _$_LockedBadge _value, $Res Function(_$_LockedBadge) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? condition = freezed,
  }) {
    return _then(_$_LockedBadge(
      condition: freezed == condition
          ? _value.condition
          : condition // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LockedBadge implements _LockedBadge {
  const _$_LockedBadge({@JsonKey() this.condition});

  factory _$_LockedBadge.fromJson(Map<String, dynamic> json) =>
      _$$_LockedBadgeFromJson(json);

  @override
  @JsonKey()
  final int? condition;

  @override
  String toString() {
    return 'LockedBadge(condition: $condition)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LockedBadge &&
            (identical(other.condition, condition) ||
                other.condition == condition));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, condition);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LockedBadgeCopyWith<_$_LockedBadge> get copyWith =>
      __$$_LockedBadgeCopyWithImpl<_$_LockedBadge>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LockedBadgeToJson(
      this,
    );
  }
}

abstract class _LockedBadge implements LockedBadge {
  const factory _LockedBadge({@JsonKey() final int? condition}) =
      _$_LockedBadge;

  factory _LockedBadge.fromJson(Map<String, dynamic> json) =
      _$_LockedBadge.fromJson;

  @override
  @JsonKey()
  int? get condition;
  @override
  @JsonKey(ignore: true)
  _$$_LockedBadgeCopyWith<_$_LockedBadge> get copyWith =>
      throw _privateConstructorUsedError;
}
