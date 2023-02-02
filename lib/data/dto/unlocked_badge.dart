import 'package:freezed_annotation/freezed_annotation.dart';

part 'unlocked_badge.freezed.dart';
part 'unlocked_badge.g.dart';

@freezed
class UnlockedBadge with _$UnlockedBadge {
  const factory UnlockedBadge({
    @JsonKey() int? condition,
    @Default('') @JsonKey() String date,
  }) = _UnlockedBadge;

  factory UnlockedBadge.fromJson(Map<String, dynamic> json) =>
      _$UnlockedBadgeFromJson(json);
}
