part of 'report_cubit.dart';

class ReportState extends Equatable {
  const ReportState({
    this.step = 0,
  });

  /// The current step of the reporting process.
  final int step;

  /// Updates the state and returns a new instance.
  ReportState copyWith({
    int? step,
  }) {
    return ReportState(step: step ?? this.step);
  }

  @override
  List<Object?> get props => [step];
}
