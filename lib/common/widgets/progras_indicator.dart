import 'package:flutter/material.dart';
import 'package:smc/utils/colors.dart';
import 'package:smc/utils/screen_utils.dart';

const Widget circularIndicator = Center(
  child: CircularProgressIndicator(
    color: AppColors.primaryColor,
  ),
);
Widget fullScreenCircularIndicator = Container(
  height: Screen.screenHeight,
  width: Screen.screenWidth,
  color: AppColors.black12,
  child: const Center(
    child: CircularProgressIndicator(color: AppColors.white),
  ),
);
