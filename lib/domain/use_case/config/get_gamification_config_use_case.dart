import 'package:biodiversity/common/resource.dart';
import 'package:biodiversity/data/dto/gamification_config.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';

/// Use case for fetching the gamification configuration from the backend.
class GetGamificationConfigUseCase {
  GetGamificationConfigUseCase({
    required GamificationRepository gamificationRepository,
  }) : _gamificationRepository = gamificationRepository;

  final GamificationRepository _gamificationRepository;

  Stream<Resource<GamificationConfig>> execute() async* {
    yield const Resource.loading();

    try {
      final config = await _gamificationRepository.getGamificationConfig();

      _gamificationRepository.updateConfig(config: config);

      yield Resource.success(config);
    } catch (_) {
      yield const Resource.error('ERROR.GENERAL');
    }
  }
}
