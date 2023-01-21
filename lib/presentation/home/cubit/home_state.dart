part of 'home_cubit.dart';

class HomeState extends Equatable {
  const HomeState({
    this.pageIndex = 0,
  });

  final int pageIndex;

  HomeState copyWith({
    int? pageIndex,
  }) {
    return HomeState(pageIndex: pageIndex ?? this.pageIndex);
  }

  @override
  List<Object?> get props => [pageIndex];
}
