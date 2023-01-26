import 'package:biodiversity/presentation/login/cubit/login_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text('LOGIN.LOGIN'.tr())),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(
                'LOGIN.PROTOTYPE'.tr(),
                style: textTheme.titleMedium,
              ),
              const SizedBox(height: 32),
              _usernameInputField,
              const SizedBox(height: 32),
              _passwordInputField,
              const SizedBox(height: 32),
              _loginButton,
            ],
          ),
        ),
      ),
    );
  }

  Widget get _usernameInputField {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.username != current.username,
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return TextFormField(
          initialValue: state.username.value,
          onChanged: cubit.usernameChanged,
          decoration: InputDecoration(
            labelText: 'LOGIN.USERNAME'.tr(),
            errorText:
                state.username.pure ? null : state.username.error?.message.tr(),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }

  Widget get _passwordInputField {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return TextFormField(
          initialValue: state.password.value,
          onChanged: cubit.passwordChanged,
          decoration: InputDecoration(
            labelText: 'LOGIN.PASSWORD'.tr(),
            errorText:
                state.password.pure ? null : state.password.error?.message.tr(),
            border: const OutlineInputBorder(),
          ),
        );
      },
    );
  }

  Widget get _loginButton {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus,
      builder: (context, state) {
        final cubit = context.read<LoginCubit>();

        return ElevatedButton(
          onPressed: state.loginStatus.isValid ? cubit.login : null,
          child: Text('LOGIN.LOGIN'.tr()),
        );
      },
    );
  }
}
