import 'package:dio/dio.dart';
import 'package:logistic_operation/core/network/dio_client.dart';
import 'package:logistic_operation/features/auth/data/model/user_model.dart';

import '../../../../core/network/api_endpoints.dart';
import '../dto/login_request.dart';
import 'auth_remote_datasource.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final Dio _dio = DioClient.dio;

  @override
  Future<UserModel> login(LoginRequest request) async {
    final response = await _dio.post(
      ApiEndpoints.login,
      data: request.toJson(),
    );

    return UserModel.fromJson(response.data);
  }
}
