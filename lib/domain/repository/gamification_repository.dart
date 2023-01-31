import 'package:biodiversity/data/dto/gamification_config.dart';

abstract class GamificationRepository {
  Future<GamificationConfig> getGamificationConfig();

  void updateConfig({required GamificationConfig config});

  Stream<GamificationConfig> get config;
  GamificationConfig get currentConfig;
}
