import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:biodiversity/domain/use_case/location/get_location_use_case.dart';
import 'package:biodiversity/domain/use_case/location/request_location_permission_use_case.dart';
import 'package:biodiversity/domain/use_case/submit/submit_sighting_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:biodiversity/presentation/home/home.dart';
import 'package:biodiversity/presentation/report/report.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ReportCubit(
            takeCameraImageUseCase: context.read<TakeCameraImageUseCase>(),
            takeGalleryImageUseCase: context.read<TakeGalleryImageUseCase>(),
            getLocationUseCase: context.read<GetLocationUseCase>(),
            requestLocationPermissionUseCase:
                context.read<RequestLocationPermissionUseCase>(),
            submitSightingUseCase: context.read<SubmitSightingUseCase>(),
          ),
        ),
        BlocProvider(
          create: (context) => HomeCubit(
            gamificationRepository: context.read<GamificationRepository>(),
          ),
        ),
      ],
      child: const HomeView(),
    );
  }
}
