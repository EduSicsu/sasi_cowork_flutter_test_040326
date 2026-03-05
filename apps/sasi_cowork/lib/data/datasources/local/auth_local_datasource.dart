import '../../../infra/storage/secure_storage_adapter.dart';
import '../../../infra/storage/storage_keys.dart';

abstract interface class AuthLocalDataSource {
  Future<void> saveAccessToken(String token);
  Future<void> saveRefreshToken(String token);
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<void> clearTokens();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  AuthLocalDataSourceImpl(this._storage);

  final SecureStorageAdapter _storage;

  @override
  Future<void> saveAccessToken(String token) =>
      _storage.write(key: StorageKeys.accessToken, value: token);

  @override
  Future<void> saveRefreshToken(String token) =>
      _storage.write(key: StorageKeys.refreshToken, value: token);

  @override
  Future<String?> getAccessToken() =>
      _storage.read(key: StorageKeys.accessToken);

  @override
  Future<String?> getRefreshToken() =>
      _storage.read(key: StorageKeys.refreshToken);

  @override
  Future<void> clearTokens() async {
    await _storage.delete(key: StorageKeys.accessToken);
    await _storage.delete(key: StorageKeys.refreshToken);
  }
}
