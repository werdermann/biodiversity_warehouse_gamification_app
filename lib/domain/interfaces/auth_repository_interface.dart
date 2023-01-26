import 'dart:async';

import 'package:biodiversity/data/common/api_result.dart';
import 'package:biodiversity/data/dto/login_result.dart';

abstract class AuthRepositoryInterface {
  Future<ApiResult<LoginResult>> login({
    required String username,
    required String password,
  });
}
