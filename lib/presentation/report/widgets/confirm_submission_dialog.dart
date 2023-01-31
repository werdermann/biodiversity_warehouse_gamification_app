import 'package:biodiversity/presentation/report/cubit/report_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class ConfirmSubmissionDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();

    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "REPORT.REPORT_SIGHTING".tr(),
              style: textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text("REPORT.CONFIRM_TEXT".tr()),
            const SizedBox(height: 8),
            _buttons,
          ],
        ),
      ),
    );
  }

  Widget get _buttons {
    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) =>
          previous.submitStatus != current.submitStatus,
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();

        return Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: state.submitStatus.isSubmissionInProgress
                  ? null
                  : () => Navigator.pop(context),
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
              child: Text('REPORT.CANCEL'.tr()),
            ),
            TextButton(
              onPressed: state.submitStatus.isSubmissionInProgress
                  ? null
                  : cubit.submitSighting,
              child: state.submitStatus.isSubmissionInProgress
                  ? SizedBox(
                      height: 16,
                      width: 16,
                      child: CircularProgressIndicator(strokeWidth: 3),
                    )
                  : Text('REPORT.REPORT_SIGHTING'.tr()),
            ),
          ],
        );
      },
    );
  }
}
