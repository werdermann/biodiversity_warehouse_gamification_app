import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/data/repository/auth_repository_impl.dart';
import 'package:biodiversity/data/repository/local_storage_repository_impl.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required AuthRepositoryImpl authRepository,
    required LocalStorageRepositoryImpl localStorage,
  })  : _authRepository = authRepository,
        _localStorage = localStorage,
        super(SettingsState());

  final AuthRepositoryImpl _authRepository;

  final LocalStorageRepositoryImpl _localStorage;

  void logout() async {
    await _localStorage.clearStorage();
    _authRepository.updateUser(user: User.empty);
  }
}
