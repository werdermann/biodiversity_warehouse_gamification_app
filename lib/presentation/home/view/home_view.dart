import 'package:biodiversity/presentation/badges/view/badges_page.dart';
import 'package:biodiversity/presentation/home/cubit/home_cubit.dart';
import 'package:biodiversity/presentation/leaderboard/view/leaderboard_page.dart';
import 'package:biodiversity/presentation/report/report.dart';
import 'package:biodiversity/presentation/settings/settings.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.pageIndex != current.pageIndex ||
          previous.config != current.config,
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        final views = [
          const ReportPage(),
          if (state.config.leaderboardActive) const LeaderboardPage(),
          if (state.config.badgesActive) const BadgesPage(),
          const SettingsPage(),
        ];

        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.pageIndex,
            onDestinationSelected: cubit.pageChanged,
            destinations: [
              NavigationDestination(
                selectedIcon: const Icon(Icons.travel_explore),
                icon: const Icon(Icons.travel_explore_outlined),
                label: 'REPORT.REPORT_SIGHTING'.tr(),
              ),
              if (state.config.leaderboardActive)
                NavigationDestination(
                  selectedIcon: const Icon(Icons.leaderboard),
                  icon: const Icon(Icons.leaderboard_outlined),
                  label: 'LEADERBOARD.LEADERBOARD'.tr(),
                ),
              if (state.config.badgesActive)
                NavigationDestination(
                  selectedIcon: const Icon(Icons.military_tech),
                  icon: const Icon(Icons.military_tech_outlined),
                  label: 'BADGES.BADGES'.tr(),
                ),
              NavigationDestination(
                selectedIcon: const Icon(Icons.settings),
                icon: const Icon(Icons.settings_outlined),
                label: 'SETTINGS.SETTINGS'.tr(),
              ),
            ],
          ),
          body: views[state.pageIndex],
        );
      },
    );
  }
}
