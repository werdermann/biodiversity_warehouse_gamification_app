import 'package:biodiversity/presentation/report/cubit/report_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepThree extends StatelessWidget {
  const StepThree({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();

    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          TextButton(
            onPressed: () => print('test'),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_a_photo),
                Text('REPORT.STEP_3.CAMERA'.tr())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
