import 'package:flutter/material.dart';
import 'package:smc/utils/colors.dart';

Widget labels({
  required String text,
  Color color = AppColors.iconTextColor,
  double size = 14.0,
  TextAlign textAlign = TextAlign.center,
  FontWeight fontWeight = FontWeight.normal,
  TextOverflow overflow = TextOverflow.ellipsis,
  int maxLine = 1,
  TextDecoration decoration = TextDecoration.none,
}) =>
    Text(
      text,
      overflow: overflow,
      maxLines: maxLine,
      style: defaultTextStyle(
        color: color,
        size: size,
        fontWeight: fontWeight,
        decoration: decoration,
      ),
      textAlign: textAlign,
    );

TextStyle defaultTextStyle({
  Color color = AppColors.black,
  double size = 14.0,
  FontWeight fontWeight = FontWeight.normal,
  TextDecoration decoration = TextDecoration.none,
}) =>
    TextStyle(
      color: color,
      fontSize: size,
      fontWeight: fontWeight,
      decoration: decoration,
    );
