import 'package:biodiversity/presentation/on_boarding/on_boarding.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OnBoardingCubit>();

    return MultiBlocListener(
      listeners: [
        BlocListener<OnBoardingCubit, OnBoardingState>(
          listenWhen: (previous, current) => previous.page != current.page,
          listener: (context, state) {
            switch (state.page) {
              case 1:
                cubit.resetDialogOne();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: _firstDialog,
                  ),
                );
                break;
              case 2:
                cubit.resetDialogTwo();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: _secondDialog(onTap: cubit.finishDialogTwo),
                  ),
                );
                break;
              case 3:
                cubit.resetDialogThree();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: _thirdDialog(onTap: cubit.finishDialogThree),
                  ),
                );
                break;
              case 4:
                cubit.resetDialogFour();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: _fourthDialog(onTap: cubit.finishDialogFour),
                  ),
                );
                break;
              case 5:
                cubit.resetDialogFive();
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (context) => BlocProvider.value(
                    value: cubit,
                    child: _fifthDialog(onTap: cubit.finishDialogFive),
                  ),
                );
                break;
            }
          },
        ),
        BlocListener<OnBoardingCubit, OnBoardingState>(
          listenWhen: (previous, current) =>
              previous.isDialogOneFinished != current.isDialogOneFinished,
          listener: (context, state) {
            if (state.isDialogOneFinished) {
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<OnBoardingCubit, OnBoardingState>(
          listenWhen: (previous, current) =>
              previous.isDialogTwoFinished != current.isDialogTwoFinished,
          listener: (context, state) {
            if (state.isDialogTwoFinished) {
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<OnBoardingCubit, OnBoardingState>(
          listenWhen: (previous, current) =>
              previous.isDialogThreeFinished != current.isDialogThreeFinished,
          listener: (context, state) {
            if (state.isDialogThreeFinished) {
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<OnBoardingCubit, OnBoardingState>(
          listenWhen: (previous, current) =>
              previous.isDialogFourFinished != current.isDialogFourFinished,
          listener: (context, state) {
            if (state.isDialogFourFinished) {
              Navigator.pop(context);
            }
          },
        ),
        BlocListener<OnBoardingCubit, OnBoardingState>(
          listenWhen: (previous, current) =>
              previous.isDialogFiveFinished != current.isDialogFiveFinished,
          listener: (context, state) {
            if (state.isDialogFiveFinished) {
              Navigator.pop(context);
            }
          },
        ),
      ],
      child: BlocBuilder<OnBoardingCubit, OnBoardingState>(
        buildWhen: (previous, current) => previous.page != current.page,
        builder: (context, state) {
          final showFab = state.page == 5;

          final cubit = context.read<OnBoardingCubit>();

          return Scaffold(
            bottomNavigationBar: _bottomAppBar,
            floatingActionButton: showFab
                ? FloatingActionButton.extended(
                    onPressed: cubit.finishOnBoarding,
                    label: Text('ON_BOARDING.REPORT_SIGHTING'.tr()),
                  )
                : null,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.endDocked,
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BlocBuilder<OnBoardingCubit, OnBoardingState>(
                  buildWhen: (previous, current) =>
                      previous.page != current.page,
                  builder: (context, state) {
                    final step = state.page + 1;

                    return SafeArea(
                      bottom: false,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'ON_BOARDING.STEP'.tr(
                            namedArgs: {'step': '$step', 'max': '6'},
                          ),
                        ),
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
                      OnBoardingStepTwo(),
                      OnBoardingStepThree(),
                      OnBoardingStepFour(),
                      OnBoardingStepFive(),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget get _bottomAppBar {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) => previous.page != current.page,
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();

        final showFab = state.page == 5;

        return BottomAppBar(
          height: 100,
          shape: showFab ? const CircularNotchedRectangle() : null,
          child: Row(
            children: [
              IconButton(
                onPressed: state.page == 0 ? null : cubit.showPreviousPage,
                icon: const Icon(Icons.arrow_back),
              ),
              IconButton(
                onPressed: state.page == 5 ? null : cubit.showNextPage,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget get _firstDialog {
    return BlocBuilder<OnBoardingCubit, OnBoardingState>(
      buildWhen: (previous, current) =>
          previous.dialogOneTextIndex != current.dialogOneTextIndex,
      builder: (context, state) {
        final cubit = context.read<OnBoardingCubit>();

        return OnBoardingDialog(
          index: state.dialogOneTextIndex,
          content: [
            DialogContent(
              onTap: cubit.showNextPageOfDialogOne,
              buttonText: 'GENERAL.CONTINUE',
              title: 'ON_BOARDING.INTRODUCTION',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [Text('ON_BOARDING.DIALOG_1_1'.tr())],
              ),
            ),
            DialogContent(
              onTap: cubit.finishDialogOne,
              buttonText: 'GENERAL.UNDERSTOOD',
              title: 'ON_BOARDING.DIALOG_1_2_TITLE',
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('ON_BOARDING.DIALOG_1_2_CONTENT_1'.tr()),
                  const SizedBox(height: 8),
                  Text('ON_BOARDING.DIALOG_1_2_CONTENT_2'.tr()),
                  const SizedBox(height: 8),
                  Text('ON_BOARDING.DIALOG_1_2_CONTENT_3'.tr()),
                  const SizedBox(height: 8),
                  Text('ON_BOARDING.DIALOG_1_2_CONTENT_4'.tr()),
                  const SizedBox(height: 8),
                  Text('ON_BOARDING.DIALOG_1_2_CONTENT_5'.tr()),
                  const SizedBox(height: 8),
                  Text('ON_BOARDING.DIALOG_1_2_CONTENT_6'.tr()),
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _secondDialog({required VoidCallback onTap}) {
    return OnBoardingDialog(
      content: [
        DialogContent(
          onTap: onTap,
          buttonText: 'GENERAL.UNDERSTOOD',
          title: 'ON_BOARDING.DIALOG_2_1_TITLE',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Text('ON_BOARDING.DIALOG_2_1_CONTENT_1'.tr())],
          ),
        ),
      ],
    );
  }

  Widget _thirdDialog({required VoidCallback onTap}) {
    return OnBoardingDialog(
      content: [
        DialogContent(
          onTap: onTap,
          buttonText: 'GENERAL.UNDERSTOOD',
          title: 'ON_BOARDING.DIALOG_3_1_TITLE',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Text('ON_BOARDING.DIALOG_3_1_CONTENT_1'.tr())],
          ),
        ),
      ],
    );
  }

  Widget _fourthDialog({required VoidCallback onTap}) {
    return OnBoardingDialog(
      content: [
        DialogContent(
          onTap: onTap,
          buttonText: 'GENERAL.UNDERSTOOD',
          title: 'ON_BOARDING.DIALOG_4_1_TITLE',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Text('ON_BOARDING.DIALOG_4_1_CONTENT_1'.tr())],
          ),
        ),
      ],
    );
  }

  Widget _fifthDialog({required VoidCallback onTap}) {
    return OnBoardingDialog(
      content: [
        DialogContent(
          onTap: onTap,
          buttonText: 'GENERAL.UNDERSTOOD',
          title: 'ON_BOARDING.DIALOG_5_1_TITLE',
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [Text('ON_BOARDING.DIALOG_5_1_CONTENT_1'.tr())],
          ),
        ),
      ],
    );
  }
}
