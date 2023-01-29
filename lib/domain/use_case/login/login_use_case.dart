import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';

/// Logs the user into the server.
class LoginUseCase {
  /// Constructor
  const LoginUseCase({
    required AuthRepository authRepository,
    required LocalStorageRepository localStorageRepository,
  })  : _authRepository = authRepository,
        _localStorageRepository = localStorageRepository;

  final AuthRepository _authRepository;
  final LocalStorageRepository _localStorageRepository;

  Stream<EmptyResource> execute({
    required String username,
    required String password,
  }) async* {
    try {
      yield const EmptyResource.loading();

      final result = await _authRepository.login(
        username: username,
        password: password,
      );

      final isSaved = await _localStorageRepository.storeString(
        value: result.accessToken,
        key: Constants.accessTokenStorageKey,
      );

      if (isSaved) {
        _authRepository.updateUser(user: result.user);

        yield const EmptyResource.success();
      } else {
        yield const EmptyResource.error('ERROR.GENERAL');
      }
    } catch (_) {
      yield const EmptyResource.error('ERROR.GENERAL');
    }
  }
}
