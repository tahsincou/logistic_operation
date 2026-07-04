import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logistic_operation/core/config/app_config.dart';

import 'app/app.dart';

Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppConfig.initialize();

  runApp(const ProviderScope(child: App()));
}
