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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    homepageBloc.getCategoryList();
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> popUpMenuItems = [
      {
        'label': txtDonationExchange,
        'onTap': () {},
      },
      {
        'label': txtBloodBank,
        'onTap': () {},
      },
      {
        'label': txtLiveHelp,
        'onTap': () {},
      },
      {
        'label': txtPoliceStations,
        'onTap': () {},
      },
      {
        'label': txtShelter,
        'onTap': () {},
      },
      {
        'label': txtLogout,
        'onTap': () {
          WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      "Logout",
                      style: TextStyle(
                          color: AppColors.iconTextColor, fontSize: 28),
                    ),
                    content: const Text('Are You Sure Want To Logout ?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: AppColors.iconTextColor,
                          ),
                        ),
                      ),
                      MaterialButton(
                        color: AppColors.iconTextColor,
                        onPressed: () {
                          AuthServices.signOut(context: context);
                        },
                        child: const Text(
                          'Confirm',
                          style: TextStyle(color: AppColors.darkTextColor),
                        ),
                      )
                    ],
                  );
                },
              );
            },
          );
        },
      },
    ];

    List<Map<String, dynamic>> secondList = [
      {
        'label': txtAnimalNgos,
        'onTap': () {},
      },
      {
        'label': txtHospitals,
        'onTap': () {},
      },
      {
        'label': txtNgoNearYou,
        'onTap': () {},
      },
      {
        'label': txtDriverInCity,
        'onTap': () {},
      },
      {
        'label': txtHealthyMeanNgos,
        'onTap': () {},
      },
    ];

    List<Map<String, dynamic>> learningAndDevelopment = [
      {
        'label': txtFreeTeachers,
        'onTap': () {},
      },
      {
        'label': txtFreeDoctors,
        'onTap': () {},
      },
      {
        'label': txtFreeCourses,
        'onTap': () {},
      },
      {
        'label': txtKnowledgeAndEducation,
        'onTap': () {},
      },
    ];

    return Scaffold(
      appBar: appbar(
        context,
        title: txtSMC,
        actionIcons: PopupMenuButton(
          icon: const Icon(
            Icons.more_vert,
            color: AppColors.darkTextColor,
          ),
          itemBuilder: (context) {
            return popUpMenuItems
                .map((e) => PopupMenuItem(
                      child: labels(text: txtAnimalNgos),
                    ))
                .toList();
          },
        ),
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              verticalSpace(20.0),
              Row(
                children: [
                  horizontalSpace(10.0),
                  labels(
                    text: txtPrimary,
                    color: AppColors.darkTextColor,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: popUpMenuItems
                      .map(
                        (e) => Container(
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
                      )
                      .toList(),
                ),
              ),
              verticalSpace(5.0),
              divider(
                color: AppColors.darkTextColor,
                height: 5,
                thickness: 3,
              ),
              verticalSpace(20.0),
              Row(
                children: [
                  horizontalSpace(10.0),
                  labels(
                    text: txtSecondary,
                    color: AppColors.darkTextColor,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: secondList
                      .map(
                        (e) => Container(
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
                            ],
                          ),
                          child: labels(
                            text: e['label'].toString(),
                            maxLine: 3,
                            size: 17,
                            color: AppColors.darkTextColor,
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              verticalSpace(5.0),
              divider(
                color: AppColors.darkTextColor,
                height: 5,
                thickness: 3,
              ),
              verticalSpace(20.0),
              Row(
                children: [
                  horizontalSpace(10.0),
                  labels(
                    text: txtLearningAndDevelopment,
                    color: AppColors.darkTextColor,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: learningAndDevelopment.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(10.0),
                    padding: const EdgeInsets.all(5.0),
                    decoration: circularBoxDecoration(
                        circularRadius: 20.0,
                        containerColor: AppColors.primaryColor,
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 5.0,
                            color: AppColors.loginColor,
                            offset: Offset(0, 5),
                          ),
                        ]),
                    child: labels(
                      text: learningAndDevelopment[index]['label'],
                      color: AppColors.darkTextColor,
                      maxLine: 3,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
