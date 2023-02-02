import 'package:biodiversity/data/dto/gamification_config.dart';
import 'package:biodiversity/data/dto/gamification_result_response.dart';

abstract class GamificationRepository {
  Future<GamificationConfig> getGamificationConfig();

  void updateConfig({required GamificationConfig config});

  Stream<GamificationConfig> get config;
  GamificationConfig get currentConfig;

  void updateResult({required GamificationResultResponse result});

  Stream<GamificationResultResponse> get result;
  GamificationResultResponse? get currentResult;
}
