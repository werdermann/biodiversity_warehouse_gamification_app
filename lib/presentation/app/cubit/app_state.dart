part of 'app_cubit.dart';

enum AppStatus { authenticated, unauthenticated }

class AppState extends Equatable {
  /// Constructor
  const AppState({this.status = AppStatus.unauthenticated});

  /// Authentication status of the application.
  final AppStatus status;

  /// Updates the state and returns a new instance.
  AppState copyWith({
    AppStatus? status,
  }) {
    return AppState(status: status ?? this.status);
  }

  @override
  List<Object?> get props => [status];
}
