import 'package:biodiversity/domain/use_case/logout/logout_use_case.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit({
    required LogoutUseCase logoutUseCase,
  })  : _logoutUseCase = logoutUseCase,
        super(SettingsState());

  final LogoutUseCase _logoutUseCase;

  void logout() async {
    _logoutUseCase.execute().forEach((result) {});
  }
}
