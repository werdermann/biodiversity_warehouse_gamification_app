import 'dart:async';

import 'package:biodiversity/data/dto/leaderboard_response.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:biodiversity/domain/use_case/leaderboard/get_leaderboard_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'leaderboard_state.dart';

class LeaderboardCubit extends Cubit<LeaderboardState> {
  LeaderboardCubit({
    required GamificationRepository gamificationRepository,
    required GetLeaderboardUseCase getLeaderboardUseCase,
  })  : _getLeaderboardUseCase = getLeaderboardUseCase,
        _gamificationRepository = gamificationRepository,
        super(const LeaderboardState()) {
    emit(
      state.copyWith(
        leaderboard: _gamificationRepository.currentLeaderboard,
      ),
    );

    _leaderboardSubscription = _gamificationRepository.leaderboard.listen(
      _leaderboardChanged,
    );

    loadLeaderboard();
  }

  final GetLeaderboardUseCase _getLeaderboardUseCase;
  final GamificationRepository _gamificationRepository;

  late final StreamSubscription<LeaderboardResponse> _leaderboardSubscription;

  @override
  Future<void> close() {
    _leaderboardSubscription.cancel();
    return super.close();
  }

  void loadLeaderboard() async {
    _getLeaderboardUseCase.execute().listen((result) {
      result.when(
        loading: () {
          emit(
            state.copyWith(
              loadLeaderboardStatus: FormzStatus.submissionInProgress,
            ),
          );
        },
        success: () {
          emit(
            state.copyWith(
              loadLeaderboardStatus: FormzStatus.submissionSuccess,
            ),
          );
        },
        error: (message) {
          emit(
            state.copyWith(
              loadLeaderboardError: message,
              loadLeaderboardStatus: FormzStatus.submissionFailure,
            ),
          );
        },
      );
    });
  }

  void _leaderboardChanged(LeaderboardResponse leaderboard) {
    emit(state.copyWith(leaderboard: leaderboard));
  }
}
