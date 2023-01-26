import 'package:biodiversity/presentation/settings/cubit/settings_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SettingsCubit>();

    return Scaffold(
      appBar: AppBar(
        title: Text('SETTINGS.SETTINGS'.tr()),
        actions: [
          IconButton(onPressed: cubit.logout, icon: Icon(Icons.logout)),
        ],
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
