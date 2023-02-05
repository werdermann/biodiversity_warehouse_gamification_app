import 'package:biodiversity/data/dto/locked_badge.dart';
import 'package:biodiversity/data/dto/unlocked_badge.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

/// The user object represents the user of the application.
@freezed
class User with _$User {
  const User._();

  const factory User({
    @JsonKey() int? id,
    @JsonKey() String? username,
    @Default(false) @JsonKey() bool isAdmin,
    @Default(0) @JsonKey() int points,
    @Default([]) @JsonKey() List<UnlockedBadge> unlockedBadges,
    @Default([]) @JsonKey() List<LockedBadge> lockedBadges,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  /// Empty user which represents an unauthenticated user.
  static const empty = User();

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == User.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != User.empty;
}
