import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_boilerplate/ui/splash/splash_screen.dart';
import 'package:flutter_boilerplate/utils/app_dependencies.dart';
import 'package:flutter_boilerplate/utils/app_router.dart';
import 'package:flutter_boilerplate/utils/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sizer/sizer.dart';

import 'localization/app_localization_manager.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyApp> {
  final AppRouter _router = AppRouter();


  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    setupDependencies();

    return Sizer(
      builder: (context, orientation, deviceType) {
        // Set system UI to Dark with Light icons
        SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ));
        return StreamBuilder<Locale>(
            stream: AppLocalizationManager().getAppLocale(),
            builder: (context, snapshot) {
              final locale = snapshot.data;
              return MaterialApp(
                title: 'DEMO',
                debugShowCheckedModeBanner: false,
                theme: ThemeUtils.buildAppTheme(context),
                localizationsDelegates: const [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                ],
                locale: locale,
                supportedLocales: const [
                  Locale('en', ''), // English
                ],
                home: const SplashScreen(),
                onGenerateRoute: _router.getRoute,
                navigatorObservers: [_router.routeObserver],
              );
            });
      },
    );
  }
}
