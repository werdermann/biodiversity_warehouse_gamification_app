import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/data/repository/auth_repository_impl.dart';
import 'package:biodiversity/data/repository/image_picker_repository.dart';
import 'package:biodiversity/data/repository/local_storage_repository_impl.dart';
import 'package:biodiversity/domain/use_case/login/check_token_use_case.dart';
import 'package:biodiversity/domain/use_case/login/login_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:biodiversity/presentation/app/app.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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

  print("Set interceptor afterwards");
  dio.interceptors.add(Interceptor());

  final authRepository = AuthRepositoryImpl(
    dio: dio,
    baseUrl: Constants.baseUrl,
  );

  final sharedPreferences = await SharedPreferences.getInstance();
  final localStorage =
      LocalStorageRepositoryImpl(sharedPreferences: sharedPreferences);

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

  runApp(
    App(
      checkTokenUseCase: checkTokenUseCase,
      takeGalleryImageUseCase: takeGalleryImageUseCase,
      takeCameraImageUseCase: takeCameraImageUseCase,
      imagePickerRepository: imagePickerRepository,
      localStorage: localStorage,
      loginUseCase: loginUseCase,
      authRepository: authRepository,
    ),
  );
}
