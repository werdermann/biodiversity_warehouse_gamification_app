import 'dart:async';

import 'package:biodiversity/data/dto/gamification_config.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GamificationRepository gamificationRepository,
  })  : _gamificationRepository = gamificationRepository,
        super(const HomeState()) {
    final config = _gamificationRepository.currentConfig;

    _configSubscription = _gamificationRepository.config.listen(_configChanged);

    emit(
      state.copyWith(
        config: config,
      ),
    );
  }

  final GamificationRepository _gamificationRepository;

  late final StreamSubscription<GamificationConfig> _configSubscription;

  @override
  Future<void> close() {
    _configSubscription.cancel();
    return super.close();
  }

  void pageChanged(int pageIndex) {
    emit(state.copyWith(pageIndex: pageIndex));
  }

  void _configChanged(GamificationConfig config) {
    emit(state.copyWith(config: config));
  }
}
