part of 'login_cubit.dart';

class LoginState extends Equatable {
  /// Constructor.
  const LoginState({
    this.username = const Username.pure(),
    this.password = const Password.pure(),
    this.loginErrorMessage = '',
    this.loginStatus = FormzStatus.pure,
  });

  /// Username for the input field.
  final Username username;

  /// Password for the input field.
  final Password password;

  /// Error message when the logging process fails.
  final String loginErrorMessage;

  /// Validation status for logging the user in.
  final FormzStatus loginStatus;

  /// Updates the state and returns a new instance.
  LoginState copyWith({
    Username? username,
    Password? password,
    String? loginErrorMessage,
    FormzStatus? loginStatus,
  }) {
    return LoginState(
      username: username ?? this.username,
      password: password ?? this.password,
      loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
      loginStatus: loginStatus ?? this.loginStatus,
    );
  }

  @override
  List<Object?> get props => [
        username,
        password,
        loginErrorMessage,
        loginStatus,
      ];
}
