abstract class LocalStorageInterface {
  Future<bool> storeString({required String value, required String key});
  T getObject<T>({required String key});
}
