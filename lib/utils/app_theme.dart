import 'package:flutter_boilerplate/constants/app_colors.dart';
import 'package:flutter_boilerplate/constants/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

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
      scaffoldBackgroundColor: AppColors.black,
    );

    return theme;
  }

  static AppBarTheme _appBarTheme(ThemeData theme) {
    return theme.appBarTheme.copyWith(
      elevation: 4.0,
      backgroundColor: AppColors.black,
      foregroundColor: AppColors.white,
      titleSpacing: 0,
      centerTitle: true,
      shadowColor: Colors.black26,
      textTheme: theme.textTheme.copyWith(
        headline6: theme.textTheme.headline6!.copyWith(
          color: AppColors.black,
          fontWeight: FontWeight.bold,
          fontSize: 18.sp,
        ),
      ),
      iconTheme: const IconThemeData(color: AppColors.white),
    );
  }

  static ElevatedButtonThemeData _elevatedButtonTheme(ThemeData theme) {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          onPrimary: AppColors.black,
          primary: AppColors.color1,
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
        primary: AppColors.primary,
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
        primary: AppColors.color3,
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
      fillColor: AppColors.color5,
      filled: true,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(64.0),
      ),
      labelStyle: TextStyle(
        color: AppColors.color4,
        fontSize: 8.sp,
        fontWeight: FontWeight.normal,
      ),
      hintStyle: TextStyle(
        color: AppColors.color4,
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
          color: AppColors.color1,
        ),
      ),
      labelColor: AppColors.black,
      unselectedLabelColor: AppColors.black,
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
