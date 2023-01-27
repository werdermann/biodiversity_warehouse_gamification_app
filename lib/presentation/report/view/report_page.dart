import 'package:biodiversity/domain/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/take_gallery_image_use_case.dart';
import 'package:biodiversity/presentation/report/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ReportCubit(
        takeCameraImageUseCase: context.read<TakeCameraImageUseCase>(),
        takeGalleryImageUseCase: context.read<TakeGalleryImageUseCase>(),
      ),
      child: const ReportView(),
    );
  }
}
