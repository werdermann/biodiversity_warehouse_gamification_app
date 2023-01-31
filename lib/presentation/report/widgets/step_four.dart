import 'package:biodiversity/data/dto/report_method.dart';
import 'package:biodiversity/presentation/report/report.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepFour extends StatelessWidget {
  const StepFour({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _reportDateInputField,
        const SizedBox(height: 16),
        _methodInputField,
        const SizedBox(height: 16),
        _methodCommentInputField,
      ],
    );
  }

  Widget get _reportDateInputField {
    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) => previous.date != current.date,
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();

        final date = state.date != null
            ? '${state.date?.day}.${state.date?.month}.${state.date?.year}'
            : 'REPORT.STEP_4.UNKNOWN_DATE'.tr();

        return ListTile(
          title: Text('REPORT.STEP_4.REPORT_DATE'.tr()),
          subtitle: Text(date),
          trailing: TextButton(
            onPressed: () async {
              final date = await showDatePicker(
                currentDate: state.date,
                context: context,
                initialDate: state.date ?? DateTime.now(),
                firstDate: DateTime(2023),
                lastDate: DateTime.now(),
              );
              cubit.dateChanged(date);
            },
            child: const Icon(Icons.date_range),
          ),
        );
      },
    );
  }

  Widget get _methodInputField {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();

        return DropdownButtonFormField(
          value: state.reportMethod,
          decoration: InputDecoration(
            labelText: 'REPORT.STEP_4.METHOD'.tr(),
          ),
          items: ReportMethod.values.map<DropdownMenuItem<ReportMethod>>(
            (ReportMethod method) {
              return DropdownMenuItem<ReportMethod>(
                value: method,
                child: Text(method.message.tr()),
              );
            },
          ).toList(),
          onChanged: cubit.methodChanged,
        );
      },
    );
  }

  Widget get _methodCommentInputField {
    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) =>
          previous.methodComment != current.methodComment,
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();

        return TextFormField(
          initialValue: state.methodComment,
          onChanged: cubit.methodCommentChanged,
          decoration: InputDecoration(
            labelText: 'REPORT.STEP_4.COMMENT'.tr(),
          ),
        );
      },
    );
  }
}
