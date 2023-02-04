abstract class LocalStorageRepository {
  Future<bool> storeBool({required bool value, required String key});
  Future<bool> storeString({required String value, required String key});
  T? getObject<T>({required String key});
  Future<bool> clearStorage();

  void updateHasOnBoardingSeen({required bool hasOnBoardingSeen});

  Stream<bool> get hasOnBoardingSeen;
  bool get currentHasOnBoardingSeen;
}
