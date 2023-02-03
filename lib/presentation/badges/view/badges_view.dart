import 'package:biodiversity/domain/model/badge_condition.dart';
import 'package:biodiversity/presentation/badges/badges.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BadgesView extends StatelessWidget {
  const BadgesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BADGES.BADGES'.tr())),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              _unlockedBadges,
              _lockedBadges,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _unlockedBadges {
    return BlocBuilder<BadgesCubit, BadgesState>(
      buildWhen: (previous, current) =>
          previous.user.unlockedBadges != current.user.unlockedBadges,
      builder: (context, state) {
        final badges = state.user.unlockedBadges;

        final remainingBadges = state.user.lockedBadges.length;
        final allBadgesLength = remainingBadges + badges.length;

        return Column(
          children: [
            ListTile(
              trailing: const CircleAvatar(
                backgroundColor: Colors.transparent,
                child: Icon(Icons.military_tech),
              ),
              title: Text('BADGES.UNLOCKED_BADGES'.tr()),
              subtitle: Text(
                'BADGES.UNLOCKED_AMOUNT'.tr(
                  namedArgs: {
                    'remaining': '${badges.length}',
                    'all': '$allBadgesLength'
                  },
                ),
              ),
            ),
            ListView.builder(
              itemCount: badges.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final conditionIndex = badges[index].condition!;
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
        );
      },
    );
  }

  Widget get _lockedBadges {
    return BlocBuilder<BadgesCubit, BadgesState>(
      buildWhen: (previous, current) =>
          previous.user.lockedBadges != current.user.lockedBadges,
      builder: (context, state) {
        if (state.user.lockedBadges.isEmpty) return Container();

        final badges = state.user.lockedBadges;

        return Column(
          children: [
            ListTile(
              title: Text('BADGES.LOCKED_BADGES'.tr()),
            ),
            ListView.builder(
              itemCount: badges.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final badgeCondition = badges[index].condition!;
                final badge = BadgeCondition.values[badgeCondition];

                return ListTile(
                  leading: const CircleAvatar(backgroundColor: Colors.black),
                  subtitle: Text('BADGES.CONDITION'.tr()),
                  title: Text(badge.condition.tr()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
