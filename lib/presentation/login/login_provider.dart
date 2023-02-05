import 'package:biodiversity/domain/use_case/login/login_use_case.dart';
import 'package:biodiversity/presentation/login/login_cubit.dart';
import 'package:biodiversity/presentation/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Injects the [LoginCubit] inside the [LoginView].
class LoginProvider extends StatelessWidget {
  const LoginProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(
        loginUseCase: context.read<LoginUseCase>(),
      ),
      child: const LoginView(),
    );
  }
}
