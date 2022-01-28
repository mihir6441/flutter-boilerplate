import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_config.dart';
import 'package:flutter_boilerplate/main.dart';
import 'package:flutter_boilerplate/utils/app_dependencies.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  WidgetsFlutterBinding.ensureInitialized();

  setupDependencies();
  var configuredApp = AppConfig(
      appName: 'Flutter BoilerPlate',
      flavorName: 'prod',
      apiUrl: 'https://api.example.com/graphql',
      openApiUrl: 'https://api.example.com/graphql/open',
      appId: 'app-123',
      child: const MyApp());

  runZonedGuarded<Future<void>>(() async {
    runApp(configuredApp);
  }, (error, stackTrace) async {
    // TODO: If you are using any Error Reporting Tool in project (for e.g. Sentry) then you can Capture the Error Event here.
  });
}
