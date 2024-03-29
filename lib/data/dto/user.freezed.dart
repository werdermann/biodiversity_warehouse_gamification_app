// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
mixin _$User {
  @JsonKey()
  int? get id => throw _privateConstructorUsedError;
  @JsonKey()
  String? get username => throw _privateConstructorUsedError;
  @JsonKey()
  bool get isAdmin => throw _privateConstructorUsedError;
  @JsonKey()
  int get points => throw _privateConstructorUsedError;
  @JsonKey()
  List<UnlockedBadge> get unlockedBadges => throw _privateConstructorUsedError;
  @JsonKey()
  List<LockedBadge> get lockedBadges => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {@JsonKey() int? id,
      @JsonKey() String? username,
      @JsonKey() bool isAdmin,
      @JsonKey() int points,
      @JsonKey() List<UnlockedBadge> unlockedBadges,
      @JsonKey() List<LockedBadge> lockedBadges});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? isAdmin = null,
    Object? points = null,
    Object? unlockedBadges = null,
    Object? lockedBadges = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      unlockedBadges: null == unlockedBadges
          ? _value.unlockedBadges
          : unlockedBadges // ignore: cast_nullable_to_non_nullable
              as List<UnlockedBadge>,
      lockedBadges: null == lockedBadges
          ? _value.lockedBadges
          : lockedBadges // ignore: cast_nullable_to_non_nullable
              as List<LockedBadge>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey() int? id,
      @JsonKey() String? username,
      @JsonKey() bool isAdmin,
      @JsonKey() int points,
      @JsonKey() List<UnlockedBadge> unlockedBadges,
      @JsonKey() List<LockedBadge> lockedBadges});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? isAdmin = null,
    Object? points = null,
    Object? unlockedBadges = null,
    Object? lockedBadges = null,
  }) {
    return _then(_$_User(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      unlockedBadges: null == unlockedBadges
          ? _value._unlockedBadges
          : unlockedBadges // ignore: cast_nullable_to_non_nullable
              as List<UnlockedBadge>,
      lockedBadges: null == lockedBadges
          ? _value._lockedBadges
          : lockedBadges // ignore: cast_nullable_to_non_nullable
              as List<LockedBadge>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User extends _User {
  const _$_User(
      {@JsonKey() this.id,
      @JsonKey() this.username,
      @JsonKey() this.isAdmin = false,
      @JsonKey() this.points = 0,
      @JsonKey() final List<UnlockedBadge> unlockedBadges = const [],
      @JsonKey() final List<LockedBadge> lockedBadges = const []})
      : _unlockedBadges = unlockedBadges,
        _lockedBadges = lockedBadges,
        super._();

  factory _$_User.fromJson(Map<String, dynamic> json) => _$$_UserFromJson(json);

  @override
  @JsonKey()
  final int? id;
  @override
  @JsonKey()
  final String? username;
  @override
  @JsonKey()
  final bool isAdmin;
  @override
  @JsonKey()
  final int points;
  final List<UnlockedBadge> _unlockedBadges;
  @override
  @JsonKey()
  List<UnlockedBadge> get unlockedBadges {
    if (_unlockedBadges is EqualUnmodifiableListView) return _unlockedBadges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_unlockedBadges);
  }

  final List<LockedBadge> _lockedBadges;
  @override
  @JsonKey()
  List<LockedBadge> get lockedBadges {
    if (_lockedBadges is EqualUnmodifiableListView) return _lockedBadges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lockedBadges);
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, isAdmin: $isAdmin, points: $points, unlockedBadges: $unlockedBadges, lockedBadges: $lockedBadges)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin) &&
            (identical(other.points, points) || other.points == points) &&
            const DeepCollectionEquality()
                .equals(other._unlockedBadges, _unlockedBadges) &&
            const DeepCollectionEquality()
                .equals(other._lockedBadges, _lockedBadges));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      username,
      isAdmin,
      points,
      const DeepCollectionEquality().hash(_unlockedBadges),
      const DeepCollectionEquality().hash(_lockedBadges));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserToJson(
      this,
    );
  }
}

abstract class _User extends User {
  const factory _User(
      {@JsonKey() final int? id,
      @JsonKey() final String? username,
      @JsonKey() final bool isAdmin,
      @JsonKey() final int points,
      @JsonKey() final List<UnlockedBadge> unlockedBadges,
      @JsonKey() final List<LockedBadge> lockedBadges}) = _$_User;
  const _User._() : super._();

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  @JsonKey()
  int? get id;
  @override
  @JsonKey()
  String? get username;
  @override
  @JsonKey()
  bool get isAdmin;
  @override
  @JsonKey()
  int get points;
  @override
  @JsonKey()
  List<UnlockedBadge> get unlockedBadges;
  @override
  @JsonKey()
  List<LockedBadge> get lockedBadges;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
