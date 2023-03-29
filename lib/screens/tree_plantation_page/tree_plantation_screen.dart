import 'package:flutter/material.dart';
import 'package:smc/common/widgets/appbar_widget.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/space_and_dividers.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/utils/colors.dart';
import 'package:smc/utils/screen_utils.dart';

import '../../common/widgets/field_and_label.dart';

class TreePlantationScreen extends StatefulWidget {
  const TreePlantationScreen({Key? key}) : super(key: key);

  @override
  State<TreePlantationScreen> createState() => _TreePlantationScreenState();
}

class _TreePlantationScreenState extends State<TreePlantationScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> eventList = [
      {
        'label': 'Event 1',
        'date': DateTime.now().toString(),
        'place': 'Surat',
        'onTap': () {},
      },
      {
        'label': 'Event 2',
        'date': DateTime.now().toString(),
        'place': 'Surat',
        'onTap': () {},
      },
      {
        'label': 'Event 3',
        'date': DateTime.now().toString(),
        'place': 'Surat',
        'onTap': () {},
      },
    ];

    return Scaffold(
      appBar: appbar(
        context,
        leadingIcon: Icons.arrow_back_outlined,
        title: 'Tree Plantation',
      ),
      body: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              verticalSpace(20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2025),
                      );
                    },
                    child: Container(
                      height: 54,
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor.withOpacity(0.3),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.calendar_month,
                            color: AppColors.darkTextColor.withOpacity(0.3),
                            size: 40,
                          ),
                          horizontalSpace(20),
                          labels(
                            text: 'Date',
                            maxLine: 2,
                            fontWeight: FontWeight.bold,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showTimePicker(
                          context: context, initialTime: TimeOfDay.now());
                    },
                    child: Container(
                      height: 54,
                      padding: const EdgeInsets.only(
                        right: 15,
                        left: 15,
                      ),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: AppColors.primaryColor.withOpacity(0.3),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.watch_later_outlined,
                            color: AppColors.darkTextColor.withOpacity(0.3),
                            size: 40,
                          ),
                          horizontalSpace(20),
                          labels(
                            text: 'Time',
                            maxLine: 2,
                            fontWeight: FontWeight.bold,
                            size: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              verticalSpace(10.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FieldAndLabel(
                  labelValue: '',
                  hint: 'Search',
                  onChanged: (val) {},
                  validationMessage: '',
                  isPassword: false,
                  fillColor: AppColors.white,
                  leftIcon: icons(
                    icon: Icons.search,
                    color: AppColors.iconTextColor,
                  ),
                  controller: searchController,
                ),
              ),
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
              Expanded(
                child: ListView.builder(
                  itemCount: eventList.length,
                  itemBuilder: (context, index) => Card(
                    child: InkWell(
                      onTap: eventList[index]['onTap'],
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          child: labels(
                            text: (index + 1).toString(),
                            color: AppColors.darkTextColor,
                          ),
                        ),
                        title: labels(
                          text: eventList[index]['label'].toString(),
                          size: 17,
                          textAlign: TextAlign.left,
                          color: AppColors.darkTextColor,
                        ),
                        subtitle: labels(
                          text: eventList[index]['date'].toString(),
                          textAlign: TextAlign.left,
                          color: AppColors.darkTextColor,
                        ),
                        trailing: labels(
                          text: eventList[index]['place'].toString(),
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
      ),
    );
  }
}
