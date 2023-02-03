import 'package:biodiversity/domain/use_case/location/get_location_use_case.dart';
import 'package:biodiversity/domain/use_case/location/request_location_permission_use_case.dart';
import 'package:biodiversity/domain/use_case/submit/submit_sighting_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:biodiversity/presentation/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (_) => const OnBoardingPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(
        takeGalleryImageUseCase: context.read<TakeGalleryImageUseCase>(),
        takeCameraImageUseCase: context.read<TakeCameraImageUseCase>(),
        getLocationUseCase: context.read<GetLocationUseCase>(),
        requestLocationPermissionUseCase:
            context.read<RequestLocationPermissionUseCase>(),
        submitSightingUseCase: context.read<SubmitSightingUseCase>(),
      ),
      child: const OnBoardingView(),
    );
  }
}
