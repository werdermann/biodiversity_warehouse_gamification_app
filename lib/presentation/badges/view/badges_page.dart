import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:biodiversity/presentation/badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BadgesPage extends StatelessWidget {
  const BadgesPage({super.key});

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
