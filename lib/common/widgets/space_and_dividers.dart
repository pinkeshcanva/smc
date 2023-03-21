import 'package:flutter/material.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/utils/colors.dart';

Widget horizontalSpace(double width) => SizedBox(width: width);

Widget verticalSpace(double height) => SizedBox(height: height);

RoundedRectangleBorder roundedRectangleBorder({
  required double radius,
  BorderSide? side,
}) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(radius),
      side: side ?? const BorderSide(),
    );

Widget divider({
  required Color color,
  required double height,
  required double thickness,
}) =>
    Divider(
      color: color,
      height: height,
      thickness: thickness,
    );

Widget verticalDivider({
  required Color color,
  required double width,
  required double thickness,
}) =>
    VerticalDivider(
      color: color,
      width: width,
      thickness: thickness,
    );

Decoration circularBoxDecoration({
  Color containerColor = AppColors.white,
  double? circularRadius,
  double? topLeftRadius,
  double? topRightRadius,
  double? bottomLeftRadius,
  double? bottomRightRadius,
  BoxBorder? border,
  Gradient? gradient,
  DecorationImage? decorationImage,
  List<BoxShadow>? boxShadow,
  BoxShape? boxShape,
}) =>
    BoxDecoration(
      color: containerColor,
      gradient: gradient,
      image: decorationImage,
      boxShadow: boxShadow,
      shape: boxShape ?? BoxShape.rectangle,
      borderRadius: boxShape == null
          ? BorderRadius.only(
              topLeft: Radius.circular(topLeftRadius ?? circularRadius ?? 0),
              topRight: Radius.circular(topRightRadius ?? circularRadius ?? 0),
              bottomLeft:
                  Radius.circular(bottomLeftRadius ?? circularRadius ?? 0),
              bottomRight:
                  Radius.circular(bottomRightRadius ?? circularRadius ?? 0),
            )
          : null,
      border: border,
    );

Widget gradientDivider({
  double? height,
  double? width,
  required AlignmentGeometry begin,
  required AlignmentGeometry end,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: const [Color(0xffB7BDC4), Color(0xffEEF3F9)],
        begin: begin,
        end: end,
      ),
    ),
  );
}

Widget gradientBoxWithIcon({
  required double height,
  required double width,
  AlignmentGeometry? begin,
  AlignmentGeometry? end,
  Color? startColor,
  Color? endColor,
  required double radius,
  required String iconName,
}) {
  return Container(
    height: height,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: LinearGradient(
        colors: [startColor!, endColor!],
        begin: begin!,
        end: end!,
      ),
    ),
    child: Images.instance.assetImage(name: iconName),
  );
}
