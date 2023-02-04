import 'dart:async';

import 'package:biodiversity/data/common/network_exceptions.dart';
import 'package:biodiversity/data/dto/login_result.dart';
import 'package:biodiversity/data/dto/user.dart';
import 'package:biodiversity/data/rest_client.dart';
import 'package:biodiversity/domain/repository/auth_repository.dart';
import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AuthRepositoryImpl implements AuthRepository {
  /// Constructor.
  AuthRepositoryImpl({
    required String baseUrl,
    required Dio dio,
    CacheClient? cache,
  })  : _biodiversityApi = RestClient(dio, baseUrl: baseUrl),
        _cache = cache ?? CacheClient();

  final RestClient _biodiversityApi;

  final CacheClient _cache;

  final StreamController<User> _userStreamController =
      StreamController<User>.broadcast();

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  @override
  User get currentUser {
    return _cache.read<User>(key: userCacheKey) ?? User.empty;
  }

  /// Updates the user and triggers the stream controller
  @override
  void updateUser({required User user}) {
    _cache.write(key: userCacheKey, value: user);
    _userStreamController.add(user);
  }

  @override
  Future<LoginResult> login({
    required String username,
    required String password,
  }) async {
    try {
      final response = await _biodiversityApi.login(
        username: username,
        password: password,
      );

      return response;
    } catch (e) {
      final error = NetworkExceptions.getDioException(e);

      throw error;
    }
  }

  /// Stream of [User] which will emit the current user when the
  /// authentication state changes
  ///
  /// Emits [User.empty] if the user is not authenticated.
  @override
  Stream<User> get user {
    return _userStreamController.stream.asBroadcastStream().map(
          (user) => user,
        );
  }

  @override
  Future<User> fetchUser() async {
    try {
      return await _biodiversityApi.getUser();
    } catch (_) {
      rethrow;
    }
  }
}
