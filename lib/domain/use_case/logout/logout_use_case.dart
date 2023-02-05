import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:dio/dio.dart';

/// Use case for logging the user out of the application. Removes the
/// authorization from the network headers and removes the token from the local
/// storage.
class LogoutUseCase {
  LogoutUseCase({
    required Dio dio,
    required LocalStorageRepository localStorageRepository,
    required AuthRepository authRepository,
  })  : _dio = dio,
        _localStorageRepository = localStorageRepository,
        _authRepository = authRepository;

  final Dio _dio;
  final LocalStorageRepository _localStorageRepository;
  final AuthRepository _authRepository;

  Stream<EmptyResource> execute() async* {
    yield const EmptyResource.loading();

    // Remove bearer token
    _dio.options.headers.remove('Authorization');

    final storageCleared = await _localStorageRepository.clearStorage();

    if (storageCleared) {
      _authRepository.updateUser(user: User.empty);

      yield const EmptyResource.success();
    } else {
      yield const EmptyResource.error('ERROR.GENERAL');
    }
  }
}
