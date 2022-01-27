/// define all constant value in this file that going to use in app
import 'package:sizer/sizer.dart';

class AppConstants {
  AppConstants._();

  static final bool isTablet = SizerUtil.deviceType == DeviceType.tablet;

  static final double defaultButtonTextSize = 6.5.sp;
  static final double defaultButtonPadding = 6.5.sp;
  static const double defaultButtonTextSizePhone = 17;

  static const String defaultFontFamily = 'Karla';
  static const String defaultCountryCode = '+966';

  static const String defaultLanguage = 'en';
  static const int postLimit = 10;
  static const int itemsPerPage = 10;


}
