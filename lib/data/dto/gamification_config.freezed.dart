// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamification_config.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GamificationConfig _$GamificationConfigFromJson(Map<String, dynamic> json) {
  return _GamificationConfig.fromJson(json);
}

/// @nodoc
mixin _$GamificationConfig {
  @JsonKey()
  bool get badgesActive => throw _privateConstructorUsedError;
  @JsonKey()
  bool get leaderboardActive => throw _privateConstructorUsedError;
  @JsonKey()
  bool get onBoardingActive => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamificationConfigCopyWith<GamificationConfig> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamificationConfigCopyWith<$Res> {
  factory $GamificationConfigCopyWith(
          GamificationConfig value, $Res Function(GamificationConfig) then) =
      _$GamificationConfigCopyWithImpl<$Res, GamificationConfig>;
  @useResult
  $Res call(
      {@JsonKey() bool badgesActive,
      @JsonKey() bool leaderboardActive,
      @JsonKey() bool onBoardingActive});
}

/// @nodoc
class _$GamificationConfigCopyWithImpl<$Res, $Val extends GamificationConfig>
    implements $GamificationConfigCopyWith<$Res> {
  _$GamificationConfigCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgesActive = null,
    Object? leaderboardActive = null,
    Object? onBoardingActive = null,
  }) {
    return _then(_value.copyWith(
      badgesActive: null == badgesActive
          ? _value.badgesActive
          : badgesActive // ignore: cast_nullable_to_non_nullable
              as bool,
      leaderboardActive: null == leaderboardActive
          ? _value.leaderboardActive
          : leaderboardActive // ignore: cast_nullable_to_non_nullable
              as bool,
      onBoardingActive: null == onBoardingActive
          ? _value.onBoardingActive
          : onBoardingActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_GamificationConfigCopyWith<$Res>
    implements $GamificationConfigCopyWith<$Res> {
  factory _$$_GamificationConfigCopyWith(_$_GamificationConfig value,
          $Res Function(_$_GamificationConfig) then) =
      __$$_GamificationConfigCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey() bool badgesActive,
      @JsonKey() bool leaderboardActive,
      @JsonKey() bool onBoardingActive});
}

/// @nodoc
class __$$_GamificationConfigCopyWithImpl<$Res>
    extends _$GamificationConfigCopyWithImpl<$Res, _$_GamificationConfig>
    implements _$$_GamificationConfigCopyWith<$Res> {
  __$$_GamificationConfigCopyWithImpl(
      _$_GamificationConfig _value, $Res Function(_$_GamificationConfig) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? badgesActive = null,
    Object? leaderboardActive = null,
    Object? onBoardingActive = null,
  }) {
    return _then(_$_GamificationConfig(
      badgesActive: null == badgesActive
          ? _value.badgesActive
          : badgesActive // ignore: cast_nullable_to_non_nullable
              as bool,
      leaderboardActive: null == leaderboardActive
          ? _value.leaderboardActive
          : leaderboardActive // ignore: cast_nullable_to_non_nullable
              as bool,
      onBoardingActive: null == onBoardingActive
          ? _value.onBoardingActive
          : onBoardingActive // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GamificationConfig extends _GamificationConfig {
  const _$_GamificationConfig(
      {@JsonKey() this.badgesActive = false,
      @JsonKey() this.leaderboardActive = false,
      @JsonKey() this.onBoardingActive = false})
      : super._();

  factory _$_GamificationConfig.fromJson(Map<String, dynamic> json) =>
      _$$_GamificationConfigFromJson(json);

  @override
  @JsonKey()
  final bool badgesActive;
  @override
  @JsonKey()
  final bool leaderboardActive;
  @override
  @JsonKey()
  final bool onBoardingActive;

  @override
  String toString() {
    return 'GamificationConfig(badgesActive: $badgesActive, leaderboardActive: $leaderboardActive, onBoardingActive: $onBoardingActive)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GamificationConfig &&
            (identical(other.badgesActive, badgesActive) ||
                other.badgesActive == badgesActive) &&
            (identical(other.leaderboardActive, leaderboardActive) ||
                other.leaderboardActive == leaderboardActive) &&
            (identical(other.onBoardingActive, onBoardingActive) ||
                other.onBoardingActive == onBoardingActive));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, badgesActive, leaderboardActive, onBoardingActive);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GamificationConfigCopyWith<_$_GamificationConfig> get copyWith =>
      __$$_GamificationConfigCopyWithImpl<_$_GamificationConfig>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GamificationConfigToJson(
      this,
    );
  }
}

abstract class _GamificationConfig extends GamificationConfig {
  const factory _GamificationConfig(
      {@JsonKey() final bool badgesActive,
      @JsonKey() final bool leaderboardActive,
      @JsonKey() final bool onBoardingActive}) = _$_GamificationConfig;
  const _GamificationConfig._() : super._();

  factory _GamificationConfig.fromJson(Map<String, dynamic> json) =
      _$_GamificationConfig.fromJson;

  @override
  @JsonKey()
  bool get badgesActive;
  @override
  @JsonKey()
  bool get leaderboardActive;
  @override
  @JsonKey()
  bool get onBoardingActive;
  @override
  @JsonKey(ignore: true)
  _$$_GamificationConfigCopyWith<_$_GamificationConfig> get copyWith =>
      throw _privateConstructorUsedError;
}
