
import 'dart:async';

import 'package:flutter_boilerplate/app_screens/app_screens.dart';
import 'package:flutter_boilerplate/constants/asset_path.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () => _navigateToHome(context));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Center(
          child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: SvgPicture.asset(ImageAssetPath.icGoogleLogo),
          ),
        ),
      ),
    );
  }
  void _navigateToHome(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppScreens.login,
          (Route<dynamic> route) => false,
    );
  }

}
