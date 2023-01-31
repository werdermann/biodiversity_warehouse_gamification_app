import 'package:biodiversity/presentation/badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BadgesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BadgesCubit(),
      child: BadgesView(),
    );
  }
}
