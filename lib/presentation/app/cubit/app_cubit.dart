import 'dart:async';

import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/data/repository/auth_repository_impl.dart';
import 'package:biodiversity/domain/use_case/login/check_token_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AuthRepositoryImpl authRepository,
    required CheckTokenUseCase checkTokenUseCase,
  })  : _authRepository = authRepository,
        _checkTokenUseCase = checkTokenUseCase,
        super(const AppState()) {
    _userSubscription = _authRepository.user.listen(_userChanged);

    _checkIfTokenIsSaved();
  }

  final AuthRepositoryImpl _authRepository;

  final CheckTokenUseCase _checkTokenUseCase;

  late final StreamSubscription _userSubscription;

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  void _userChanged(User user) {
    print("User changed!");

    emit(
      state.copyWith(
        status: user.isNotEmpty
            ? AppStatus.authenticated
            : AppStatus.unauthenticated,
      ),
    );
  }

  void _checkIfTokenIsSaved() {
    final result = _checkTokenUseCase.execute();

    result.forEach(
      (element) {
        element.when(
          loading: () {},
          success: () {
            print("Token is saved!");

            // TODO: Fetch user from backend?
          },
          error: (_) {},
        );
      },
    );
  }
}
