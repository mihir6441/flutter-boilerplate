import 'package:flutter_boilerplate/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'app_styles.dart';

class ThemeUtils {
  ThemeUtils._();

  static ThemeData buildAppTheme(BuildContext context) {
    ThemeData theme = ThemeData(
      fontFamily: 'Karla',
    );

    theme = theme.copyWith(
      appBarTheme: _appBarTheme(theme),
      elevatedButtonTheme: _elevatedButtonTheme(theme),
      outlinedButtonTheme: _outlinedButtonTheme(theme),
      textButtonTheme: _textButtonTheme(theme),
      inputDecorationTheme: _inputDecorationTheme(theme),
      tabBarTheme: _tabBarTheme(theme),
      scaffoldBackgroundColor: AppStyles.black,
    );

    return theme;
  }

  static AppBarTheme _appBarTheme(ThemeData theme) {
    return theme.appBarTheme.copyWith(
      elevation: 4.0,
      backgroundColor: AppStyles.black,
      foregroundColor: AppStyles.white,
      titleSpacing: 0,
      centerTitle: true,
      shadowColor: Colors.black26,
      textTheme: theme.textTheme.copyWith(
        headline6: theme.textTheme.headline6!.copyWith(
          color: AppStyles.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
      iconTheme: const IconThemeData(color: AppStyles.white),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ThemeData theme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          onPrimary: AppStyles.black,
          primary: AppStyles.primary200Color,
          textStyle: const TextStyle(
              fontSize: AppConstants.defaultButtonTextSizePhone,
              fontWeight: FontWeight.bold,
              fontFamily: AppConstants.defaultFontFamily),
          minimumSize: Size(64.0, AppConstants.defaultButtonTextSize),
          shape: const StadiumBorder(),
          padding: EdgeInsets.symmetric(horizontal: 48.sp)),
    );
  }

  static OutlinedButtonThemeData _outlinedButtonTheme(ThemeData theme) {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        primary: AppStyles.primary900Color,
        textStyle: const TextStyle(
            fontSize: AppConstants.defaultButtonTextSizePhone,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.defaultFontFamily),
        minimumSize: const Size(64.0, AppConstants.defaultButtonTextSizePhone),
        shape: const StadiumBorder(),
      ),
    );
  }

  static TextButtonThemeData _textButtonTheme(ThemeData theme) {
    return TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: AppStyles.primary200Color,
        textStyle: const TextStyle(
            fontSize: AppConstants.defaultButtonTextSizePhone,
            fontWeight: FontWeight.bold,
            fontFamily: AppConstants.defaultFontFamily),
        minimumSize: const Size(64.0, AppConstants.defaultButtonTextSizePhone),
        shape: const StadiumBorder(),
      ),
    );
  }

  static InputDecorationTheme _inputDecorationTheme(ThemeData theme) {
    return InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(
        vertical: AppConstants.defaultButtonPadding,
        horizontal: AppConstants.defaultButtonPadding,
      ),
      fillColor: AppStyles.primary200Color,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
      labelStyle: TextStyle(
        color: AppStyles.black,
        fontSize: 8.sp,
        fontWeight: FontWeight.normal,
      ),
      hintStyle: TextStyle(
        color: AppStyles.black,
        fontSize: 8.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  static TabBarTheme _tabBarTheme(ThemeData theme) {
    return TabBarTheme(
      indicatorSize: TabBarIndicatorSize.label,
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(
          width: 2,
          color: AppStyles.black,
        ),
      ),
      labelColor: AppStyles.black,
      unselectedLabelColor: AppStyles.black,
      labelStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      unselectedLabelStyle: TextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
