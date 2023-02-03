// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gamification_result_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GamificationResultResponse _$GamificationResultResponseFromJson(
    Map<String, dynamic> json) {
  return _GamificationResultResponse.fromJson(json);
}

/// @nodoc
mixin _$GamificationResultResponse {
  @JsonKey()
  int get gainedPoints => throw _privateConstructorUsedError;
  @JsonKey()
  List<UnlockedBadge> get newUnlockedBadges =>
      throw _privateConstructorUsedError;
  @JsonKey()
  bool get hasNewLeaderboardPosition => throw _privateConstructorUsedError;
  @JsonKey()
  LeaderboardResponse? get leaderboard => throw _privateConstructorUsedError;
  @JsonKey()
  User get user => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GamificationResultResponseCopyWith<GamificationResultResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamificationResultResponseCopyWith<$Res> {
  factory $GamificationResultResponseCopyWith(GamificationResultResponse value,
          $Res Function(GamificationResultResponse) then) =
      _$GamificationResultResponseCopyWithImpl<$Res,
          GamificationResultResponse>;
  @useResult
  $Res call(
      {@JsonKey() int gainedPoints,
      @JsonKey() List<UnlockedBadge> newUnlockedBadges,
      @JsonKey() bool hasNewLeaderboardPosition,
      @JsonKey() LeaderboardResponse? leaderboard,
      @JsonKey() User user});

  $LeaderboardResponseCopyWith<$Res>? get leaderboard;
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class _$GamificationResultResponseCopyWithImpl<$Res,
        $Val extends GamificationResultResponse>
    implements $GamificationResultResponseCopyWith<$Res> {
  _$GamificationResultResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gainedPoints = null,
    Object? newUnlockedBadges = null,
    Object? hasNewLeaderboardPosition = null,
    Object? leaderboard = freezed,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      gainedPoints: null == gainedPoints
          ? _value.gainedPoints
          : gainedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      newUnlockedBadges: null == newUnlockedBadges
          ? _value.newUnlockedBadges
          : newUnlockedBadges // ignore: cast_nullable_to_non_nullable
              as List<UnlockedBadge>,
      hasNewLeaderboardPosition: null == hasNewLeaderboardPosition
          ? _value.hasNewLeaderboardPosition
          : hasNewLeaderboardPosition // ignore: cast_nullable_to_non_nullable
              as bool,
      leaderboard: freezed == leaderboard
          ? _value.leaderboard
          : leaderboard // ignore: cast_nullable_to_non_nullable
              as LeaderboardResponse?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LeaderboardResponseCopyWith<$Res>? get leaderboard {
    if (_value.leaderboard == null) {
      return null;
    }

    return $LeaderboardResponseCopyWith<$Res>(_value.leaderboard!, (value) {
      return _then(_value.copyWith(leaderboard: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_GamificationResultResponseCopyWith<$Res>
    implements $GamificationResultResponseCopyWith<$Res> {
  factory _$$_GamificationResultResponseCopyWith(
          _$_GamificationResultResponse value,
          $Res Function(_$_GamificationResultResponse) then) =
      __$$_GamificationResultResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey() int gainedPoints,
      @JsonKey() List<UnlockedBadge> newUnlockedBadges,
      @JsonKey() bool hasNewLeaderboardPosition,
      @JsonKey() LeaderboardResponse? leaderboard,
      @JsonKey() User user});

  @override
  $LeaderboardResponseCopyWith<$Res>? get leaderboard;
  @override
  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$_GamificationResultResponseCopyWithImpl<$Res>
    extends _$GamificationResultResponseCopyWithImpl<$Res,
        _$_GamificationResultResponse>
    implements _$$_GamificationResultResponseCopyWith<$Res> {
  __$$_GamificationResultResponseCopyWithImpl(
      _$_GamificationResultResponse _value,
      $Res Function(_$_GamificationResultResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gainedPoints = null,
    Object? newUnlockedBadges = null,
    Object? hasNewLeaderboardPosition = null,
    Object? leaderboard = freezed,
    Object? user = null,
  }) {
    return _then(_$_GamificationResultResponse(
      gainedPoints: null == gainedPoints
          ? _value.gainedPoints
          : gainedPoints // ignore: cast_nullable_to_non_nullable
              as int,
      newUnlockedBadges: null == newUnlockedBadges
          ? _value._newUnlockedBadges
          : newUnlockedBadges // ignore: cast_nullable_to_non_nullable
              as List<UnlockedBadge>,
      hasNewLeaderboardPosition: null == hasNewLeaderboardPosition
          ? _value.hasNewLeaderboardPosition
          : hasNewLeaderboardPosition // ignore: cast_nullable_to_non_nullable
              as bool,
      leaderboard: freezed == leaderboard
          ? _value.leaderboard
          : leaderboard // ignore: cast_nullable_to_non_nullable
              as LeaderboardResponse?,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_GamificationResultResponse implements _GamificationResultResponse {
  const _$_GamificationResultResponse(
      {@JsonKey() this.gainedPoints = 0,
      @JsonKey() final List<UnlockedBadge> newUnlockedBadges = const [],
      @JsonKey() this.hasNewLeaderboardPosition = false,
      @JsonKey() this.leaderboard,
      @JsonKey() this.user = User.empty})
      : _newUnlockedBadges = newUnlockedBadges;

  factory _$_GamificationResultResponse.fromJson(Map<String, dynamic> json) =>
      _$$_GamificationResultResponseFromJson(json);

  @override
  @JsonKey()
  final int gainedPoints;
  final List<UnlockedBadge> _newUnlockedBadges;
  @override
  @JsonKey()
  List<UnlockedBadge> get newUnlockedBadges {
    if (_newUnlockedBadges is EqualUnmodifiableListView)
      return _newUnlockedBadges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newUnlockedBadges);
  }

  @override
  @JsonKey()
  final bool hasNewLeaderboardPosition;
  @override
  @JsonKey()
  final LeaderboardResponse? leaderboard;
  @override
  @JsonKey()
  final User user;

  @override
  String toString() {
    return 'GamificationResultResponse(gainedPoints: $gainedPoints, newUnlockedBadges: $newUnlockedBadges, hasNewLeaderboardPosition: $hasNewLeaderboardPosition, leaderboard: $leaderboard, user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GamificationResultResponse &&
            (identical(other.gainedPoints, gainedPoints) ||
                other.gainedPoints == gainedPoints) &&
            const DeepCollectionEquality()
                .equals(other._newUnlockedBadges, _newUnlockedBadges) &&
            (identical(other.hasNewLeaderboardPosition,
                    hasNewLeaderboardPosition) ||
                other.hasNewLeaderboardPosition == hasNewLeaderboardPosition) &&
            (identical(other.leaderboard, leaderboard) ||
                other.leaderboard == leaderboard) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      gainedPoints,
      const DeepCollectionEquality().hash(_newUnlockedBadges),
      hasNewLeaderboardPosition,
      leaderboard,
      user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_GamificationResultResponseCopyWith<_$_GamificationResultResponse>
      get copyWith => __$$_GamificationResultResponseCopyWithImpl<
          _$_GamificationResultResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_GamificationResultResponseToJson(
      this,
    );
  }
}

abstract class _GamificationResultResponse
    implements GamificationResultResponse {
  const factory _GamificationResultResponse(
      {@JsonKey() final int gainedPoints,
      @JsonKey() final List<UnlockedBadge> newUnlockedBadges,
      @JsonKey() final bool hasNewLeaderboardPosition,
      @JsonKey() final LeaderboardResponse? leaderboard,
      @JsonKey() final User user}) = _$_GamificationResultResponse;

  factory _GamificationResultResponse.fromJson(Map<String, dynamic> json) =
      _$_GamificationResultResponse.fromJson;

  @override
  @JsonKey()
  int get gainedPoints;
  @override
  @JsonKey()
  List<UnlockedBadge> get newUnlockedBadges;
  @override
  @JsonKey()
  bool get hasNewLeaderboardPosition;
  @override
  @JsonKey()
  LeaderboardResponse? get leaderboard;
  @override
  @JsonKey()
  User get user;
  @override
  @JsonKey(ignore: true)
  _$$_GamificationResultResponseCopyWith<_$_GamificationResultResponse>
      get copyWith => throw _privateConstructorUsedError;
}
