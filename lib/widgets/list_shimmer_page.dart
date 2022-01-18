import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/utils/app_styles.dart';
import 'package:shimmer/shimmer.dart';

class ListShimmerPage extends StatelessWidget {
  final double? containerHeight;

  const ListShimmerPage({
    Key? key,
    this.containerHeight = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppStyles.whiteOpacityColor,
      highlightColor: AppStyles.naturalBlackColor,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getProjectShimmer(),
            Container(
              height: 3,
            ),
            _getProjectShimmer(),
            Container(
              height: 3,
            ),
            _getProjectShimmer(),
            Container(
              height: 3,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getProjectShimmer() {
    return Container(
      height: containerHeight,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5)),
        color: AppStyles.grey300Color,
      ),
    );
  }
}
