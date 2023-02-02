// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaderboard_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

LeaderboardResponse _$LeaderboardResponseFromJson(Map<String, dynamic> json) {
  return _LeaderboardResponse.fromJson(json);
}

/// @nodoc
mixin _$LeaderboardResponse {
  @JsonKey()
  int? get currentPosition => throw _privateConstructorUsedError;
  @JsonKey()
  List<User> get users => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LeaderboardResponseCopyWith<LeaderboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LeaderboardResponseCopyWith<$Res> {
  factory $LeaderboardResponseCopyWith(
          LeaderboardResponse value, $Res Function(LeaderboardResponse) then) =
      _$LeaderboardResponseCopyWithImpl<$Res, LeaderboardResponse>;
  @useResult
  $Res call({@JsonKey() int? currentPosition, @JsonKey() List<User> users});
}

/// @nodoc
class _$LeaderboardResponseCopyWithImpl<$Res, $Val extends LeaderboardResponse>
    implements $LeaderboardResponseCopyWith<$Res> {
  _$LeaderboardResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPosition = freezed,
    Object? users = null,
  }) {
    return _then(_value.copyWith(
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int?,
      users: null == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LeaderboardResponseCopyWith<$Res>
    implements $LeaderboardResponseCopyWith<$Res> {
  factory _$$_LeaderboardResponseCopyWith(_$_LeaderboardResponse value,
          $Res Function(_$_LeaderboardResponse) then) =
      __$$_LeaderboardResponseCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey() int? currentPosition, @JsonKey() List<User> users});
}

/// @nodoc
class __$$_LeaderboardResponseCopyWithImpl<$Res>
    extends _$LeaderboardResponseCopyWithImpl<$Res, _$_LeaderboardResponse>
    implements _$$_LeaderboardResponseCopyWith<$Res> {
  __$$_LeaderboardResponseCopyWithImpl(_$_LeaderboardResponse _value,
      $Res Function(_$_LeaderboardResponse) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? currentPosition = freezed,
    Object? users = null,
  }) {
    return _then(_$_LeaderboardResponse(
      currentPosition: freezed == currentPosition
          ? _value.currentPosition
          : currentPosition // ignore: cast_nullable_to_non_nullable
              as int?,
      users: null == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as List<User>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_LeaderboardResponse implements _LeaderboardResponse {
  const _$_LeaderboardResponse(
      {@JsonKey() this.currentPosition,
      @JsonKey() final List<User> users = const []})
      : _users = users;

  factory _$_LeaderboardResponse.fromJson(Map<String, dynamic> json) =>
      _$$_LeaderboardResponseFromJson(json);

  @override
  @JsonKey()
  final int? currentPosition;
  final List<User> _users;
  @override
  @JsonKey()
  List<User> get users {
    if (_users is EqualUnmodifiableListView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_users);
  }

  @override
  String toString() {
    return 'LeaderboardResponse(currentPosition: $currentPosition, users: $users)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LeaderboardResponse &&
            (identical(other.currentPosition, currentPosition) ||
                other.currentPosition == currentPosition) &&
            const DeepCollectionEquality().equals(other._users, _users));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, currentPosition,
      const DeepCollectionEquality().hash(_users));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LeaderboardResponseCopyWith<_$_LeaderboardResponse> get copyWith =>
      __$$_LeaderboardResponseCopyWithImpl<_$_LeaderboardResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_LeaderboardResponseToJson(
      this,
    );
  }
}

abstract class _LeaderboardResponse implements LeaderboardResponse {
  const factory _LeaderboardResponse(
      {@JsonKey() final int? currentPosition,
      @JsonKey() final List<User> users}) = _$_LeaderboardResponse;

  factory _LeaderboardResponse.fromJson(Map<String, dynamic> json) =
      _$_LeaderboardResponse.fromJson;

  @override
  @JsonKey()
  int? get currentPosition;
  @override
  @JsonKey()
  List<User> get users;
  @override
  @JsonKey(ignore: true)
  _$$_LeaderboardResponseCopyWith<_$_LeaderboardResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
