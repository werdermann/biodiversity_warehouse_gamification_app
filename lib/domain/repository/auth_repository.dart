import 'dart:async';

import 'package:biodiversity/data/dto/login_result.dart';
import 'package:biodiversity/data/dto/user.dart';

/// Repository that is used for authenticating the user and maintains the
/// current user object.
abstract class AuthRepository {
  Future<LoginResult> login({
    required String username,
    required String password,
  });

  Future<User> fetchUser();

  void updateUser({required User user});

  Stream<User> get user;
  User get currentUser;
}
