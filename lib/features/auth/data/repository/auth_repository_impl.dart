import 'package:logistic_operation/features/auth/data/repository/auth_repository.dart';

import '../../../../core/storage/secure_storage_service.dart';
import '../../domain/entities/user.dart';
import '../datasource/auth_remote_datasource.dart';
import '../dto/login_request.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final SecureStorageService storage;

  AuthRepositoryImpl(this.remote, this.storage);

  @override
  Future<User> login(LoginRequest request) async {
    final user = await remote.login(request);

    await storage.saveToken(user.token);

    return user;
  }

  @override
  Future<void> logout() async {
    await storage.clear();
  }

  @override
  Future<User?> currentUser() async {
    return null;
  }
}
