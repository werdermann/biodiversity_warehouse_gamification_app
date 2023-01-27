import 'package:biodiversity/data/auth_repository.dart';
import 'package:biodiversity/data/common/result.dart';
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

  Future<Result<void>> execute({
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
          return const Result.success(data: 'asdasd');
        } else {
          return const Result.failure(error: 'STORE_DATA_FAILED');
        }
      },
      failure: (error) {
        return Result.failure(error: error);
      },
    );
  }
}
