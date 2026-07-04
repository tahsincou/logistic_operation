import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistic_operation/core/network/api_client.dart';
import 'package:logistic_operation/core/providers/storage_provider.dart';

import '../network/dio_client.dart';

final dioProvider = Provider<Dio>((ref) {
  final secureStorage = ref.read(secureStorageServiceProvider);

  return DioClient(secureStorage).create();
});

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.read(dioProvider));
});
