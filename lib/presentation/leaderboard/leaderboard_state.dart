part of 'leaderboard_cubit.dart';

class LeaderboardState extends Equatable {
  const LeaderboardState({
    this.loadLeaderboardStatus = FormzStatus.pure,
    this.loadLeaderboardError = '',
    this.leaderboard,
  });

  /// Validation status for loading the leaderboard.
  final FormzStatus loadLeaderboardStatus;

  /// Error when loading the leaderboard fails.
  final String loadLeaderboardError;

  /// Current leaderboard of the biodiversity server.
  final LeaderboardResponse? leaderboard;

  /// Updates the state and returns a new instance.
  LeaderboardState copyWith({
    FormzStatus? loadLeaderboardStatus,
    String? loadLeaderboardError,
    LeaderboardResponse? leaderboard,
  }) {
    return LeaderboardState(
      loadLeaderboardStatus:
          loadLeaderboardStatus ?? this.loadLeaderboardStatus,
      loadLeaderboardError: loadLeaderboardError ?? this.loadLeaderboardError,
      leaderboard: leaderboard ?? this.leaderboard,
    );
  }

  @override
  List<Object?> get props => [
        loadLeaderboardStatus,
        loadLeaderboardStatus,
        leaderboard,
      ];
}
