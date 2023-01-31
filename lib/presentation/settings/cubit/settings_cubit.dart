import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required AuthRepository authRepository,
    required LocalStorageRepository localStorage,
  })  : _authRepository = authRepository,
        _localStorage = localStorage,
        super(SettingsState());

  final AuthRepository _authRepository;

  final LocalStorageRepository _localStorage;

  void logout() async {
    /*
    await _localStorage.clearStorage();
    _authRepository.updateUser(user: User.empty);

     */
  }
}
