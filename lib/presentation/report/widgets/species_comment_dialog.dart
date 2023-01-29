import 'package:biodiversity/presentation/report/cubit/report_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SpeciesCommentDialog extends StatelessWidget {
  const SpeciesCommentDialog({
    super.key,
    required this.speciesIndex,
  });

  final int speciesIndex;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'REPORT.COMMENT'.tr(),
              style: textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            Text('REPORT.STEP_1.COMMENT_INFO'.tr()),
            const SizedBox(height: 32),
            _speciesCommentTextField,
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text('REPORT.CLOSE'.tr()),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget get _speciesCommentTextField {
    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) => previous.species != current.species,
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();

        return TextFormField(
          initialValue: state.species[speciesIndex].comment,
          decoration: InputDecoration(labelText: 'REPORT.COMMENT'.tr()),
          onChanged: (value) => cubit.speciesCommentChanged(
            index: speciesIndex,
            value: value,
          ),
        );
      },
    );
  }
}
