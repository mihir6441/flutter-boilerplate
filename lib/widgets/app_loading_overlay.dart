import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';
import 'package:loader_overlay/loader_overlay.dart';

class AppLoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget? child;
  final Color? backgroundColor;

  const AppLoadingOverlay({
    Key? key,
    required this.isLoading,
    this.child,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: isLoading,
      child: child ?? Container(),
      overlayColor: backgroundColor ?? AppStyles.black,
    );
  }
}
