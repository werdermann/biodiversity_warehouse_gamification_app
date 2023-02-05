import 'package:biodiversity/domain/use_case/logout/logout_use_case.dart';
import 'package:biodiversity/presentation/settings/settings_cubit.dart';
import 'package:biodiversity/presentation/settings/settings_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsProvider extends StatelessWidget {
  const SettingsProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(
        logoutUseCase: context.read<LogoutUseCase>(),
      ),
      child: const SettingsView(),
    );
  }
}
