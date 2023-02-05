import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:biodiversity/domain/repository/image_picker_repository.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:biodiversity/domain/use_case/config/get_gamification_config_use_case.dart';
import 'package:biodiversity/domain/use_case/leaderboard/get_leaderboard_use_case.dart';
import 'package:biodiversity/domain/use_case/location/get_location_use_case.dart';
import 'package:biodiversity/domain/use_case/location/request_location_permission_use_case.dart';
import 'package:biodiversity/domain/use_case/login/check_token_use_case.dart';
import 'package:biodiversity/domain/use_case/login/login_use_case.dart';
import 'package:biodiversity/domain/use_case/logout/logout_use_case.dart';
import 'package:biodiversity/domain/use_case/on_boarding/finish_on_boarding_use_case.dart';
import 'package:biodiversity/domain/use_case/on_boarding/has_on_boarding_finished_use_case.dart';
import 'package:biodiversity/domain/use_case/submit/submit_sighting_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:biodiversity/presentation/app/app_cubit.dart';
import 'package:biodiversity/presentation/app/app_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppProvider extends StatelessWidget {
  const AppProvider({
    super.key,
    required this.loginUseCase,
    required this.authRepository,
    required this.localStorage,
    required this.imagePickerRepository,
    required this.takeGalleryImageUseCase,
    required this.takeCameraImageUseCase,
    required this.checkTokenUseCase,
    required this.getLocationUseCase,
    required this.requestLocationPermissionUseCase,
    required this.submitSightingUseCase,
    required this.getGamificationConfigUseCase,
    required this.gamificationRepository,
    required this.logoutUseCase,
    required this.getLeaderboardUseCase,
    required this.hasOnBoardingFinishedUseCase,
    required this.finishOnBoardingUseCase,
  });

  /// Use cases
  final LoginUseCase loginUseCase;
  final TakeGalleryImageUseCase takeGalleryImageUseCase;
  final TakeCameraImageUseCase takeCameraImageUseCase;
  final CheckTokenUseCase checkTokenUseCase;
  final GetLocationUseCase getLocationUseCase;
  final RequestLocationPermissionUseCase requestLocationPermissionUseCase;
  final SubmitSightingUseCase submitSightingUseCase;
  final GetGamificationConfigUseCase getGamificationConfigUseCase;
  final LogoutUseCase logoutUseCase;
  final GetLeaderboardUseCase getLeaderboardUseCase;
  final HasOnBoardingFinishedUseCase hasOnBoardingFinishedUseCase;
  final FinishOnBoardingUseCase finishOnBoardingUseCase;

  /// Repositories
  final LocalStorageRepository localStorage;
  final AuthRepository authRepository;
  final ImageRepository imagePickerRepository;
  final GamificationRepository gamificationRepository;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('de', 'DE')],
      fallbackLocale: const Locale('de', 'DE'),
      path: 'assets/translations',
      child: MultiRepositoryProvider(
        providers: [
          /// Use cases
          RepositoryProvider(create: (_) => loginUseCase),
          RepositoryProvider(create: (_) => takeGalleryImageUseCase),
          RepositoryProvider(create: (_) => takeCameraImageUseCase),
          RepositoryProvider(create: (_) => getLocationUseCase),
          RepositoryProvider(create: (_) => requestLocationPermissionUseCase),
          RepositoryProvider(create: (_) => submitSightingUseCase),
          RepositoryProvider(create: (_) => getGamificationConfigUseCase),
          RepositoryProvider(create: (_) => logoutUseCase),
          RepositoryProvider(create: (_) => getLeaderboardUseCase),
          RepositoryProvider(create: (_) => hasOnBoardingFinishedUseCase),
          RepositoryProvider(create: (_) => finishOnBoardingUseCase),

          /// Repositories
          RepositoryProvider(create: (_) => authRepository),
          RepositoryProvider(create: (_) => localStorage),
          RepositoryProvider(create: (_) => imagePickerRepository),
          RepositoryProvider(create: (_) => gamificationRepository),
        ],
        child: BlocProvider(
          create: (_) => AppCubit(
            checkTokenUseCase: checkTokenUseCase,
            authRepository: authRepository,
            getGamificationConfigUseCase: getGamificationConfigUseCase,
            hasOnBoardingFinishedUseCase: hasOnBoardingFinishedUseCase,
            localStorageRepository: localStorage,
          ),
          child: const AppView(),
        ),
      ),
    );
  }
}
