import 'package:flutter/material.dart';
import 'package:smc/common/widgets/buttons.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/utils/colors.dart';

PreferredSizeWidget appbar(
  BuildContext context, {
  String title = '',
  IconData? leadingIcon,
  Widget? actionIcons,
  Color bgColor = AppColors.primaryColor,
}) {
  return AppBar(
    title: labels(
      text: title.toUpperCase(),
      color: AppColors.darkTextColor,
      fontWeight: FontWeight.bold,
      size: 25.0,
    ),
    leading: leadingIcon == null
        ? Container()
        : iconButton(
            icon: leadingIcon,iconColor: AppColors.darkTextColor,
            onTap: () => Navigator.pop(context),
          ),
    actions: [actionIcons ?? Container()],
    backgroundColor: bgColor,
    centerTitle: true,
  );
}
