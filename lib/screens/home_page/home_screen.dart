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
    List<Map<String, dynamic>> events = [
      {
        'label': 'Tree Plantation',
        'onTap': () {
          Navigator.pushNamed(context, treePlantationScreen);
        },
      },
      {
        'label': 'Clean-Up Drive',
        'onTap': () {
          Navigator.pushNamed(context, cleanUpDriveScreen);
        },
      },
      {
        'label': 'Awareness Event',
        'onTap': () {
          Navigator.pushNamed(context, awarenessEventScreen);
        },
      },
      {
        'label': 'Each One Teach One',
        'onTap': () {
          Navigator.pushNamed(context, eachOneTeachOneScreen);
        },
      },
      // {
      //   'label': txtShelter,
      //   'onTap': () {},
      // },
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

    List<Map<String, dynamic>> banksNearMe = [
      {
        'label': txtBloodBank,
        'onTap': () {
          // Navigator.pushNamed(context, googleMapScreen);
        },
      },
      {
        'label': 'Food Bank',
        'onTap': () {
          Navigator.pushNamed(context, googleMapScreen);
        },
      },
      {
        'label': 'Shelter Bank',
        'onTap': () {},
      },
      {
        'label': 'Donation Bank',
        'onTap': () {},
      },
    ];

    List<Map<String, dynamic>> sharingAndCaring = [
      {
        'label': 'Teacher & Teaching',
        'onTap': () {
          Navigator.pushNamed(context, teacherTeachingScreen);
        },
      },
      {
        'label': 'Medical Assistance',
        'onTap': () {},
      },
      {
        'label': 'Courses',
        'onTap': () {},
      },
      {
        'label': 'Youth Volunteering',
        'onTap': () {},
      },
      {
        'label': "Farmer's Market",
        'onTap': () {},
      },
    ];
    List<Map<String, dynamic>> emergency = [
      {
        'label': 'Animal NGOs',
        'onTap': () {},
      },
      {
        'label': 'NGOs for Humans',
        'onTap': () {},
      },
      {
        'label': 'Hospital Near Me',
        'onTap': () {},
      },
      // {
      //   'label': 'Live Help',
      //   'onTap': () {},
      // },
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
            return events
                .map((e) => PopupMenuItem(
                      onTap: e['onTap'],
                      child: labels(text: e['label'].toString()),
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
                    text: 'Events',
                    color: AppColors.darkTextColor,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 100,

                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: events.length - 1,
                  itemBuilder: (context, index) => InkWell(
                    onTap: events[index]['onTap'],
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
                        text: events[index]['label'].toString(),
                        maxLine: 3,
                        size: 17,
                        color: AppColors.darkTextColor,
                      ),
                    ),
                  ),
                ),

                // child: ListView(
                //   scrollDirection: Axis.horizontal,
                //   children: events
                //       .map(
                // (e) => InkWell(
                //   onTap: e['onTap'],
                //   child: Container(
                //     height: 70,
                //     width: 100,
                //     margin: const EdgeInsets.all(10.0),
                //     padding: const EdgeInsets.all(10.0),
                //     alignment: Alignment.center,
                //     decoration: BoxDecoration(
                //         color: AppColors.primaryColor,
                //         borderRadius: BorderRadius.circular(15.0),
                //         boxShadow: const [
                //           BoxShadow(
                //             blurRadius: 5.0,
                //             color: AppColors.loginColor,
                //             offset: Offset(0, 5),
                //           ),
                //         ]),
                //     child: labels(
                //       text: e['label'].toString(),
                //       maxLine: 3,
                //       size: 17,
                //       color: AppColors.darkTextColor,
                //     ),
                //   ),
                // ),
                //       )
                //       .toList(),
                // ),
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
                    text: 'Bank\'s Near Me',
                    color: AppColors.darkTextColor,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: banksNearMe.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: banksNearMe[index]['onTap'],
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
                        text: banksNearMe[index]['label'].toString(),
                        maxLine: 3,
                        size: 17,
                        color: AppColors.darkTextColor,
                      ),
                    ),
                  ),
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
                    text: 'Sharing & Caring',
                    color: AppColors.darkTextColor,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: sharingAndCaring.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: sharingAndCaring[index]['onTap'],
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
                        text: sharingAndCaring[index]['label'].toString(),
                        maxLine: 3,
                        size: 17,
                        color: AppColors.darkTextColor,
                      ),
                    ),
                  ),
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
                    text: 'Emergency',
                    color: AppColors.darkTextColor,
                    size: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ],
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: emergency.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: emergency[index]['onTap'],
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
                        text: emergency[index]['label'].toString(),
                        maxLine: 3,
                        size: 17,
                        color: AppColors.darkTextColor,
                      ),
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
