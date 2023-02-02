import 'package:biodiversity/presentation/leaderboard/cubit/leaderboard_cubit.dart';
import 'package:biodiversity/presentation/leaderboard/view/leaderboard_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LeaderboardPage extends StatelessWidget {
  const LeaderboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LeaderboardCubit(),
      child: const LeaderboardView(),
    );
  }
}
