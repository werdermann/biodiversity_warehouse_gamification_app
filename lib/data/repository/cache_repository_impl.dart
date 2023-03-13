library cache;

import 'package:biodiversity/domain/repository/cache_repository.dart';

/// An in-memory cache client.
class CacheRepositoryImpl implements CacheRepository {
  /// Cache Constructor
  CacheRepositoryImpl() : _cache = <String, Object>{};

  final Map<String, Object> _cache;

  /// Writes the provide [key], [value] pair to the in-memory cache.
  @override
  void write<T extends Object>({required String key, required T value}) {
    _cache[key] = value;
  }

  /// Looks up the value for the provided [key].
  /// Defaults to `null` if no value exists for the provided key.
  @override
  T? read<T extends Object>({required String key}) {
    final value = _cache[key];
    if (value is T) return value;
    return null;
  }
}
