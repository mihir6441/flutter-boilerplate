import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/app_config.dart';
import 'package:flutter_boilerplate/main.dart';

void main() async {
  var configuredApp = AppConfig(
      appName: 'Flutter BoilerPlate - Dev',
      flavorName: 'dev',
      apiUrl: 'https://api.example.dev/graphql',
      openApiUrl: 'https://api.example.dev/graphql/open',
      appId: 'app-123',
      child: const MyApp());

  runApp(configuredApp);
}
