import 'package:biodiversity/presentation/leaderboard/cubit/leaderboard_cubit.dart';
import 'package:biodiversity/presentation/ui/snackbars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LeaderboardCubit, LeaderboardState>(
      listenWhen: (previous, current) =>
          previous.loadLeaderboardStatus != current.loadLeaderboardStatus,
      listener: (context, state) {
        if (state.loadLeaderboardStatus.isSubmissionSuccess) {
          showSuccessSnackBar(context, message: 'SUCCESS.GET_LEADERBOARD'.tr());
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('LEADERBOARD.LEADERBOARD'.tr()),
          actions: [
            _refreshLeaderboardButton,
          ],
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: _leaderboard,
          ),
        ),
      ),
    );
  }

  Widget get _refreshLeaderboardButton {
    return BlocBuilder<LeaderboardCubit, LeaderboardState>(
      buildWhen: (previous, current) =>
          previous.loadLeaderboardStatus != current.loadLeaderboardStatus,
      builder: (context, state) {
        final cubit = context.read<LeaderboardCubit>();

        return IconButton(
          onPressed: state.loadLeaderboardStatus.isSubmissionInProgress
              ? null
              : cubit.loadLeaderboard,
          icon: const Icon(Icons.refresh),
        );
      },
    );
  }

  Widget get _leaderboard {
    return BlocBuilder<LeaderboardCubit, LeaderboardState>(
      buildWhen: (previous, current) =>
          previous.leaderboard != current.leaderboard,
      builder: (context, state) {
        // Only show leaderboard when the element is active
        if (state.leaderboard == null) {
          return Container();
        }

        final leaderboard = state.leaderboard!;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                ListTile(
                  title: Text('LEADERBOARD.POINT_SYSTEM'.tr()),
                  subtitle:
                      Text('LEADERBOARD.POINTS_BASED_ON_INFORMATION'.tr()),
                ),
                const SizedBox(height: 8),
                ListView.builder(
                  itemCount: leaderboard.users.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final position = index + 1;
                    final user = leaderboard.users[index];

                    final isPlayer = leaderboard.currentPosition == index;

                    return ListTile(
                      tileColor:
                          isPlayer ? Colors.green.withOpacity(0.3) : null,
                      leading: const CircleAvatar(
                        child: Icon(Icons.person),
                      ),
                      title: Row(
                        children: [
                          Text('$position. ${user.username}'),
                          const Spacer(),
                          Text('${user.points}'),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
