import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../res/app_color.dart';

class FULoadingIndicator extends StatelessWidget {
  final List<Color>? colors;
  final Color? backgroundColor;
  final Color? pathBackgroundColor;
  final double? height;
  final double? width;
  final double strokeWidth;
  final Indicator? indicatorType;
  const FULoadingIndicator({Key? key, this.colors,
    this.backgroundColor, this.height, this.width, this.strokeWidth = 2,
    this.pathBackgroundColor, this.indicatorType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: LoadingIndicator(
          indicatorType: indicatorType ?? Indicator.ballRotateChase,
          colors: colors ?? [
            AppColor.primaryColor
          ],
          strokeWidth: strokeWidth,
          backgroundColor: backgroundColor,
          pathBackgroundColor: pathBackgroundColor
      ),
    );
  }
}
