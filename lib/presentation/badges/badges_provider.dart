import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/presentation/badges/badges_cubit.dart';
import 'package:biodiversity/presentation/badges/badges_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Injects the [BadgesCubit] inside the [BadgesView].
class BadgesProvider extends StatelessWidget {
  const BadgesProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BadgesCubit(
        authRepository: context.read<AuthRepository>(),
      ),
      child: const BadgesView(),
    );
  }
}
