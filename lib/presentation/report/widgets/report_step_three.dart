import 'package:biodiversity/presentation/report/report_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportStepThree extends StatelessWidget {
  const ReportStepThree({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ReportCubit>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 8),
        _noImagesSelectedText,
        const SizedBox(height: 8),
        Text(
          'REPORT.STEP_4.INTRODUCTION'.tr(),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: cubit.takeImageFromCamera,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add_a_photo),
                  Text('REPORT.STEP_3.CAMERA'.tr())
                ],
              ),
            ),
            const SizedBox(width: 8),
            TextButton(
              onPressed: cubit.takeImageFromGallery,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.image),
                  Text('REPORT.STEP_3.GALLERY'.tr())
                ],
              ),
            ),
          ],
        ),
        _images,
      ],
    );
  }

  Widget get _noImagesSelectedText {
    return BlocBuilder<ReportCubit, ReportState>(
      builder: (context, state) {
        return Visibility(
          visible: state.images.isEmpty,
          child: Text('REPORT.STEP_4.NO_IMAGE_SELECTED'.tr()),
        );
      },
    );
  }

  Widget get _images {
    return BlocBuilder<ReportCubit, ReportState>(
      buildWhen: (previous, current) => previous.images != current.images,
      builder: (context, state) {
        final cubit = context.read<ReportCubit>();

        return Column(
          children: [
            for (final image in state.images)
              ListTile(
                leading: Image.file(
                  image,
                  height: 100,
                  width: 64,
                ),
                title: Text(
                  'REPORT.STEP_4.IMAGE'.tr(
                    namedArgs: {'index': '${state.images.indexOf(image) + 1}'},
                  ),
                ),
                trailing: IconButton(
                  onPressed: () => cubit.removeImage(image),
                  icon: const Icon(Icons.delete),
                ),
              ),
          ],
        );
      },
    );
  }
}
