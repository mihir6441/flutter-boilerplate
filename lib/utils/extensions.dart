import 'package:sizer/sizer.dart';

extension SizerExt on num {
  static const double _scaleFactor = 0.23;

  /// Calculates the sp (Scalable Pixel) depending on the device's screen size
  double get spt => (this * _scaleFactor).sp;
}
