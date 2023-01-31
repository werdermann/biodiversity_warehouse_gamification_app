import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'badges_state.dart';

class BadgesCubit extends Cubit<BadgesState> {
  BadgesCubit() : super(BadgesState());
}
