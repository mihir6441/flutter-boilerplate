import 'package:flutter_boilerplate/constants/app_constants.dart';
import 'package:flutter_boilerplate/preferences/preferences_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

class AppLocalizationManager extends ChangeNotifier {
  final _preferenceManager = GetIt.I<PreferencesManager>();

  final _languageSubject = BehaviorSubject<bool>.seeded(true);

  static final AppLocalizationManager _instance =
      AppLocalizationManager._internal();

  AppLocalizationManager._internal();

  factory AppLocalizationManager() {
    return _instance;
  }

  static Locale _appLocale = const Locale(AppConstants.defaultLanguage);

  static bool get isCurrentEnglish => _appLocale.languageCode == 'en';

  /// Get the current locale of the application.
  /// Will notify whenever language is changed.
  Stream<Locale> getAppLocale() {
    Stream<Locale> locale = _languageSubject
        .flatMap((_) =>
            _preferenceManager.getString(PreferencesManager.keyLanguageCode))
        .map((locale) => Locale(locale ?? AppConstants.defaultLanguage));

    locale.listen((event) {
      _appLocale = event;
    });
    return locale;
  }

  /// Set the current locale of the application
  Stream<bool> setAppLocale(String languageCode) {
    _appLocale = Locale(languageCode);
    return _preferenceManager
        .setString(PreferencesManager.keyLanguageCode, languageCode)
        .doOnData((_) => _languageSubject.add(true));
  }
}
