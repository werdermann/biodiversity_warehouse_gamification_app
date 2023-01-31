import 'package:biodiversity/data/repository/auth_repository_impl.dart';
import 'package:biodiversity/data/repository/local_storage_repository_impl.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:biodiversity/presentation/settings/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsCubit(
        localStorage: context.read<LocalStorageRepository>(),
        authRepository: context.read<AuthRepository>(),
      ),
      child: const SettingsView(),
    );
  }
}
