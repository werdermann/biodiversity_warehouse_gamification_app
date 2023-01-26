import 'package:biodiversity/presentation/app/app.dart';
import 'package:biodiversity/presentation/home/home.dart';
import 'package:biodiversity/presentation/login/login.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.green,
      ),
      home: BlocBuilder<AppCubit, AppState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          return state.status == AppStatus.authenticated
              ? const HomePage()
              : const LoginPage();
        },
      ),
    );
  }
}
