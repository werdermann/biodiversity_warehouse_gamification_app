import 'package:biodiversity/domain/use_case/login/login_use_case.dart';
import 'package:biodiversity/presentation/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

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
