import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:biodiversity/presentation/result/cubit/result_cubit.dart';
import 'package:biodiversity/presentation/result/view/result_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  static Route route() => MaterialPageRoute(builder: (_) => const ResultPage());

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
