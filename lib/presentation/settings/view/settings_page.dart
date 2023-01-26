import 'package:biodiversity/data/auth_repository.dart';
import 'package:biodiversity/data/local_storage.dart';
import 'package:biodiversity/presentation/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(
        localStorage: context.read<LocalStorage>(),
        authRepository: context.read<AuthRepository>(),
      ),
      child: const SettingsView(),
    );
  }
}
