import 'package:biodiversity/data/repository/auth_repository_impl.dart';
import 'package:biodiversity/data/repository/image_picker_repository.dart';
import 'package:biodiversity/data/repository/local_storage_repository_impl.dart';
import 'package:biodiversity/domain/use_case/login/check_token_use_case.dart';
import 'package:biodiversity/domain/use_case/login/login_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_camera_image_use_case.dart';
import 'package:biodiversity/domain/use_case/take_image/take_gallery_image_use_case.dart';
import 'package:biodiversity/presentation/app/app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    required this.loginUseCase,
    required this.authRepository,
    required this.localStorage,
    required this.imagePickerRepository,
    required this.takeGalleryImageUseCase,
    required this.takeCameraImageUseCase,
    required this.checkTokenUseCase,
  });

  /// Use cases
  final LoginUseCase loginUseCase;
  final TakeGalleryImageUseCase takeGalleryImageUseCase;
  final TakeCameraImageUseCase takeCameraImageUseCase;
  final CheckTokenUseCase checkTokenUseCase;

  final LocalStorageRepositoryImpl localStorage;
  final AuthRepositoryImpl authRepository;
  final ImageRepositoryImpl imagePickerRepository;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('de', 'DE')],
      fallbackLocale: const Locale('de', 'DE'),
      path: 'assets/translations',
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => loginUseCase),
          RepositoryProvider(create: (_) => takeGalleryImageUseCase),
          RepositoryProvider(create: (_) => takeCameraImageUseCase),
          RepositoryProvider(create: (_) => authRepository),
          RepositoryProvider(create: (_) => localStorage),
          RepositoryProvider(create: (_) => imagePickerRepository),
        ],
        child: BlocProvider(
          create: (_) => AppCubit(
            checkTokenUseCase: checkTokenUseCase,
            authRepository: authRepository,
          ),
          child: const AppView(),
        ),
      ),
    );
  }
}
