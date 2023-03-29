import 'package:flutter/material.dart';
import 'package:smc/common/widgets/appbar_widget.dart';
import 'package:smc/common/widgets/buttons.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/padding_margin.dart';
import 'package:smc/common/widgets/space_and_dividers.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/utils/colors.dart';

import '../../common/widgets/field_and_label.dart';

class AwarenessEventScreen extends StatefulWidget {
  const AwarenessEventScreen({Key? key}) : super(key: key);

  @override
  State<AwarenessEventScreen> createState() => _AwarenessEventScreenState();
}

class _AwarenessEventScreenState extends State<AwarenessEventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
        leadingIcon: Icons.arrow_back_outlined,
        title: 'Awareness Event',
      ),
      body: Scaffold(
        body: Center(
          child: labels(
            text: 'No Data Found',
            size: 20.0,
            color: AppColors.darkTextColor,
          ),
        ),
      ),
    );
  }
}
