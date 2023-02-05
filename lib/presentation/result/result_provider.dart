import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:biodiversity/presentation/result/result_cubit.dart';
import 'package:biodiversity/presentation/result/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Injects the [ResultCubit] inside the [ResultView].
class ResultProvider extends StatelessWidget {
  const ResultProvider({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (_) => const ResultProvider());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ResultCubit(
        gamificationRepository: context.read<GamificationRepository>(),
      ),
      child: const ResultView(),
    );
  }
}
