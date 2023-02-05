part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.pageIndex = 0,
    this.config = GamificationConfig.noGamification,
  });

  final int pageIndex;

  final GamificationConfig config;

  HomeState copyWith({
    int? pageIndex,
    GamificationConfig? config,
  }) {
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
      config: config ?? this.config,
    );
  }

  @override
  List<Object?> get props => [pageIndex, config];
}
