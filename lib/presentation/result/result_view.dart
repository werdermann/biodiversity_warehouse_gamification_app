import 'package:biodiversity/domain/model/badge_condition.dart';
import 'package:biodiversity/presentation/result/result_cubit.dart';
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
      body: SingleChildScrollView(
        child: SafeArea(
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
                _badges,
                const SizedBox(height: 62),
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
            state.result?.leaderboard == null ||
            state.result?.user == null) {
          return Container();
        }

        final leaderboard = state.result!.leaderboard!;

        final appUser = state.result!.user;

        final isFirst = appUser.id == leaderboard.users.first.id;

        final positionText = isFirst
            ? 'RESULT.TOP_POSITION'
            : state.result!.hasNewLeaderboardPosition
                ? 'RESULT.NEW_POSITION'
                : 'RESULT.SAME_POSITION';

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Card(
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
          ),
        );
      },
    );
  }

  Widget get _badges {
    return BlocBuilder<ResultCubit, ResultState>(
      buildWhen: (previous, current) => previous.result != current.result,
      builder: (context, state) {
        // Only show badges when the element is active
        if (!state.config.badgesActive ||
            state.result == null ||
            state.result?.user == null ||
            state.result?.newUnlockedBadges == null) {
          return Container();
        }

        final newUnlockedBadges = state.result!.newUnlockedBadges;

        final noNewBadges = newUnlockedBadges.isEmpty;

        final user = state.result!.user;
        final lockedBadges = user.lockedBadges;

        final allBadgesUnlocked = user.lockedBadges.isEmpty;

        return Card(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Column(
              children: [
                ListTile(
                  title: Text('GENERAL.BADGES'.tr()),
                  subtitle: Text(
                    allBadgesUnlocked
                        ? 'RESULT.ALL_BADGES_UNLOCKED'.tr()
                        : noNewBadges
                            ? 'RESULT.NO_BADGE_UNLOCKED'.tr(
                                namedArgs: {
                                  'remaining': '${lockedBadges.length}',
                                },
                              )
                            : 'RESULT.NEW_BADGE_UNLOCKED'.tr(
                                namedArgs: {
                                  'amount': '${newUnlockedBadges.length}',
                                  'remaining': '${lockedBadges.length}',
                                },
                              ),
                  ),
                  contentPadding: const EdgeInsets.only(
                    bottom: 8,
                    left: 16,
                    right: 16,
                  ),
                ),
                ListView.builder(
                  itemCount: newUnlockedBadges.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final conditionIndex = newUnlockedBadges[index].condition!;
                    final badge = BadgeCondition.values[conditionIndex];

                    return ListTile(
                      leading: CircleAvatar(
                        foregroundColor: Colors.transparent,
                        child: Image.asset(badge.imagePath),
                      ),
                      title: Text(badge.title.tr()),
                      subtitle: Text(badge.unlockedText.tr()),
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
