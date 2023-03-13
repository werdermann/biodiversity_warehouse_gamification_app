import 'package:biodiversity/domain/use_case/login/login_use_case.dart';
import 'package:biodiversity/presentation/ui/validation/password.dart';
import 'package:biodiversity/presentation/ui/validation/username.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  /// Constructor
  LoginCubit({
    required LoginUseCase loginUseCase,
  })  : _loginUseCase = loginUseCase,
        super(const LoginState());

  final LoginUseCase _loginUseCase;

  /// Called whenever the values of the username input field changes.
  void usernameChanged(String value) {
    final username = Username.dirty(value);

    emit(
      state.copyWith(
        username: username,
        loginStatus: Formz.validate([username, state.password]),
      ),
    );
  }

  /// Called whenever the values of the password input field changes.
  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(
      state.copyWith(
        password: password,
        loginStatus: Formz.validate([password, state.username]),
      ),
    );
  }

  Future<void> login() async {
    // Validate inputs
    emit(
      state.copyWith(
        loginStatus: Formz.validate([state.username, state.password]),
      ),
    );

    if (!state.loginStatus.isValid) return;

    final result = _loginUseCase.execute(
      username: state.username.value,
      password: state.password.value,
    );

    result.forEach((element) {
      element.when(
        loading: () {
          emit(state.copyWith(loginStatus: FormzStatus.submissionInProgress));
        },
        success: () {
          emit(state.copyWith(loginStatus: FormzStatus.submissionSuccess));
        },
        error: (message) {
          emit(
            state.copyWith(
              loginStatus: FormzStatus.submissionFailure,
              loginErrorMessage: message,
            ),
          );
        },
      );
    });
  }
}
