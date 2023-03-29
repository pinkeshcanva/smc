// ignore_for_file: library_private_types_in_public_api, depend_on_referenced_packages, no_leading_underscores_for_local_identifiers

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smc/common/widgets/progras_indicator.dart';
import 'package:smc/services/auth_services_data.dart';
import '../../common/validation/validation_stream_controller.dart';
import '../../common/widgets/field_and_label.dart';
import '../../common/widgets/icon_and_images.dart';
import '../../common/widgets/padding_margin.dart';
import '../../common/widgets/space_and_dividers.dart';
import '../../networks/app_preference.dart';
import '../../utils/colors.dart';
import '../../utils/screen_utils.dart';
import '../../utils/strings.dart';
import 'my_profile_screen_bloc.dart';
import 'my_profile_screen_widget.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileScreen extends StatefulWidget {
  const MyProfileScreen({Key? key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailErrorMsg = "";
  String nameErrorMsg = "";
  String phoneNumberErrorMsg = "";
  String dobErrorMsg = "";
  String passwordErrorMsg = "";

  @override
  void dispose() {
    emailController.clear();
    nameController.clear();
    phoneNumberController.clear();
    dobController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  void initState() {
    AppPreference.inti();
    nameController.text = AppPreference.getString(txtName);
    emailController.text = AppPreference.getString(txtEmailAddress);
    phoneNumberController.text = AppPreference.getString(txtPhoneNumber);
    super.initState();
  }

  File? img;

  setImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    img = File(image!.path);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Container(
                width: Screen.screenWidth,
                padding: paddingAll(20.0),
                child: Column(
                  children: [
                    // CircleAvatar(
                    //   backgroundImage: (img != null)
                    //       ? FileImage(img!)
                    //       : const NetworkImage('') as ImageProvider,
                    // ),

                    logoWidget,
                    myProfileWidget,
                    verticalSpace(23.0),
                    FieldAndLabel(
                      labelValue: txtName,
                      hint: txtEnterName,
                      inputType: TextInputType.text,
                      controller: nameController,
                      validationMessage: nameErrorMsg,
                      fillColor: AppColors.white,
                      isEnable: false,
                      rightIcon: icons(
                          icon: Icons.person, color: AppColors.iconTextColor),
                      onChanged: (value) {
                        setState(() {
                          nameErrorMsg = nameValidationMsg(value);
                        });
                      },
                    ),
                    verticalSpace(23.0),
                    FieldAndLabel(
                      labelValue: txtEmailAddress,
                      hint: txtEnterEmail,
                      inputType: TextInputType.emailAddress,
                      controller: emailController,
                      validationMessage: emailErrorMsg,
                      fillColor: AppColors.white,
                      isEnable: false,
                      rightIcon: icons(
                          icon: Icons.email_outlined,
                          color: AppColors.iconTextColor),
                      onChanged: (value) {
                        setState(() {
                          emailErrorMsg = emailValidationMsg(value);
                        });
                      },
                    ),
                    verticalSpace(23.0),
                    FieldAndLabel(
                      labelValue: txtPhoneNumber,
                      hint: txtEnterPhoneNumber,
                      inputType: TextInputType.phone,
                      controller: phoneNumberController,
                      validationMessage: phoneNumberErrorMsg,
                      maxLength: 10,
                      fillColor: AppColors.white,
                      isEnable: false,
                      rightIcon: icons(
                          icon: Icons.call, color: AppColors.iconTextColor),
                      onChanged: (value) {
                        setState(() {
                          phoneNumberErrorMsg = mobileValidationMsg(value);
                        });
                      },
                    ),
                    // verticalSpace(23.0),
                    // textFieldWithDatePicker(
                    //   context,
                    //   controller: dobController,
                    //   label: txtDOB,
                    //   error: dobErrorMsg,
                    // ),
                    verticalSpace(Screen.bottomHeight),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
