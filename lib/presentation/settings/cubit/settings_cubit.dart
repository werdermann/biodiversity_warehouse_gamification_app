import 'package:biodiversity/data/auth_repository.dart';
import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/data/local_storage.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required AuthRepository authRepository,
    required LocalStorage localStorage,
  })  : _authRepository = authRepository,
        _localStorage = localStorage,
        super(SettingsState());

  final AuthRepository _authRepository;

  final LocalStorage _localStorage;

  void logout() async {
    await _localStorage.clearStorage();
    _authRepository.updateUser(user: User.empty);
  }
}
