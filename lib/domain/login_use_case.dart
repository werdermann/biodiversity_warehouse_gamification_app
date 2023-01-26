import 'package:biodiversity/data/auth_repository.dart';
import 'package:biodiversity/data/common/api_result.dart';
import 'package:biodiversity/data/dto/login_result.dart';
import 'package:biodiversity/data/local_storage.dart';

/// Logs the user into the server.
class LoginUseCase {
  /// Constructor
  const LoginUseCase({
    required AuthRepository authRepository,
    required LocalStorage localStorage,
  })  : _authRepository = authRepository,
        _localStorage = localStorage;

  final AuthRepository _authRepository;
  final LocalStorage _localStorage;

  Future<ApiResult<void>> execute({
    required String username,
    required String password,
  }) async {
    final result = await _authRepository.login(
      username: username,
      password: password,
    );

    return result.when(
      success: (LoginResult loginResult) async {
        _authRepository.updateUser(user: loginResult.user);

        final storeTokenSuccessfully =
            await _localStorage.storeString(value: 'token', key: 'token');

        if (storeTokenSuccessfully) {
          return const ApiResult.success(data: 'asdasd');
        } else {
          return const ApiResult.failure(error: 'STORE_DATA_FAILED');
        }
      },
      failure: (error) {
        return ApiResult.failure(error: error);
      },
    );
  }
}
