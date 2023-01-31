import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/data/repository/auth_repository_impl.dart';
import 'package:biodiversity/data/repository/gamification_repository_impl.dart';
import 'package:biodiversity/data/repository/image_picker_repository.dart';
import 'package:biodiversity/data/repository/local_storage_repository_impl.dart';
import 'package:biodiversity/data/repository/sighting_repository_impl.dart';
import 'package:biodiversity/domain/use_case/config/get_gamification_config_use_case.dart';
import 'package:biodiversity/domain/use_case/location/get_location_use_case.dart';
import 'package:biodiversity/domain/use_case/location/request_location_permission_use_case.dart';
import 'package:biodiversity/domain/use_case/login/check_token_use_case.dart';
import 'package:biodiversity/domain/use_case/login/login_use_case.dart';
import 'package:biodiversity/domain/use_case/submit/submit_sighting_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:biodiversity/presentation/app/app.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  final dio = Dio(
    BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 5000,
      contentType: Headers.jsonContentType,
    ),
  );

  dio.interceptors.add(Interceptor());

  final authRepository = AuthRepositoryImpl(
    dio: dio,
    baseUrl: Constants.baseUrl,
  );

  final gamificationRepository = GamificationRepositoryImpl(
    dio: dio,
    baseUrl: Constants.baseUrl,
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  final localStorage = LocalStorageRepositoryImpl(
    sharedPreferences: sharedPreferences,
  );

  final loginUseCase = LoginUseCase(
    authRepository: authRepository,
    localStorageRepository: localStorage,
  );

  final imagePicker = ImagePicker();

  final imagePickerRepository = ImageRepositoryImpl(imagePicker: imagePicker);

  final takeCameraImageUseCase = TakeCameraImageUseCase(
    imageRepository: imagePickerRepository,
  );

  final takeGalleryImageUseCase = TakeGalleryImageUseCase(
    imageRepository: imagePickerRepository,
  );

  final checkTokenUseCase = CheckTokenUseCase(
    dio: dio,
    authRepository: authRepository,
    localStorageRepository: localStorage,
  );

  final locator = GeolocatorPlatform.instance;

  final requestLocationPermissionUseCase = RequestLocationPermissionUseCase(
    locator: locator,
  );

  final getLocationUseCase = GetLocationUseCase(locator: locator);

  final sightingRepository = SightingRepositoryImpl(
    dio: dio,
    baseUrl: Constants.baseUrl,
  );

  final submitSightingUseCase = SubmitSightingUseCase(
    sightingRepository: sightingRepository,
  );

  final getGamificationConfigUseCase = GetGamificationConfigUseCase(
    gamificationRepository: gamificationRepository,
  );

  runApp(
    App(
      checkTokenUseCase: checkTokenUseCase,
      takeGalleryImageUseCase: takeGalleryImageUseCase,
      takeCameraImageUseCase: takeCameraImageUseCase,
      imagePickerRepository: imagePickerRepository,
      localStorage: localStorage,
      loginUseCase: loginUseCase,
      authRepository: authRepository,
      requestLocationPermissionUseCase: requestLocationPermissionUseCase,
      getLocationUseCase: getLocationUseCase,
      submitSightingUseCase: submitSightingUseCase,
      getGamificationConfigUseCase: getGamificationConfigUseCase,
      gamificationRepository: gamificationRepository,
    ),
  );
}
