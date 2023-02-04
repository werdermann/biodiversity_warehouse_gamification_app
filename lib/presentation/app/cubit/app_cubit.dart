import 'dart:async';

import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:biodiversity/domain/use_case/config/get_gamification_config_use_case.dart';
import 'package:biodiversity/domain/use_case/login/check_token_use_case.dart';
import 'package:biodiversity/domain/use_case/on_boarding/has_on_boarding_finished_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required LocalStorageRepository localStorageRepository,
    required AuthRepository authRepository,
    required GetGamificationConfigUseCase getGamificationConfigUseCase,
    required CheckTokenUseCase checkTokenUseCase,
    required HasOnBoardingFinishedUseCase hasOnBoardingFinishedUseCase,
  })  : _localStorageRepository = localStorageRepository,
        _authRepository = authRepository,
        _checkTokenUseCase = checkTokenUseCase,
        _getGamificationConfigUseCase = getGamificationConfigUseCase,
        _hasOnBoardingFinishedUseCase = hasOnBoardingFinishedUseCase,
        super(const AppState()) {
    _userSubscription = _authRepository.user.listen(_userChanged);
    _hasOnBoardingSeen = _localStorageRepository.hasOnBoardingSeen.listen(
      _hasOnBoardingFinishedChanged,
    );

    _getGamificationConfig();
  }

  final AuthRepository _authRepository;
  final LocalStorageRepository _localStorageRepository;

  final CheckTokenUseCase _checkTokenUseCase;
  final GetGamificationConfigUseCase _getGamificationConfigUseCase;
  final HasOnBoardingFinishedUseCase _hasOnBoardingFinishedUseCase;

  late final StreamSubscription _userSubscription;
  late final StreamSubscription _hasOnBoardingSeen;

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
    await _hasOnBoardingSeen.cancel();
    return super.close();
  }

  void _userChanged(User user) {
    emit(
      state.copyWith(
        status: user.isNotEmpty
            ? AppStatus.authenticated
            : AppStatus.unauthenticated,
      ),
    );
  }

  void _checkIfTokenIsSaved() => _checkTokenUseCase.execute().forEach(
        (result) {},
      );

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
        success: (config) {
          if (config.onBoardingActive) {
            _hasOnBoardingFinished();
          } else {
            _checkIfTokenIsSaved();
          }

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
      result.whenOrNull(
        success: (hasSeen) {
          if (!hasSeen) {
            emit(state.copyWith(status: AppStatus.onBoarding));
          } else {
            _checkIfTokenIsSaved();
          }
        },
      );
    });
  }

  void _hasOnBoardingFinishedChanged(bool value) {
    if (value) {
      emit(
        state.copyWith(
          status: AppStatus.unauthenticated,
        ),
      );
    }
  }
}
