import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import '../../../infra/api/dio_client.dart';
import '../../../infra/storage/secure_storage_adapter.dart';
import '../../../data/datasources/local/auth_local_datasource.dart';
import '../../../data/datasources/remote/auth_remote_datasource.dart';
import '../../../domain/services/auth_service.dart';
import '../../features/login/cubit/login_cubit.dart';
import '../../features/mfa_verification/cubit/mfa_verification_cubit.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  // Infra
  getIt.registerLazySingleton<SecureStorageAdapter>(
    () => SecureStorageAdapterImpl(const FlutterSecureStorage()),
  );

  getIt.registerLazySingleton<DioClient>(
    () => DioClient(getIt<SecureStorageAdapter>()),
  );

  // DataSources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(getIt<DioClient>().instance),
  );

  getIt.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(getIt<SecureStorageAdapter>()),
  );

  // Services
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(
      remoteDataSource: getIt<AuthRemoteDataSource>(),
      localDataSource: getIt<AuthLocalDataSource>(),
    ),
  );

  // Cubits (factory — new instance per page)
  getIt.registerFactory<LoginCubit>(
    () => LoginCubit(getIt<AuthService>()),
  );

  getIt.registerFactory<MfaVerificationCubit>(
    () => MfaVerificationCubit(getIt<AuthService>()),
  );
}
