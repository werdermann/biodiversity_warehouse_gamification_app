part of 'badges_cubit.dart';

class BadgesState extends Equatable {
  const BadgesState({
    this.user = User.empty,
  });

  final User user;

  /// Updates the state and returns a new instance
  BadgesState copyWith({User? user}) {
    return BadgesState(user: user ?? this.user);
  }

  @override
  List<Object?> get props => [user];
}
