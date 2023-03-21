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
import 'registration_screen_bloc.dart';
import 'registration_screen_widget.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
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

  // _register(context) async {
  //   // if (user != null) {
  //   // String key = db.push().key!;
  //   // ProfileModel profile = ProfileModel(
  //   //   name: nameController.text,
  //   //   email: emailController.text,
  //   //   mobile: phoneNumberController.text,
  //   //   dob: dobController.text,
  //   //   key: key,
  //   // );
  //   // db.child(dbProfiles).child(key).set(profile.toMap());
  //   Navigator.pushReplacementNamed(context, loginScreen);
  //   showDialog(
  //     context: context,
  //     builder: (context) => Dialog(
  //       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
  //       child: Padding(
  //         padding: paddingAll(20.0),
  //         child: labels(
  //           text: txtRegistrationSuccessfully,
  //           size: 16.0,
  //           fontWeight: FontWeight.w600,
  //         ),
  //       ),
  //     ),
  //   );
  //   // }
  // }

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
    registrationBloc.getLoadData(false);
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
    AppPreference.inti();
    Screen.setScreenSize(context);
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
                    createAnAccount,
                    verticalSpace(23.0),
                    FieldAndLabel(
                      labelValue: txtName,
                      hint: txtEnterName,
                      inputType: TextInputType.text,
                      controller: nameController,
                      validationMessage: nameErrorMsg,
                      fillColor: AppColors.white,
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
                    verticalSpace(23.0),
                    FieldAndLabel(
                      labelValue: txtPassword,
                      hint: txtEnterPassword,
                      controller: passwordController,
                      validationMessage: passwordErrorMsg,
                      fillColor: AppColors.white,
                      rightIcon: icons(
                          icon: Icons.lock_outline,
                          color: AppColors.iconTextColor),
                      onChanged: (value) {
                        setState(() {
                          passwordErrorMsg = passwordValidationMsg(value);
                        });
                      },
                    ),
                    verticalSpace(30.0),
                    createAccountButton(onTap: () {
                      setState(() {
                        emailErrorMsg =
                            emailValidationMsg(emailController.text);
                        nameErrorMsg = nameValidationMsg(nameController.text);
                        phoneNumberErrorMsg =
                            mobileValidationMsg(phoneNumberController.text);
                        passwordErrorMsg =
                            passwordValidationMsg(passwordController.text);
                        // dobErrorMsg = dobValidationMsg(dobController.text);
                      });

                      if (emailErrorMsg == "" &&
                          nameErrorMsg == "" &&
                          phoneNumberErrorMsg == "" &&
                          // dobErrorMsg == "" &&
                          passwordErrorMsg == "") {
                        AuthServices.signupUser(
                          context: context,
                          email: emailController.text,
                          password: passwordController.text,
                          phoneNumber: phoneNumberController.text,
                          name: nameController.text,
                        );

                        // _register(context);
                        // Navigator.pushNamed(
                        //   context,
                        //   dashboard,
                        // );
                      }
                    }),
                    verticalSpace(Screen.bottomHeight),
                  ],
                ),
              ),
            ),
            StreamBuilder(
              stream: registrationBloc.loadDataStream,
              builder: (context, AsyncSnapshot<bool> snapshot) {
                return snapshot.hasData && snapshot.data!
                    ? fullScreenCircularIndicator
                    : Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
