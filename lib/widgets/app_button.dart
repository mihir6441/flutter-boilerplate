import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';

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
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: onClicked,
        style: ButtonStyle(

          foregroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppStyles.blue900Color;
              }
              return textColor ?? AppStyles.black;
            },
          ),
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
              if (states.contains(MaterialState.disabled)) {
                return AppStyles.blue900Color;
              }
              return background;
            },
          ),
          elevation: MaterialStateProperty.resolveWith<double?>(
                (Set<MaterialState> states) {
              return elevation ?? 4;
            },
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
                side: BorderSide(color: Colors.black)),
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
      ),
    );
  }
}
