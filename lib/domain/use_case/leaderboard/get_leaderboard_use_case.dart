import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';

class GetLeaderboardUseCase {
  GetLeaderboardUseCase({
    required GamificationRepository gamificationRepository,
    required AuthRepository authRepository,
  })  : _gamificationRepository = gamificationRepository,
        _authRepository = authRepository;

  final GamificationRepository _gamificationRepository;
  final AuthRepository _authRepository;

  Stream<EmptyResource> execute() async* {
    yield const EmptyResource.loading();

    try {
      final user = _authRepository.currentUser;

      print("USERNAME ${user.username}");

      final leaderboard = await _gamificationRepository.getLeaderboard(
        username: user.username!,
      );

      _gamificationRepository.updateLeaderboard(leaderboard: leaderboard);

      yield const EmptyResource.success();
    } catch (_) {
      yield const EmptyResource.error('ERROR.GENERAL');
    }
  }
}
