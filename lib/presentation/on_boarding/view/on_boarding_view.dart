import 'package:biodiversity/presentation/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return BlocListener<OnBoardingCubit, OnBoardingState>(
      listenWhen: (previous, current) => previous.page != current.page,
      listener: (context, state) {
        if (state.page == 1) {
          // TODO: Show dialog!

          print("Show dialog");

          showDialog(
            context: context,
            builder: (context) => const OnBoardingStepOneDialog(),
          );
        }
      },
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlocBuilder<OnBoardingCubit, OnBoardingState>(
              buildWhen: (previous, current) => previous.page != current.page,
              builder: (context, state) {
                return SafeArea(
                  bottom: false,
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    child: Text("Indicator! ${state.page} "),
                  ),
                );
              },
            ),
            Expanded(
              child: PageView(
                controller: cubit.pageController,
                onPageChanged: cubit.pageChanged,
                children: const [
                  OnBoardingIntroduction(),
                  OnBoardingStepOne(),
                  Center(
                    child: Text('Third Page'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
