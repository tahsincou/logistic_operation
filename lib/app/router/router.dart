import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logistic_operation/features/auth/presentaion/pages/login_page.dart';
import 'package:logistic_operation/features/dashboard/presentation/pages/dashboard.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(path: '/login', builder: (context, state) => const LoginPage()),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardPage(),
      ),
    ],
  );
}
