import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';
import 'package:platform_device_id/platform_device_id.dart';

import 'app_language.dart';

class AppUtils {
  AppUtils._();

  /// used for getting device type
  /// used for getting device type
  /// used for getting device type
  static String getDeviceType() {
    if (Platform.isAndroid) {
      return 'android';
    } else if (Platform.isIOS) {
      return 'ios';
    } else {
      return '';
    }
  }

  static Future<String?> getDeviceId() async {
    return PlatformDeviceId.getDeviceId;
  }

  static List<AppLanguage> getLanguages() {
    return [
      AppLanguage(name: 'English', code: 'en'),
      AppLanguage(name: 'عربي', code: 'ar'),
    ];
  }

  static void showSnackBar(BuildContext context, String? text) {
    if (text != null && text.isNotEmpty) {
      final snackBar = SnackBar(content: Text(text));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  static Widget progressHudWidget(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: AppStyles.primary200Color),
    );
  }

}
