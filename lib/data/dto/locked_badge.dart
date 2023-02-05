import 'package:freezed_annotation/freezed_annotation.dart';

part 'locked_badge.freezed.dart';
part 'locked_badge.g.dart';

/// Locked badges represents badges that can be unlocked by the user.
@freezed
class LockedBadge with _$LockedBadge {
  const factory LockedBadge({
    @JsonKey() int? condition,
  }) = _LockedBadge;

  factory LockedBadge.fromJson(Map<String, dynamic> json) =>
      _$LockedBadgeFromJson(json);
}
