import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smc/common/widgets/appbar_widget.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/list_container.dart';
import 'package:smc/common/widgets/no_data_found_widget.dart';
import 'package:smc/common/widgets/progras_indicator.dart';
import 'package:smc/common/widgets/space_and_dividers.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/screens/home_page/home_screen_bloc.dart';
import 'package:smc/screens/home_page/home_screen_widget.dart';
import 'package:smc/utils/colors.dart';
import 'package:smc/utils/navigator_route.dart';
import 'package:smc/utils/strings.dart';

import '../../services/auth_services_data.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> helpsList = [
      {
        'label': txtSomeoneNeedFood,
        'onTap': () {},
      },
      {
        'label': txtAccident,
        'onTap': () {
          Navigator.pushNamed(context, googleMapScreen);
        },
      },
      {
        'label': txtHospitalEmergency,
        'onTap': () {},
      },
      {
        'label': txtWomanHelp,
        'onTap': () {},
      },
      {
        'label': txtTerror,
        'onTap': () {},
      },
      {
        'label': txtPoliceHelp,
        'onTap': () {},
      },
      {
        'label': txtCleanAreaHelp,
        'onTap': () {},
      },
      {
        'label': txtAnimalHelp,
        'onTap': () {},
      },
    ];

    return Scaffold(
      appBar: appbar(
        context,
        title: txtLiveHelp,
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: helpsList
                .map(
                  (e) => InkWell(
                    onTap: e['onTap'],
                    child: Container(
                      height: 70,
                      width: 100,
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(15.0),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 5.0,
                              color: AppColors.loginColor,
                              offset: Offset(0, 5),
                            ),
                          ]),
                      child: labels(
                        text: e['label'].toString(),
                        maxLine: 3,
                        size: 17,
                        color: AppColors.darkTextColor,
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
