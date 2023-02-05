import 'dart:async';

import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'badges_state.dart';

class BadgesCubit extends Cubit<BadgesState> {
  BadgesCubit({
    required AuthRepository authRepository,
  })  : _authRepository = authRepository,
        super(const BadgesState()) {
    emit(state.copyWith(user: _authRepository.currentUser));

    _userSubscription = _authRepository.user.listen(_userChanged);
  }

  final AuthRepository _authRepository;

  late final StreamSubscription<User> _userSubscription;

  @override
  Future<void> close() {
    _userSubscription.cancel();
    return super.close();
  }

  void _userChanged(User user) {
    emit(state.copyWith(user: user));
  }
}
