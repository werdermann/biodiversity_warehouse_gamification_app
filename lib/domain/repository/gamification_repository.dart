import 'package:biodiversity/data/dto/gamification_config.dart';
import 'package:biodiversity/data/dto/gamification_result_response.dart';
import 'package:biodiversity/data/dto/leaderboard_response.dart';

/// Repository that manages the gamification logic of the application.
abstract class GamificationRepository {
  Future<GamificationConfig> getGamificationConfig();
  Future<LeaderboardResponse> getLeaderboard({required String username});

  void updateConfig({required GamificationConfig config});

  Stream<GamificationConfig> get config;
  GamificationConfig get currentConfig;

  void updateResult({required GamificationResultResponse result});

  Stream<GamificationResultResponse> get gamificationResult;
  GamificationResultResponse? get currentGamificationResult;

  void updateLeaderboard({required LeaderboardResponse leaderboard});

  Stream<LeaderboardResponse> get leaderboard;
  LeaderboardResponse? get currentLeaderboard;
}
