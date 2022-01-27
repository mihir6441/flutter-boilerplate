import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_boilerplate/app_screens/app_screens.dart';
import 'package:flutter_boilerplate/ui/auth/login.dart';
import 'package:flutter_boilerplate/ui/clips/clips_list_page.dart';
import 'package:flutter_boilerplate/ui/news/news_list.dart';
import 'package:flutter_boilerplate/ui/notification/one_signal_notification.dart';
import 'package:flutter_boilerplate/ui/posts/posts_page.dart';

class AppRouter {
  final RouteObserver<PageRoute> routeObserver;

  AppRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppScreens.login:
        return _buildRoute(
          settings,
          LoginScreen.create(),
        );

      case AppScreens.newsList:
        return _buildRoute(
          settings,
          NewsListScreen.create(),
        );

      case AppScreens.postList:
        return _buildRoute(
          settings,
          PostPageScreen.create(),
        );

      case AppScreens.clipList:
        return _buildRoute(
          settings,
          ClipsListScreen.create(),);

      case AppScreens.notificationExample:
        return _buildRoute(
          settings,
          const OneSignalExample(),
        );

      default:
        return _buildRoute(settings, Container());
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) => builder,
    );
  }
}
