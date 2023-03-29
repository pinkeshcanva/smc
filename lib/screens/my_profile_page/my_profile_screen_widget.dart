import 'package:flutter/material.dart';
import 'package:smc/common/widgets/buttons.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/utils/colors.dart';
import 'package:smc/utils/images.dart';
import 'package:smc/utils/screen_utils.dart';
import 'package:smc/utils/strings.dart';

Widget logoWidget = Center(
  child: Images.instance.assetImage(
    name: appLogo,
    height: Screen.screenHeight * 0.25,
    color: AppColors.loginColor,
  ),
);

Widget myProfileWidget = Row(children: [myProfile]);
Widget myProfile = labels(
  text: txtMyProfile,
  color: AppColors.darkTextColor,
  fontWeight: FontWeight.w600,
  textAlign: TextAlign.start,
  maxLine: 2,
  size: 26.0,
);
