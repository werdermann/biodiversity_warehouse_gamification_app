import 'package:biodiversity/presentation/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  static Route route() =>
      MaterialPageRoute(builder: (_) => const OnBoardingPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingCubit(),
      child: const OnBoardingView(),
    );
  }
}
