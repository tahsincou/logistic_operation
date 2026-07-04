import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../services/auth_service.dart';
import 'storage_provider.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService(ref.read(secureStorageServiceProvider));
});
