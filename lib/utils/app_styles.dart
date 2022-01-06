import 'package:flutter_boilerplate/constants/app_colors.dart';
import 'package:flutter_boilerplate/constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppStyles {
  static const primary500Color = Color(0xffAA00FF);
  static const secondary50Color = Color(0xffEEF3FE);
  static const primary900Color = Color(0xff32007A);
  static const primary700Color = Color(0xff6200B7);
  static const primary200Color = Color(0xffF099FF);

  static const naturalWhiteColor = Color(0xffFFFFFF);
  static const scaffoldColor = Color(0xff000000);
  static const scaffoldBackColor = Color(0xffE5E5E5);
  static const naturalBlackColor = Color(0xff000000);

  static get blue900Color => Colors.blue.shade500;

  static const grey900Color = Color(0xff0F172A);
  static const grey800Color = Color(0xff1E293B);
  static const grey700Color = Color(0xff334155);
  static const grey600Color = Color(0xff475569);
  static const grey500Color = Color(0xff64748B);
  static const grey400Color = Color(0xff94A3B8);
  static const grey300Color = Color(0xffCBD5E1);
  static const grey200Color = Color(0xffE2E8F0);
  static const grey100Color = Color(0xffF1F5F9);
  static const likeColor = Color(0xffEF4444);

  static const danger500Color = Color(0xffEF4444);
  static const waring500Color = Color(0xffEAB308);
  static const success500Color = Color(0xff22C55E);
  static const unselectedBorderColor = Color(0xffC4C4C4);

  static const facebookColor = Color(0xff1877f2);
  static const snapchatColor = Color(0xfffffc00);
  static const youtubeColor = Color(0xffff0000);
  static const instagramColor = Color(0xffe1306c);

  static const containerCornerRadius = 8.0;

  static const double cardCornerRadios = 0.0;
  static const inputBoxesVerticalMargin = 7.0;
  static const cornerRadius = 1.0;
  static const double appbarHeight = 50.0;
  static const double buttonHeight = 45.0;
  static const double homeIconSize = 30.0;

  static const double normalIconSize = 24.0;

  static const fontFamily = 'Inter';

  static Color whiteOpacityColor = const Color(0xffffffff).withOpacity(0.2);

  static TextStyle thinLargeTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 15.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle thinMediumTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 13.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle thickLargeTextStyle = TextStyle(
    color: AppColors.black,
    fontSize: 15.sp,
    fontWeight: FontWeight.w700,
  );

  static TextStyle normalTextStyle = TextStyle(
    color: AppColors.color10,
    fontSize: 6.sp,
    fontWeight: FontWeight.w300,
  );

  static TextStyle whiteOpacityTextStyle = TextStyle(
    color: naturalWhiteColor.withOpacity(0.5),
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );

  static TextStyle whiteTextStyle = TextStyle(
    color: naturalWhiteColor.withOpacity(0.9),
    fontSize: 15,
    fontWeight: FontWeight.w500,
  );

  static TextStyle bigTextStyle = const TextStyle(
    color: naturalWhiteColor,
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static TextStyle subTitleTextStyle = const TextStyle(
    color: AppStyles.grey500Color,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle smallTextStyle = TextStyle(
    color: AppStyles.naturalWhiteColor.withOpacity(0.8),
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );

  static TextStyle appBarTitleTextStyle = const TextStyle(
    color: AppStyles.grey900Color,
    fontWeight: FontWeight.w500,
    fontSize: 14,
  );

  static TextStyle errorTextStyle = const TextStyle(
    color: Colors.red,
    fontSize: 13,
  );

  static TextStyle get arabicScriptPageTitleStyle {
    return AppConstants.isTablet
        ? _arabicScriptPageTitleTabletStyle
        : _arabicScriptPageTitlePhoneStyle;
  }

  static TextStyle get arabicScriptPageSubTitleStyle {
    return AppConstants.isTablet
        ? _arabicScriptPageSubTitleTabletStyle
        : _arabicScriptPageSubTitlePhoneStyle;
  }

  static final TextStyle _arabicScriptPageTitleTabletStyle = TextStyle(
    color: AppColors.black,
    fontSize: 45.sp,
  );

  static final TextStyle _arabicScriptPageSubTitleTabletStyle = TextStyle(
    color: AppColors.black,
    fontSize: 32.sp,
    fontWeight: FontWeight.w300,
    height: 1.51,
  );

  static const TextStyle _arabicScriptPageTitlePhoneStyle = TextStyle(
    color: AppColors.black,
    fontSize: 32,
  );

  static const TextStyle _arabicScriptPageSubTitlePhoneStyle = TextStyle(
    color: AppColors.black,
    fontSize: 15,
    fontWeight: FontWeight.w300,
    height: 1.51,
  );

  static TextStyle get arabicScriptPopupTitleTextStyle {
    return AppConstants.isTablet
        ? _arabicScriptPopupTitleTextTabletStyle
        : _arabicScriptPopupTitleTextPhoneStyle;
  }

  static TextStyle get arabicScriptPopupDescriptionTextStyle {
    return AppConstants.isTablet
        ? _arabicScriptPopupDescriptionTextTabletStyle
        : _arabicScriptPopupDescriptionTextPhoneStyle;
  }

  static final TextStyle _arabicScriptPopupTitleTextTabletStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 30.sp,
    letterSpacing: 5.sp,
  );

  static final TextStyle _arabicScriptPopupDescriptionTextTabletStyle =
      TextStyle(
        color: AppColors.white,
    fontWeight: FontWeight.w300,
    fontSize: 24.sp,
  );

  static const TextStyle _arabicScriptPopupTitleTextPhoneStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );

  static const TextStyle _arabicScriptPopupDescriptionTextPhoneStyle =
      TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.w300,
    fontSize: 14,
  );

  List<Shadow> shadow = [
    const Shadow(
      blurRadius: 0.5,
      color: AppStyles.naturalBlackColor,
      offset: Offset(0.5, 0.5),
    ),
  ];

  static buildButtonTheme(ButtonThemeData buttonTheme) {
    return buttonTheme.copyWith(
      buttonColor: primary500Color,
      highlightColor: primary700Color,
      disabledColor: Colors.grey,
      textTheme: ButtonTextTheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppStyles.containerCornerRadius),
      ),
      height: buttonHeight,
    );
  }
}
