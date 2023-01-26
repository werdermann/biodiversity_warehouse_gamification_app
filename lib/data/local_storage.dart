import 'package:biodiversity/domain/interfaces/local_storage_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage implements LocalStorageInterface {
  LocalStorage({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  T getObject<T>({required String key}) {
    return _sharedPreferences.get(key) as T;
  }

  @override
  Future<bool> storeString({required String value, required String key}) async {
    return await _sharedPreferences.setString(key, value);
  }

  Future<bool> clearStorage() async {
    return await _sharedPreferences.clear();
  }
}
