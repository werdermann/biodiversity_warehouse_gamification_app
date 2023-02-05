import 'package:biodiversity/presentation/app/app_cubit.dart';
import 'package:biodiversity/presentation/home/home_provider.dart';
import 'package:biodiversity/presentation/login/login_provider.dart';
import 'package:biodiversity/presentation/on_boarding/on_boarding_provider.dart';
import 'package:biodiversity/presentation/ui/snackbars.dart';
import 'package:biodiversity/presentation/ui/theme/theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: biodiversityTheme,
      home: ScaffoldMessenger(
        child: BlocConsumer<AppCubit, AppState>(
          listenWhen: (previous, current) =>
              previous.getConfigStatus != current.getConfigStatus,
          listener: (context, state) {
            if (state.getConfigStatus.isSubmissionSuccess) {
              showSuccessSnackBar(context, message: 'SUCCESS.GET_CONFIG'.tr());
            }
            if (state.getConfigStatus.isSubmissionFailure) {
              showErrorSnackBar(
                context,
                error: 'ERROR.GET_CONFIG_FAILED'.tr(),
              );
            }
          },
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            switch (state.status) {
              case AppStatus.authenticated:
                return const HomeProvider();
              case AppStatus.unauthenticated:
                return const LoginProvider();
              case AppStatus.onBoarding:
                return const OnBoardingProvider();
            }
          },
        ),
      ),
    );
  }
}
