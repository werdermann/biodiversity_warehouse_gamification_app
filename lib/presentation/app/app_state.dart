part of 'app_cubit.dart';

enum AppStatus { authenticated, unauthenticated, onBoarding }

class AppState extends Equatable {
  /// Constructor
  const AppState({
    this.status = AppStatus.unauthenticated,
    this.getConfigStatus = FormzStatus.pure,
    this.getConfigError = '',
    this.hasOnBoardingFinished = false,
  });

  /// Authentication status of the application.
  final AppStatus status;

  /// Validation status for fetching the gamification config.
  final FormzStatus getConfigStatus;

  /// Error message when fetching the gamification config fails.
  final String getConfigError;

  final bool hasOnBoardingFinished;

  /// Updates the state and returns a new instance.
  AppState copyWith({
    AppStatus? status,
    FormzStatus? getConfigStatus,
    String? getConfigError,
    bool? hasOnBoardingFinished,
  }) {
    return AppState(
      status: status ?? this.status,
      getConfigStatus: getConfigStatus ?? this.getConfigStatus,
      getConfigError: getConfigError ?? this.getConfigError,
      hasOnBoardingFinished:
          hasOnBoardingFinished ?? this.hasOnBoardingFinished,
    );
  }

  @override
  List<Object?> get props => [
        status,
        getConfigStatus,
        getConfigError,
        hasOnBoardingFinished,
      ];
}
