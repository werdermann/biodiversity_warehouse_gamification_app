import 'package:biodiversity/presentation/app/app.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (_) => AppCubit(), child: const AppView());
  }
}
