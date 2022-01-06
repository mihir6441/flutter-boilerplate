import 'package:flutter_boilerplate/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.background,
    required this.text,
    this.endIcon,
    this.onClicked,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    this.elevation,
    this.centerText = false,
  }) : super(key: key);

  final Color background;
  final String text;
  final Widget? endIcon;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final VoidCallback? onClicked;
  final double? elevation;
  final bool centerText;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onClicked,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.color8;
            }
            return textColor ?? AppColors.black;
          },
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return AppColors.color7;
            }
            return background;
          },
        ),
        elevation: MaterialStateProperty.resolveWith<double?>(
          (Set<MaterialState> states) {
            return elevation ?? 4;
          },
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: endIcon != null
            ? MainAxisAlignment.spaceBetween
            : MainAxisAlignment.center,
        children: [
          if (centerText && endIcon != null) ...[
            const Spacer(),
            Opacity(
              opacity: 0.0,
              child: endIcon!,
            ),
          ],
          Text(
            text,
            style: TextStyle(
                fontWeight: fontWeight ?? FontWeight.bold, fontSize: fontSize),
          ),
          if (endIcon != null) ...[
            const Spacer(),
            endIcon!,
          ],
        ],
      ),
    );
  }
}
