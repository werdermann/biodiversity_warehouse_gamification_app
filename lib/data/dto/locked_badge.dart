import 'package:biodiversity/domain/model/badge_condition.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'locked_badge.freezed.dart';
part 'locked_badge.g.dart';

@freezed
class LockedBadge with _$LockedBadge {
  const factory LockedBadge({
    @JsonKey() int? condition,
  }) = _LockedBadge;

  factory LockedBadge.fromJson(Map<String, dynamic> json) =>
      _$LockedBadgeFromJson(json);
}
