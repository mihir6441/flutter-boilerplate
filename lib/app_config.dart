import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String appName;

  // ['prod','dev','local']
  final String flavorName;

  // Api Url
  final String apiUrl;

  // If you want to use open API along with another API you can use below module.
  final String openApiUrl;

  // This can be used as a notification helpers of firebase helper. You can also define both as per your usages.
  final String appId;

  AppConfig({
    required this.appName,
    required this.flavorName,
    required this.apiUrl,
    required this.openApiUrl,
    required this.appId,
    required Widget child}):super(child: child);

  static AppConfig? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<AppConfig>();
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
