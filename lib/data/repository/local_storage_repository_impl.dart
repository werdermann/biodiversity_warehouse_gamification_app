import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  LocalStorageRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  T? getObject<T>({required String key}) {
    return _sharedPreferences.get(key) as T?;
  }

  @override
  Future<bool> storeString({required String value, required String key}) async {
    return await _sharedPreferences.setString(key, value);
  }

  @override
  Future<bool> clearStorage() async {
    return await _sharedPreferences.clear();
  }

  @override
  Future<bool> storeBool({required bool value, required String key}) async {
    return await _sharedPreferences.setBool(key, value);
  }
}
