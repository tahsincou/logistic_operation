import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistic_operation/core/providers/network_provider.dart';
import 'package:logistic_operation/core/providers/storage_provider.dart';
import 'package:logistic_operation/features/auth/data/repository/auth_repository.dart';
import 'package:logistic_operation/features/auth/domain/usecases/check_login_usecase.dart';
import 'package:logistic_operation/features/auth/domain/usecases/login_usecase.dart';
import 'package:logistic_operation/features/auth/domain/usecases/logout_usecase.dart';

import '../../data/datasource/auth_remote_datasource.dart';
import '../../data/datasource/auth_remote_datasource_impl.dart';
import '../../data/repository/auth_repository_impl.dart';

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.read(apiClientProvider));
});

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(
    ref.read(authRemoteDataSourceProvider),
    ref.read(secureStorageServiceProvider),
  );
});

final loginUseCaseProvider = Provider<LoginUseCase>((ref) {
  return LoginUseCase(ref.read(authRepositoryProvider));
});

final checkLoginUseCaseProvider = Provider<CheckLoginUseCase>((ref) {
  return CheckLoginUseCase(ref.read(authRepositoryProvider));
});

final logoutUseCaseProvider = Provider<LogoutUseCase>((ref) {
  return LogoutUseCase(ref.read(authRepositoryProvider));
});
