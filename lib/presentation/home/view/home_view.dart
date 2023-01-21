import 'package:biodiversity/presentation/home/cubit/home_cubit.dart';
import 'package:biodiversity/presentation/report/report.dart';
import 'package:biodiversity/presentation/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) => previous.pageIndex != current.pageIndex,
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        return Scaffold(
          bottomNavigationBar: NavigationBar(
            selectedIndex: state.pageIndex,
            onDestinationSelected: cubit.pageChanged,
            destinations: const [
              NavigationDestination(
                selectedIcon: Icon(Icons.person),
                icon: Icon(Icons.person_outline),
                label: 'Report',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.engineering),
                icon: Icon(Icons.engineering_outlined),
                label: 'Relearn',
              ),
            ],
          ),
          body: [const ReportPage(), const SettingsPage()][state.pageIndex],
        );
      },
    );
  }
}
