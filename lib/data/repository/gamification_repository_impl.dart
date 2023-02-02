import 'dart:async';

import 'package:biodiversity/data/common/network_exceptions.dart';
import 'package:biodiversity/data/dto/gamification_config.dart';
import 'package:biodiversity/data/dto/gamification_result_response.dart';
import 'package:biodiversity/data/rest_client.dart';
import 'package:biodiversity/domain/repository/gamification_repository.dart';
import 'package:cache/cache.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class GamificationRepositoryImpl implements GamificationRepository {
  GamificationRepositoryImpl({
    required Dio dio,
    required String baseUrl,
    CacheClient? cache,
  })  : _biodiversityApi = RestClient(dio, baseUrl: baseUrl),
        _cache = cache ?? CacheClient();

  final RestClient _biodiversityApi;
  final CacheClient _cache;

  final StreamController<GamificationConfig> _configStreamController =
      StreamController<GamificationConfig>.broadcast();

  /// Config cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const configCacheKey = '__config_cache_key__';

  final StreamController<GamificationResultResponse> _resultStreamController =
      StreamController<GamificationResultResponse>.broadcast();

  /// Result cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const resultCacheKey = '__result_cache_key__';

  @override
  Future<GamificationConfig> getGamificationConfig() async {
    try {
      final config = await _biodiversityApi.getGamificationConfig();
      return config;
    } catch (e) {
      throw NetworkExceptions.getDioException(e);
    }
  }

  /// Stream of [GamificationConfig] which will emit the current config
  /// whenever the config changes.
  ///
  /// Emits
  @override
  Stream<GamificationConfig> get config {
    return _configStreamController.stream.asBroadcastStream().map(
          (config) => config,
        );
  }

  @override
  GamificationConfig get currentConfig {
    return _cache.read<GamificationConfig>(key: configCacheKey) ??
        GamificationConfig.noGamification;
  }

  @override
  void updateConfig({required GamificationConfig config}) {
    _cache.write(key: configCacheKey, value: config);
    _configStreamController.add(config);
  }

  @override
  GamificationResultResponse? get currentResult {
    return _cache.read<GamificationResultResponse>(key: resultCacheKey);
  }

  @override
  Stream<GamificationResultResponse> get result {
    return _resultStreamController.stream.asBroadcastStream().map(
          (result) => result,
        );
  }

  @override
  void updateResult({required GamificationResultResponse result}) {
    _cache.write(key: resultCacheKey, value: result);
    _resultStreamController.add(result);
  }
}
