import '../services/environment_service.dart';

class AppConfig {
  static String _environment = 'demo';

  static Future<void> initialize() async {
    _environment = await EnvironmentService.load();
  }

  static bool get isDemo => _environment == 'demo';

  static String get environment => _environment;

  static String get baseUrl {
    if (isDemo) {
      return 'http://localhost:3000';
    }

    return 'https://your-production-api.com';
  }

  static Future<void> changeEnvironment(String env) async {
    _environment = env;
    await EnvironmentService.save(env);
  }
}
