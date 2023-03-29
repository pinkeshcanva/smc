import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:smc/common/widgets/appbar_widget.dart';
import 'package:smc/common/widgets/buttons.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/padding_margin.dart';
import 'package:smc/common/widgets/space_and_dividers.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/utils/colors.dart';

import '../../common/widgets/field_and_label.dart';

class EachOneTeachOneScreen extends StatefulWidget {
  const EachOneTeachOneScreen({Key? key}) : super(key: key);

  @override
  State<EachOneTeachOneScreen> createState() => _EachOneTeachOneScreenState();
}

class _EachOneTeachOneScreenState extends State<EachOneTeachOneScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController topicController = TextEditingController();
  TextEditingController contactController = TextEditingController();
  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(
        context,
        leadingIcon: Icons.arrow_back_outlined,
        title: 'Each One Teach One',
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.iconTextColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
              child: Padding(
                padding: paddingAll(20.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    labels(
                      text: 'Host Clean Up Drive',
                      size: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                    verticalSpace(10.0),
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
                            height: 45,
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
                                  color:
                                      AppColors.darkTextColor.withOpacity(0.3),
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
                            height: 45,
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
                                  color:
                                      AppColors.darkTextColor.withOpacity(0.3),
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
                        hint: 'Topic Name',
                        onChanged: (val) {},
                        validationMessage: '',
                        isPassword: false,
                        fillColor: AppColors.white,
                        leftIcon: icons(
                          icon: Icons.topic_outlined,
                          color: AppColors.iconTextColor,
                        ),
                        controller: topicController,
                      ),
                    ),
                    verticalSpace(10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FieldAndLabel(
                        labelValue: '',
                        hint: 'Place',
                        onChanged: (val) {},
                        validationMessage: '',
                        isPassword: false,
                        fillColor: AppColors.white,
                        leftIcon: icons(
                          icon: Icons.computer,
                          color: AppColors.iconTextColor,
                        ),
                        controller: urlController,
                      ),
                    ),
                    verticalSpace(10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FieldAndLabel(
                        labelValue: '',
                        hint: 'Name',
                        onChanged: (val) {},
                        validationMessage: '',
                        isPassword: false,
                        fillColor: AppColors.white,
                        leftIcon: icons(
                          icon: Icons.person,
                          color: AppColors.iconTextColor,
                        ),
                        controller: nameController,
                      ),
                    ),
                    verticalSpace(10.0),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FieldAndLabel(
                        labelValue: '',
                        hint: 'Contact',
                        onChanged: (val) {},
                        validationMessage: '',
                        isPassword: false,
                        fillColor: AppColors.white,
                        leftIcon: icons(
                          icon: Icons.phone,
                          color: AppColors.iconTextColor,
                        ),
                        controller: contactController,
                      ),
                    ),
                    verticalSpace(10.0),
                    filledButton(
                      label: 'Submit',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          );
        },
        label: labels(
          text: 'Teach',
          color: AppColors.white,
          size: 16,
        ),
      ),
      body: Scaffold(
        body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              title: labels(
                text: 'Teaching BootCamp ${index + 1}',
                size: 17,
                textAlign: TextAlign.left,
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  labels(text: '29/03/2023'),
                  labels(text: 'By:- XYZ'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
