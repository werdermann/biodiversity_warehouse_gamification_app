import 'package:biodiversity/presentation/on_boarding/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingPage extends StatelessWidget {
  static Route route() => MaterialPageRoute(builder: (_) => OnBoardingPage());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingCubit(),
      child: OnBoardingView(),
    );
  }
}
