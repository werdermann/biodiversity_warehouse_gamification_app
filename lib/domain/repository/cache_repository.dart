/// An in-memory cache client
abstract class CacheRepository {
  void write<T extends Object>({required String key, required T value});
  T? read<T extends Object>({required String key});
}
