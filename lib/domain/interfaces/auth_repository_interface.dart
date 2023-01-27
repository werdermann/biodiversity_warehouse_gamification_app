import 'dart:async';

import 'package:biodiversity/data/common/result.dart';
import 'package:biodiversity/data/dto/login_result.dart';

abstract class AuthRepositoryInterface {
  Future<Result<LoginResult>> login({
    required String username,
    required String password,
  });
}
