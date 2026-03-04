import 'package:dio/dio.dart';
import '../storage/secure_storage_adapter.dart';

const _baseUrl = 'https://stg-api-moni.sasi.io';
const _accessTokenKey = 'access_token';
const _refreshTokenKey = 'refresh_token';

class DioClient {
  DioClient(this._storage) {
    _dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        headers: {'Content-Type': 'application/json'},
      ),
    );

    _dio.interceptors.add(_AuthInterceptor(_dio, _storage));
  }

  final SecureStorageAdapter _storage;
  late final Dio _dio;

  Dio get instance => _dio;
}

class _AuthInterceptor extends QueuedInterceptorsWrapper {
  _AuthInterceptor(this._dio, this._storage);

  final Dio _dio;
  final SecureStorageAdapter _storage;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _storage.read(key: _accessTokenKey);
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final refreshed = await _tryRefresh();
      if (refreshed) {
        final token = await _storage.read(key: _accessTokenKey);
        final opts = err.requestOptions
          ..headers['Authorization'] = 'Bearer $token';
        try {
          final response = await _dio.fetch(opts);
          handler.resolve(response);
          return;
        } catch (_) {}
      }
    }
    handler.next(err);
  }

  Future<bool> _tryRefresh() async {
    final refreshToken = await _storage.read(key: _refreshTokenKey);
    if (refreshToken == null) return false;

    try {
      final response = await _dio.post(
        '/api/standard/v2/auth/refresh-token',
        data: {'refreshToken': refreshToken},
        options: Options(headers: {'Authorization': null}),
      );
      final data = response.data as Map<String, dynamic>;
      await _storage.write(
        key: _accessTokenKey,
        value: data['accessToken'] as String,
      );
      if (data['refreshToken'] != null) {
        await _storage.write(
          key: _refreshTokenKey,
          value: data['refreshToken'] as String,
        );
      }
      return true;
    } catch (_) {
      await _storage.deleteAll();
      return false;
    }
  }
}
