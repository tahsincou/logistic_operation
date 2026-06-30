import 'package:flutter/material.dart';
import 'package:logistic_operation/app/router/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Logistic Operation',
      routerConfig: AppRouter.router,
    );
  }
}
