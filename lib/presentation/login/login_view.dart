import 'package:biodiversity/presentation/login/login_cubit.dart';
import 'package:biodiversity/presentation/ui/snackbars.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          previous.loginStatus != current.loginStatus,
      listener: (context, state) {
        if (state.loginStatus.isSubmissionFailure) {
          showErrorSnackBar(context, error: state.loginErrorMessage.tr());
        }
      },
      child: Scaffold(
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
            suffixIcon: const Icon(Icons.person),
            labelText: 'LOGIN.USERNAME'.tr(),
            errorText:
                state.username.pure ? null : state.username.error?.message.tr(),
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
            suffixIcon: const Icon(Icons.lock),
            labelText: 'LOGIN.PASSWORD'.tr(),
            errorText:
                state.password.pure ? null : state.password.error?.message.tr(),
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
