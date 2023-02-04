import 'dart:async';

import 'package:biodiversity/common/constants.dart';
import 'package:biodiversity/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageRepositoryImpl implements LocalStorageRepository {
  LocalStorageRepositoryImpl({
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  final StreamController<bool> _hasOnBoardingSeenStreamController =
      StreamController.broadcast();

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

  @override
  bool get currentHasOnBoardingSeen {
    return _sharedPreferences.getBool(Constants.hasOnBoardingSeenKey) ?? false;
  }

  @override
  Stream<bool> get hasOnBoardingSeen {
    return _hasOnBoardingSeenStreamController.stream.asBroadcastStream().map(
          (hasOnBoardingSeen) => hasOnBoardingSeen,
        );
  }

  @override
  void updateHasOnBoardingSeen({required bool hasOnBoardingSeen}) {
    _hasOnBoardingSeenStreamController.add(hasOnBoardingSeen);
  }
}
