import 'package:biodiversity/data/dto/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'leaderboard_response.freezed.dart';
part 'leaderboard_response.g.dart';

/// Response from the server when the user fetches the leaderboard.
@freezed
class LeaderboardResponse with _$LeaderboardResponse {
  const factory LeaderboardResponse({
    @JsonKey() int? currentPosition,
    @Default([]) @JsonKey() List<User> users,
  }) = _LeaderboardResponse;

  factory LeaderboardResponse.fromJson(Map<String, dynamic> json) =>
      _$LeaderboardResponseFromJson(json);
}
