import 'package:biodiversity/presentation/report/cubit/report_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StepOne extends StatelessWidget {
  const StepOne({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(16),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _species,
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.add),
                const SizedBox(width: 8),
                Text(
                  'REPORT.STEP_1.ADD_SPECIES'.tr(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get _species {
    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) => previous.species != current.species,
      builder: (context, state) {},
    );
  }
}
