import '../entities/auth_entity.dart';
import '../../data/datasources/local/auth_local_datasource.dart';
import '../../data/datasources/remote/auth_remote_datasource.dart';

abstract interface class AuthService {
  Future<AuthEntity> login({
    required String email,
    required String password,
    int? roleId,
    int? preferredRoleId,
  });

  Future<void> verifyMfa({
    required String code,
    required String mfaType,
  });

  Future<AuthEntity> refreshToken(String refreshToken);

  Future<void> logout();
}

class AuthServiceImpl implements AuthService {
  AuthServiceImpl({
    required AuthRemoteDataSource remoteDataSource,
    required AuthLocalDataSource localDataSource,
  })  : _remote = remoteDataSource,
        _local = localDataSource;

  final AuthRemoteDataSource _remote;
  final AuthLocalDataSource _local;

  @override
  Future<AuthEntity> login({
    required String email,
    required String password,
    int? roleId,
    int? preferredRoleId,
  }) async {
    final model = await _remote.login(
      email: email,
      password: password,
      roleId: roleId,
      preferredRoleId: preferredRoleId,
    );
    final entity = model.toEntity();

    await _local.saveAccessToken(entity.accessToken);
    if (entity.refreshToken != null) {
      await _local.saveRefreshToken(entity.refreshToken!);
    }

    return entity;
  }

  @override
  Future<void> verifyMfa({
    required String code,
    required String mfaType,
  }) =>
      _remote.verifyMfa(code: code, mfaType: mfaType);

  @override
  Future<AuthEntity> refreshToken(String refreshToken) async {
    final model = await _remote.refreshToken(refreshToken);
    final entity = model.toEntity();

    await _local.saveAccessToken(entity.accessToken);
    if (entity.refreshToken != null) {
      await _local.saveRefreshToken(entity.refreshToken!);
    }

    return entity;
  }

  @override
  Future<void> logout() => _local.clearTokens();
}
