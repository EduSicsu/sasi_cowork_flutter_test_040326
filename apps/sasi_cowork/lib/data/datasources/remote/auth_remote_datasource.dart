import 'package:dio/dio.dart';
import '../../models/auth_model.dart';

abstract interface class AuthRemoteDataSource {
  Future<AuthModel> login({
    required String email,
    required String password,
    int? roleId,
    int? preferredRoleId,
  });

  Future<void> verifyMfa({required String code, required String mfaType});

  Future<AuthModel> refreshToken(String refreshToken);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this._dio);

  final Dio _dio;

  @override
  Future<AuthModel> login({
    required String email,
    required String password,
    int? roleId,
    int? preferredRoleId,
  }) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/standard/v2/auth/login',
      data: {
        'email': email,
        'password': password,
        if (roleId != null) 'roleId': roleId,
        if (preferredRoleId != null) 'prefferedRoleId': preferredRoleId,
      },
    );
    return AuthModel.fromJson(response.data!);
  }

  @override
  Future<void> verifyMfa({
    required String code,
    required String mfaType,
  }) async {
    await _dio.post<void>(
      '/api/standard/v2/auth/mfa/verify',
      data: {'code': code, 'mfaType': mfaType},
    );
  }

  @override
  Future<AuthModel> refreshToken(String refreshToken) async {
    final response = await _dio.post<Map<String, dynamic>>(
      '/api/standard/v2/auth/refresh-token',
      data: {'refreshToken': refreshToken},
      options: Options(headers: {'Authorization': null}),
    );
    return AuthModel.fromJson(response.data!);
  }
}
