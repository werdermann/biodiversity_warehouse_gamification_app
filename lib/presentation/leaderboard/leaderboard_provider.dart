import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:biodiversity/domain/use_case/leaderboard/get_leaderboard_use_case.dart';
import 'package:biodiversity/presentation/leaderboard/leaderboard_cubit.dart';
import 'package:biodiversity/presentation/leaderboard/leaderboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Injects the [LeaderboardCubit] inside the [LeaderboardView].
class LeaderboardProvider extends StatelessWidget {
  const LeaderboardProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LeaderboardCubit(
        getLeaderboardUseCase: context.read<GetLeaderboardUseCase>(),
        gamificationRepository: context.read<GamificationRepository>(),
      ),
      child: const LeaderboardView(),
    );
  }
}
