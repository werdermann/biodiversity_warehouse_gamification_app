part of 'result_cubit.dart';

class ResultState extends Equatable {
  const ResultState({
    this.config = GamificationConfig.noGamification,
    this.result,
  });

  final GamificationConfig config;

  final GamificationResultResponse? result;

  ResultState copyWith({
    GamificationConfig? config,
    GamificationResultResponse? result,
  }) {
    return ResultState(
      config: config ?? this.config,
      result: result ?? this.result,
    );
  }

  @override
  List<Object?> get props => [config, result];
}
