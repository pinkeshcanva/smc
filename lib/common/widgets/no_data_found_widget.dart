import 'package:flutter/material.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/space_and_dividers.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/utils/colors.dart';
import 'package:smc/utils/images.dart';
import 'package:smc/utils/strings.dart';

Widget noDataFoundWidget = Center(
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.min,
    children: [
      Images.instance.assetImage(
        name: noDataFound,
        color: AppColors.primaryColor,
      ),
      verticalSpace(20.0),
      labels(
        text: txtDataNotFount,
        color: AppColors.primaryColor,
        size: 20.0,
      ),
    ],
  ),
);
