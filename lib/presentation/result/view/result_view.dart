import 'package:biodiversity/presentation/result/cubit/result_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('RESULT.RESULT'.tr()),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: Text('RESULT.BACK'.tr()),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: size.width,
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'RESULT.AWESOME'.tr(),
                  style: textTheme.titleLarge,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: 8),
                Text('RESULT.REPORT_SUCCESS'.tr()),
                const SizedBox(height: 16),
                _points,
                _leaderboard,
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget get _points {
    return BlocBuilder<ResultCubit, ResultState>(
      buildWhen: (previous, current) => previous.result != current.result,
      builder: (context, state) {
        // Only show points when the leaderboard element is active
        if (!state.config.leaderboardActive || state.result == null) {
          return Container();
        }

        final result = state.result!;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: ListTile(
            title: Text(
              'GENERAL.POINTS'.tr(),
            ),
            subtitle: Text(
              'RESULT.GAINED_POINTS'.tr(
                namedArgs: {'points': '${result.gainedPoints}'},
              ),
            ),
          ),
        );
      },
    );
  }

  Widget get _leaderboard {
    return BlocBuilder<ResultCubit, ResultState>(
      buildWhen: (previous, current) => previous.result != current.result,
      builder: (context, state) {
        // Only show leaderboard when the element is active
        if (!state.config.leaderboardActive ||
            state.result == null ||
            state.result?.leaderboard == null && state.result?.user == null) {
          return Container();
        }

        final leaderboard = state.result!.leaderboard!;

        final appUser = state.result!.user!;

        final isFirst = appUser.id == leaderboard.users.first.id;

        final positionText = isFirst
            ? 'RESULT.TOP_POSITION'
            : state.result!.hasNewLeaderboardPosition
                ? 'RESULT.NEW_POSITION'
                : 'RESULT.SAME_POSITION';

        return Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                ListTile(
                  title: Text('GENERAL.LEADERBOARD'.tr()),
                  subtitle: Text(positionText.tr()),
                  contentPadding: const EdgeInsets.only(
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                ),
                ListView.builder(
                  itemCount: leaderboard.users.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final position = index + 1;
                    final user = leaderboard.users[index];

                    final isPlayer = appUser.id == user.id;

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

  /*
  Widget get _badges {
    return BlocBuilder(builder: builder)
  }

   */
}
