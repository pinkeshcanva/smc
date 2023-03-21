import 'package:flutter/material.dart';
import 'package:smc/common/widgets/padding_margin.dart';
import 'package:smc/common/widgets/space_and_dividers.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/utils/colors.dart';
import 'package:smc/utils/screen_utils.dart';

import 'icon_and_images.dart';

Widget listItem({String label = '', Function()? onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: Screen.screenHeight * 0.07,
      margin: paddingAll(10.0),
      decoration: circularBoxDecoration(
        gradient: const LinearGradient(colors: AppColors.gradientColor),
        circularRadius: 10.0,
        border: Border.all(
          color: AppColors.iconTextColor,
          width: 3,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: labels(
              text: label.toUpperCase(),
              color: AppColors.darkTextColor,
            ),
          ),
          icons(icon: Icons.keyboard_arrow_right),
          horizontalSpace(20.0),
        ],
      ),
    ),
  );
}
