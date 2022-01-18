import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';


class NoDataWidget extends StatelessWidget {
  final String message;

  const NoDataWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 14, right: 14),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              child: const Icon(Icons.error_outline),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              message,
              style: AppStyles.bigTextStyle.copyWith(
                color: AppStyles.naturalWhiteColor.withOpacity(0.8),
              ),
            )
          ],
        ),
      ),
    );
  }
}
