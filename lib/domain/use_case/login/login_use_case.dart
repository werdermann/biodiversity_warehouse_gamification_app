import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:dio/dio.dart';

/// Use case for logging the user into the server.
class LoginUseCase {
  /// Constructor
  const LoginUseCase({
    required AuthRepository authRepository,
    required LocalStorageRepository localStorageRepository,
    required Dio dio,
  })  : _authRepository = authRepository,
        _localStorageRepository = localStorageRepository,
        _dio = dio;

  final AuthRepository _authRepository;
  final LocalStorageRepository _localStorageRepository;
  final Dio _dio;

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
        _dio.options.headers.addAll({
          'Authorization': 'Bearer ${result.accessToken}',
        });

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
