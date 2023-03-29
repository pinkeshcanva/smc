import 'package:flutter/material.dart';
import 'package:smc/common/widgets/appbar_widget.dart';
import 'package:smc/common/widgets/buttons.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/padding_margin.dart';
import 'package:smc/common/widgets/space_and_dividers.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/utils/colors.dart';

import '../../common/widgets/field_and_label.dart';

class TeacherTeachingScreen extends StatefulWidget {
  const TeacherTeachingScreen({Key? key}) : super(key: key);

  @override
  State<TeacherTeachingScreen> createState() => _TeacherTeachingScreenState();
}

class _TeacherTeachingScreenState extends State<TeacherTeachingScreen> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> teacherList = [
      {
        'label': 'Teacher 1 : Coding',
        'onTap': () {},
      },
      {
        'label': 'Teacher 2 : Marketing',
        'onTap': () {},
      },
      {
        'label': 'Teacher 3 : Life Science',
        'onTap': () {},
      },
    ];

    List<Map<String, dynamic>> teachingList = [
      {
        'label': '30 Days of Sustainability',
        'onTap': () {},
      },
      {
        'label': '30 Days of Robotics',
        'onTap': () {},
      },
      {
        'label': '30 Days of Coding',
        'onTap': () {},
      },
      {
        'label': '30 Days of Recycling',
        'onTap': () {},
      },
    ];

    return Scaffold(
      appBar: appbar(
        context,
        leadingIcon: Icons.arrow_back_outlined,
        title: 'Teacher / Teaching',
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.iconTextColor,
        onPressed: () {},
        label: labels(
          text: 'Be Teacher',
          color: AppColors.white,
          size: 16,
        ),
      ),
      body: Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      verticalSpace(20.0),
                      Row(
                        children: [
                          horizontalSpace(10.0),
                          labels(
                            text: 'Teacher',
                            color: AppColors.darkTextColor,
                            size: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: teacherList.length,
                          itemBuilder: (context, index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: teacherList[index]['onTap'],
                                child: labels(
                                  text: teacherList[index]['label'].toString(),
                                  size: 17,
                                  textAlign: TextAlign.left,
                                  color: AppColors.darkTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpace(15.0),
                divider(
                  color: AppColors.darkTextColor,
                  height: 5,
                  thickness: 3,
                ),
                verticalSpace(15.0),
                Expanded(
                  child: Column(
                    children: [
                      verticalSpace(20.0),
                      Row(
                        children: [
                          horizontalSpace(10.0),
                          labels(
                            text: 'Teaching',
                            color: AppColors.darkTextColor,
                            size: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ],
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: teachingList.length,
                          itemBuilder: (context, index) => Card(
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: InkWell(
                                onTap: teachingList[index]['onTap'],
                                child: labels(
                                  text: teachingList[index]['label'].toString(),
                                  size: 17,
                                  textAlign: TextAlign.left,
                                  color: AppColors.darkTextColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
