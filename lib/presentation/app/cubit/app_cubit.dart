import 'dart:async';

import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/use_case/config/get_gamification_config_use_case.dart';
import 'package:biodiversity/domain/use_case/login/check_token_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AuthRepository authRepository,
    required GetGamificationConfigUseCase getGamificationConfigUseCase,
    required CheckTokenUseCase checkTokenUseCase,
  })  : _authRepository = authRepository,
        _checkTokenUseCase = checkTokenUseCase,
        _getGamificationConfigUseCase = getGamificationConfigUseCase,
        super(const AppState()) {
    _userSubscription = _authRepository.user.listen(_userChanged);

    _checkIfTokenIsSaved();

    print("Get config!");
    _getGamificationConfig();
  }

  final AuthRepository _authRepository;

  final CheckTokenUseCase _checkTokenUseCase;
  final GetGamificationConfigUseCase _getGamificationConfigUseCase;

  late final StreamSubscription _userSubscription;

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    return super.close();
  }

  void _userChanged(User user) {
    print('User changed!');

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
            print('Token is saved!');

            // TODO: Fetch user from backend?
          },
          error: (_) {},
        );
      },
    );
  }

  void _getGamificationConfig() async {
    _getGamificationConfigUseCase.execute().forEach((result) {
      result.when(
        loading: () {
          emit(
            state.copyWith(
              getConfigStatus: FormzStatus.submissionInProgress,
            ),
          );
        },
        success: () {
          print("Fetched config successfully!");
          emit(
            state.copyWith(
              getConfigStatus: FormzStatus.submissionSuccess,
            ),
          );
        },
        error: (message) {
          emit(
            state.copyWith(
              getConfigStatus: FormzStatus.submissionFailure,
              getConfigError: message,
            ),
          );
        },
      );
    });
  }
}
