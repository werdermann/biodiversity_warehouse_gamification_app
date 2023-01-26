import 'package:biodiversity/data/auth_repository.dart';
import 'package:biodiversity/data/local_storage.dart';
import 'package:biodiversity/domain/login_use_case.dart';
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
  });

  final LoginUseCase loginUseCase;

  final LocalStorage localStorage;

  final AuthRepository authRepository;

  @override
  Widget build(BuildContext context) {
    return EasyLocalization(
      supportedLocales: const [Locale('de', 'DE')],
      fallbackLocale: const Locale('de', 'DE'),
      path: 'assets/translations',
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(create: (_) => loginUseCase),
          RepositoryProvider(create: (_) => authRepository),
          RepositoryProvider(create: (_) => localStorage),
        ],
        child: BlocProvider(
          create: (_) => AppCubit(
            authRepository: authRepository,
          ),
          child: const AppView(),
        ),
      ),
    );
  }
}
