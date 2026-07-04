import 'app_environment.dart';

class AppConfig {
  static const String _env = String.fromEnvironment(
    'ENV',
    defaultValue: 'demo',
  );

  static AppEnvironment get environment {
    switch (_env.toLowerCase()) {
      case 'live':
        return AppEnvironment.live;
      case 'demo':
      default:
        return AppEnvironment.demo;
    }
  }

  static bool get isDemo => environment == AppEnvironment.demo;

  static String get baseUrl {
    switch (environment) {
      case AppEnvironment.demo:
        return 'http://localhost:3000';

      case AppEnvironment.live:
        return 'https://your-production-api.com';
    }
  }
}
