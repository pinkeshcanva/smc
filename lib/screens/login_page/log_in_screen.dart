// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:smc/common/widgets/progras_indicator.dart';
import 'package:smc/screens/login_page/log_in_screen_bloc.dart';
import 'package:smc/screens/login_page/log_in_screen_widget.dart';
import 'package:smc/services/auth_services_data.dart';
import 'package:smc/utils/navigator_route.dart';
import 'package:smc/utils/strings.dart';
import '../../../common/validation/validation_stream_controller.dart';
import '../../../common/widgets/buttons.dart';
import '../../../common/widgets/field_and_label.dart';
import '../../../common/widgets/icon_and_images.dart';
import '../../../common/widgets/padding_margin.dart';
import '../../../common/widgets/space_and_dividers.dart';
import '../../../common/widgets/text_and_styles.dart';
import '../../../networks/app_preference.dart';
import '../../../utils/colors.dart';
import '../../../utils/screen_utils.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  bool passVisible = true;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String emailErrorMsg = "";
  String passwordErrorMsg = "";

  @override
  void initState() {
    logInBloc.getLogInLoading(false);
    super.initState();
  }

  @override
  void dispose() {
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    AppPreference.inti();
    Screen.setScreenSize(context);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: Screen.screenWidth,
          child: StreamBuilder(
              stream: logInBloc.logInLoadingStream,
              builder: (context, AsyncSnapshot<bool> snapshot) {
                return Stack(
                  children: [
                    Padding(
                      padding: paddingAll(20.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          logoWidget,
                          welcome,
                          loginContinue,
                          verticalSpace(28.0),
                          FieldAndLabel(
                            labelValue: txtEmailAddress,
                            hint: txtEnterEmail,
                            inputType: TextInputType.emailAddress,
                            controller: emailController,
                            validationMessage: emailErrorMsg,
                            fillColor: AppColors.white,
                            leftIcon: icons(
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
                            labelValue: txtPassword,
                            hint: txtEnterPassword,
                            isPassword: passVisible,
                            controller: passwordController,
                            validationMessage: passwordErrorMsg,
                            fillColor: AppColors.white,
                            leftIcon: icons(
                                icon: Icons.lock_outline,
                                color: AppColors.iconTextColor),
                            onChanged: (value) {
                              setState(() {
                                passwordErrorMsg = passwordValidationMsg(value);
                              });
                            },
                            rightIcon: iconButton(
                              onTap: () {
                                setState(() {
                                  passVisible = !passVisible;
                                });
                              },
                              iconColor: AppColors.iconTextColor,
                              icon: passVisible
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                            ),
                          ),
                          verticalSpace(16.0),
                          forgotPass(context, onTap: () {}),
                          verticalSpace(46.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              labels(
                                text: txtLogin,
                                color: AppColors.loginColor,
                                size: 14.0,
                                fontWeight: FontWeight.w600,
                              ),
                              horizontalSpace(14.0),
                              filledButton(
                                  label: '',
                                  width: 93.0,
                                  child: icons(
                                    icon: Icons.arrow_forward,
                                    size: 24.0,
                                    color: AppColors.white,
                                  ),
                                  onTap: () async {
                                    setState(() {
                                      emailErrorMsg = emailValidationMsg(
                                          emailController.text);
                                      passwordErrorMsg = passwordValidationMsg(
                                          passwordController.text);
                                    });

                                    if (emailErrorMsg == '' &&
                                        passwordErrorMsg == '') {
                                      AuthServices.signinUser(
                                          context: context,
                                          email: emailController.text,
                                          password: passwordController.text);
                                    }
                                  }),
                            ],
                          ),
                          verticalSpace(Screen.screenHeight * 0.05),
                          Center(
                            child: RichText(
                              text: TextSpan(
                                text: "Don’t have an account? ",
                                style: defaultTextStyle(
                                  color: AppColors.hintColor,
                                  size: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'New User',
                                    style: defaultTextStyle(
                                      color: AppColors.loginColor,
                                      size: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Navigator.pushNamed(
                                            context,
                                            registrationScreen,
                                          ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          verticalSpace(Screen.bottomHeight),
                        ],
                      ),
                    ),
                    snapshot.hasData && snapshot.data!
                        ? fullScreenCircularIndicator
                        : Container(),
                  ],
                );
              }),
        ),
      ),
    );
  }
}
