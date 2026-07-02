import 'package:go_router/go_router.dart';
import 'package:logistic_operation/features/auth/presentaion/pages/login_page.dart';
import 'package:logistic_operation/features/dashboard/presentation/pages/dashboard.dart';
import 'package:logistic_operation/features/splash/presentation/pages/splash_page.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(path: '/splash', builder: (_, __) => const SplashPage()),
      GoRoute(path: '/login', builder: (_, __) => const LoginPage()),
      GoRoute(path: '/dashboard', builder: (_, __) => const DashboardPage()),
    ],
  );
}
