import 'package:biodiversity/domain/use_case/logout/logout_use_case.dart';
import 'package:biodiversity/presentation/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
