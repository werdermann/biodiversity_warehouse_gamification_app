import 'package:biodiversity/presentation/on_boarding/on_boarding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingIntroduction extends StatelessWidget {
  const OnBoardingIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/misc/logo.png',
                height: 128,
                width: 128,
              ),
            ],
          ),
          const SizedBox(height: 32),
          Text(
            'ON_BOARDING.TITLE'.tr(),
            style: textTheme.titleLarge,
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 16),
          Text(
            'ON_BOARDING.INTRO'.tr(),
            style: textTheme.titleSmall,
          ),
          const SizedBox(height: 32),
          Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.travel_explore),
                    ),
                    title: Text('ON_BOARDING.REPORT_SIGHTINGS'.tr()),
                    subtitle:
                        Text('ON_BOARDING.REPORT_SIGHTINGS_DESCRIPTION'.tr()),
                  ),
                  ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Icon(Icons.science),
                    ),
                    subtitle: Text('ON_BOARDING.HELP_SCIENCE'.tr()),
                    title: Text('ON_BOARDING.HELP_SCIENCE_DESCRIPTION'.tr()),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FilledButton(
                onPressed: cubit.showNextPage,
                child: Text('ON_BOARDING.REPORT_FIRST_SIGHTING'.tr()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
