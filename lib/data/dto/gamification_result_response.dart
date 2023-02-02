import 'package:biodiversity/data/dto/leaderboard_response.dart';
import 'package:biodiversity/data/dto/unlocked_badge.dart';
import 'package:biodiversity/data/dto/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gamification_result_response.freezed.dart';
part 'gamification_result_response.g.dart';

@freezed
class GamificationResultResponse with _$GamificationResultResponse {
  const factory GamificationResultResponse({
    @Default(0) @JsonKey() int gainedPoints,
    @Default([]) @JsonKey() List<UnlockedBadge> newUnlockedBadges,
    @Default(false) @JsonKey() bool hasNewLeaderboardPosition,
    @JsonKey() LeaderboardResponse? leaderboard,
    @JsonKey() User? user,
  }) = _GamificationResultResponse;

  factory GamificationResultResponse.fromJson(Map<String, dynamic> json) =>
      _$GamificationResultResponseFromJson(json);
}
