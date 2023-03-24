import 'dart:async';

import 'package:biodiversity/data/dto/gamification_config.dart';
import 'package:biodiversity/data/dto/gamification_result_response.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'result_state.dart';

class ResultCubit extends Cubit<ResultState> {
  ResultCubit({
    required GamificationRepository gamificationRepository,
  })  : _gamificationRepository = gamificationRepository,
        super(const ResultState()) {
    final config = _gamificationRepository.currentConfig;
    _configSubscription = _gamificationRepository.config.listen(_configChanged);

    final result = _gamificationRepository.currentGamificationResult;
    _resultSubscription = _gamificationRepository.gamificationResult.listen(
      _resultChanged,
    );

    emit(state.copyWith(config: config, result: result));
  }

  final GamificationRepository _gamificationRepository;

  late final StreamSubscription<GamificationConfig> _configSubscription;
  late final StreamSubscription<GamificationResultResponse> _resultSubscription;

  @override
  Future<void> close() {
    _configSubscription.cancel();
    _resultSubscription.cancel();
    return super.close();
  }

  void _configChanged(GamificationConfig config) {
    emit(state.copyWith(config: config));
  }

  void _resultChanged(GamificationResultResponse result) {
    emit(state.copyWith(result: result));
  }
}
