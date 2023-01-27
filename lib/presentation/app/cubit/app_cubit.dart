import 'dart:async';

import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/data/repository/auth_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit({
    required AuthRepositoryImpl authRepository,
  })  : _authRepository = authRepository,
        super(const AppState()) {
    _userSubscription = _authRepository.user.listen(_userChanged);
  }

  final AuthRepositoryImpl _authRepository;

  late final StreamSubscription _userSubscription;

  @override
  Future<void> close() async {
    await _userSubscription.cancel();
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
}
