import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/common/empty_resource.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:dio/dio.dart';

class CheckTokenUseCase {
  CheckTokenUseCase({
    required LocalStorageRepository localStorageRepository,
    required AuthRepository authRepository,
    required Dio dio,
  })  : _localStorageRepository = localStorageRepository,
        _authRepository = authRepository,
        _dio = dio;

  final LocalStorageRepository _localStorageRepository;
  final AuthRepository _authRepository;
  final Dio _dio;

  Stream<EmptyResource> execute() async* {
    yield const EmptyResource.loading();

    final token = _localStorageRepository.getObject<String>(
      key: Constants.accessTokenStorageKey,
    );

    if (token != null) {
      // Add token
      _dio.options.headers.addAll({'Authorization': 'Bearer $token'});

      try {
        final user = await _authRepository.fetchUser();

        _authRepository.updateUser(user: user);

        yield const EmptyResource.success();
      } catch (_) {
        yield const EmptyResource.error('ERROR.GENERAL');
      }
    } else {
      yield const EmptyResource.error('ERROR.GENERAL');
    }
  }
}
