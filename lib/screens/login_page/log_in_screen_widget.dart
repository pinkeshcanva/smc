// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:smc/common/validation/validation_stream_controller.dart';
import 'package:smc/common/widgets/buttons.dart';
import 'package:smc/common/widgets/field_and_label.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/padding_margin.dart';
import 'package:smc/common/widgets/space_and_dividers.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/services/auth_services_data.dart';
import 'package:smc/utils/colors.dart';
import 'package:smc/utils/images.dart';
import 'package:smc/utils/screen_utils.dart';
import 'package:smc/utils/strings.dart';

Widget logoWidget = Center(
  child: Images.instance.assetImage(
    name: appLogo,
    height: Screen.screenHeight * 0.4,
    color: AppColors.loginColor,
  ),
);

Widget welcome = labels(
  text: txtWelcomeBack,
  color: AppColors.darkTextColor,
  fontWeight: FontWeight.w600,
  size: 26.0,
);
Widget loginContinue = labels(
  text: txtLoginToContinue,
  color: AppColors.darkTextColor,
  fontWeight: FontWeight.w400,
  size: 14.0,
);

Widget forgotPass(context, {required Function onTap}) => Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const ForgotPassword(),
            );
          },
          child: labels(
            text: txtForgotPassword,
            color: AppColors.hintColor,
            size: 14.0,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController emailController = TextEditingController();

  String emailErrorMsg = "";

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      contentPadding: paddingAll(20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      children: [
        FieldAndLabel(
          labelValue: txtEmailAddress,
          hint: txtEnterEmail,
          inputType: TextInputType.emailAddress,
          controller: emailController,
          validationMessage: emailErrorMsg,
          fillColor: AppColors.white,
          leftIcon:
              icons(icon: Icons.email_outlined, color: AppColors.iconTextColor),
          onChanged: (value) {
            setState(() {
              emailErrorMsg = emailValidationMsg(value);
            });
          },
        ),
        verticalSpace(20.0),
        submitButton(
          text: 'Submit',
          textColor: AppColors.white,
          width: 50,
          onPressed: () async {
            forgotPassword(email: emailController.text, context: context);
          },
        ),
      ],
    );
  }
}
