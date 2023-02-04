import 'package:biodiversity/presentation/report/report.dart';
import 'package:biodiversity/presentation/result/view/result_page.dart';
import 'package:biodiversity/presentation/ui/snackbars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ReportView extends StatelessWidget {
  const ReportView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return MultiBlocListener(
      listeners: [
        BlocListener<ReportCubit, ReportState>(
          listenWhen: (previous, current) =>
              previous.galleryImageStatus != current.galleryImageStatus,
          listener: (context, state) {
            if (state.galleryImageStatus.isSubmissionFailure) {
              showErrorSnackBar(context, error: state.galleryImageError.tr());
            }
          },
        ),
        BlocListener<ReportCubit, ReportState>(
          listenWhen: (previous, current) =>
              previous.submitStatus != current.submitStatus,
          listener: (context, state) {
            if (state.submitStatus.isSubmissionSuccess) {
              final cubit = context.read<ReportCubit>();

              cubit.resetState();

              Navigator.pop(context);
              Navigator.push(context, ResultPage.route());
            }
            if (state.submitStatus.isSubmissionFailure) {
              Navigator.pop(context);
              showErrorSnackBar(context, error: state.submitError.tr());
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Fund melden'),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _stepTitle,
              _stepView,
              _navigationButtons,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _stepTitle {
    final titles = [
      'REPORT.STEP_1.STEP_1'.tr(),
      'REPORT.STEP_2.STEP_2'.tr(),
      'REPORT.STEP_3.STEP_3'.tr(),
      'REPORT.STEP_4.STEP_4'.tr(),
      'REPORT.STEP_5.STEP_5'.tr(),
    ];

    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        final size = MediaQuery.of(context).size;

        return Container(
          padding: const EdgeInsets.all(8),
          color: Colors.black12,
          width: size.width,
          child: Text(titles[state.step]),
        );
      },
    );
  }

  Widget get _stepView {
    const steps = [
      ReportStepOne(),
      ReportStepTwo(),
      ReportStepThree(),
      ReportStepFour(),
      ReportStepFive()
    ];

    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        return Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: steps[state.step],
            ),
          ),
        );
      },
    );
  }

  Widget get _navigationButtons {
    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) => previous.step != current.step,
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();

        final isLastStep = state.step == 4;

        return Container(
          color: Colors.black12,
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
          child: Row(
            children: [
              TextButton(
                onPressed: state.step != 0 ? cubit.showPreviousStep : null,
                child: Row(
                  children: [
                    const Icon(Icons.navigate_before),
                    const SizedBox(width: 8),
                    Text(
                      'REPORT.BACK'.tr(),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              if (isLastStep)
                TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => BlocProvider.value(
                      value: cubit,
                      child: const ConfirmSubmissionDialog(),
                    ),
                  ),
                  child: Row(
                    children: [
                      Text('REPORT.REPORT_SIGHTING'.tr()),
                      const SizedBox(width: 8),
                      const Icon(Icons.done)
                    ],
                  ),
                ),
              if (!isLastStep)
                TextButton(
                  onPressed: state.step < 4 ? cubit.showNextStep : null,
                  child: Row(
                    children: [
                      Text('REPORT.CONTINUE'.tr()),
                      const SizedBox(width: 8),
                      const Icon(Icons.navigate_next)
                    ],
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
