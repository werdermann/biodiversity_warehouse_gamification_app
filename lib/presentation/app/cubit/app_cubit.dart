import 'dart:async';

import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/use_case/config/get_gamification_config_use_case.dart';
import 'package:biodiversity/domain/use_case/login/check_token_use_case.dart';
import 'package:biodiversity/domain/use_case/on_boarding/has_on_boarding_finished_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AuthRepository authRepository,
    required GetGamificationConfigUseCase getGamificationConfigUseCase,
    required CheckTokenUseCase checkTokenUseCase,
    required HasOnBoardingFinishedUseCase hasOnBoardingFinishedUseCase,
  })  : _authRepository = authRepository,
        _checkTokenUseCase = checkTokenUseCase,
        _getGamificationConfigUseCase = getGamificationConfigUseCase,
        _hasOnBoardingFinishedUseCase = hasOnBoardingFinishedUseCase,
        super(const AppState()) {
    _userSubscription = _authRepository.user.listen(_userChanged);

    _hasOnBoardingFinished();
  }

  final AuthRepository _authRepository;

  final CheckTokenUseCase _checkTokenUseCase;
  final GetGamificationConfigUseCase _getGamificationConfigUseCase;
  final HasOnBoardingFinishedUseCase _hasOnBoardingFinishedUseCase;

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

  void _checkIfTokenIsSaved() => _checkTokenUseCase.execute();

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

  void _hasOnBoardingFinished() {
    _hasOnBoardingFinishedUseCase.execute().forEach((result) {
      result.when(
        loading: () {},
        success: (hasSeen) {
          if (!hasSeen) {
            emit(state.copyWith(status: AppStatus.onBoarding));
          } else {
            _checkIfTokenIsSaved();
          }

          _getGamificationConfig();
        },
        error: (message) {},
      );
    });
  }
}
