import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';

class GetGamificationConfigUseCase {
  GetGamificationConfigUseCase({
    required GamificationRepository gamificationRepository,
  }) : _gamificationRepository = gamificationRepository;

  final GamificationRepository _gamificationRepository;

  Stream<EmptyResource> execute() async* {
    yield const EmptyResource.loading();

    try {
      final config = await _gamificationRepository.getGamificationConfig();

      _gamificationRepository.updateConfig(config: config);

      yield EmptyResource.success();
    } catch (_) {
      yield const EmptyResource.error('ERROR.GENERAL');
    }
  }
}
