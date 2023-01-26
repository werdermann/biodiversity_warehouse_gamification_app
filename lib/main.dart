import 'package:biodiversity/data/auth_repository.dart';
import 'package:biodiversity/data/local_storage.dart';
import 'package:biodiversity/domain/login_use_case.dart';
import 'package:biodiversity/presentation/app/app.dart';
import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
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

  final authRepository = AuthRepository(dio: dio);

  final sharedPreferences = await SharedPreferences.getInstance();
  final localStorage = LocalStorage(sharedPreferences: sharedPreferences);

  final loginUseCase = LoginUseCase(
    localStorage: localStorage,
    authRepository: authRepository,
  );

  runApp(
    App(
      localStorage: localStorage,
      loginUseCase: loginUseCase,
      authRepository: authRepository,
    ),
  );
}
