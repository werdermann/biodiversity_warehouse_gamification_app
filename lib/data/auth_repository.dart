import 'dart:async';

import 'package:biodiversity/data/auth_client.dart';
import 'package:biodiversity/data/common/api_result.dart';
import 'package:biodiversity/data/dto/login_result.dart';
import 'package:biodiversity/data/dto/user.dart';
import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  /// Constructor.
  AuthRepository({
    required Dio dio,
    CacheClient? cache,
  })  : _authClient = RestClient(dio, baseUrl: 'http://127.0.0.1:3000/'),
        _cache = cache ?? CacheClient();

  final RestClient _authClient;

  final CacheClient _cache;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  /// Player cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when the
  /// authentication state changes
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<User> get user {
    return _userStreamController.stream.asBroadcastStream().map(
          (user) => user,
        );
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  /// Updates the user and triggers the stream controller
  void updateUser({required User user}) {
    _cache.write(key: userCacheKey, value: user);
    _userStreamController.add(user);
  }

  Future<ApiResult<LoginResult>> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _authClient.login(
        username: username,
        password: password,
      );

      return ApiResult.success(data: response);
    } catch (e) {
      return const ApiResult.failure(error: '');
    }
  }
}
