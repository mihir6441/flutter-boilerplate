import 'package:flutter_boilerplate/api_client/dio_client.dart';
import 'package:flutter_boilerplate/api_client/http_client.dart';
import 'package:flutter_boilerplate/preferences/preferences_manager.dart';
import 'package:flutter_boilerplate/repository/login_repository.dart';
import 'package:flutter_boilerplate/repository/login_repository_impl.dart';
import 'package:dio/dio.dart';
import 'package:flutter_boilerplate/repository/news_repository.dart';
import 'package:flutter_boilerplate/repository/news_repository_impl.dart';
import 'package:flutter_boilerplate/repository/post_repository.dart';
import 'package:flutter_boilerplate/repository/post_repository_impl.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';

final GetIt _getIt = GetIt.instance;

void setupDependencies() {
  // Logger
  _getIt.registerSingleton<Logger>(Logger());

  // Preference Manager
  _getIt.registerSingleton<PreferencesManager>(PreferencesManager());

  // DIO HTTP Client
  _getIt.registerSingleton<Dio>(DioClient().getDio());

  // HTTP Client
  _getIt.registerSingleton<HttpClients>(HttpClients());

  // Login
  _getIt.registerSingleton<LoginRepository>(LoginRepositoryImpl());

  // News
  _getIt.registerSingleton<NewsRepository>(NewsRepositoryImpl());

  // Posts
  _getIt.registerSingleton<PostRepository>(PostRepositoryImpl());
}
