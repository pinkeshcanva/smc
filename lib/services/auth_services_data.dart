import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/networks/db_constants.dart';
import 'package:smc/screens/registration_page/registration_screen_bloc.dart';
import 'package:smc/utils/colors.dart';
import '../networks/app_preference.dart';
import '../screens/login_page/log_in_screen_bloc.dart';
import '../utils/navigator_route.dart';

class AuthServices {
  static signupUser(
      {String? name,
      String? email,
      String? phoneNumber,
      String? password,
      BuildContext? context}) async {
    try {
      registrationBloc.getLoadData(true);
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email!, password: password!);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FireStoreServices.saveUser(
        name!,
        email,
        userCredential.user!.uid,
        phoneNumber!,
        password,
      );

      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.darkTextColor,
            content: labels(
                text: 'Registration Successful', color: AppColors.white)),
      );
      AppPreference.prefs!.setBool(dbLogin, true);
      AppPreference.prefs!.setString(dbUserId, userCredential.user!.uid);

      Navigator.pushNamedAndRemoveUntil(context, dashboard, (route) => false);
    } on FirebaseAuthException catch (e) {
      AppPreference.prefs!.setBool(dbLogin, false);
      registrationBloc.getLoadData(false);
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.darkTextColor,
            content: labels(
                text: "Password Provided is too weak", color: AppColors.white),
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.darkTextColor,
            content: labels(text: e.toString(), color: AppColors.white),
          ),
        );
      }
    }
  }

  static signinUser(
      {String? email, String? password, BuildContext? context}) async {
    try {
      logInBloc.getLogInLoading(true);
      await auth.signInWithEmailAndPassword(email: email!, password: password!);

      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.darkTextColor,
            content: labels(text: 'You are Logged in', color: AppColors.white)),
      );
      AppPreference.prefs!.setBool(dbLogin, true);
      Navigator.pushNamedAndRemoveUntil(context, dashboard, (route) => false);
    } on FirebaseAuthException catch (e) {
      AppPreference.prefs!.setBool(dbLogin, false);
      logInBloc.getLogInLoading(false);
      if (e.code == 'user-not-found') {
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.darkTextColor,
            content: labels(
                text: 'No User Found with this Email', color: AppColors.white),
          ),
        );
      } else if (e.code == 'wrong-password') {
        ScaffoldMessenger.of(context!).showSnackBar(
          SnackBar(
            backgroundColor: AppColors.darkTextColor,
            content:
                labels(text: 'Password did not match', color: AppColors.white),
          ),
        );
      }
    }
  }

  static signOut({BuildContext? context}) async {
    try {
      AppPreference.prefs!.remove(dbLogin);
      await auth.signOut();
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.darkTextColor,
            content: labels(text: 'You are Logout', color: AppColors.white)),
      );

      Navigator.pushNamedAndRemoveUntil(context, loginScreen, (route) => false);
    } catch (e) {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(
            backgroundColor: AppColors.darkTextColor,
            content: labels(text: '$e', color: AppColors.white)),
      );
    }
  }
}

forgotPassword({String? email, BuildContext? context}) async {
  try {
    await auth.sendPasswordResetEmail(email: email!).then((value) {
      Navigator.pop(context!);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.darkTextColor,
          content: labels(
              text: 'Please check your mail for reset password',
              color: AppColors.white),
        ),
      );
    });
  } catch (e) {
    ScaffoldMessenger.of(context!).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.darkTextColor,
        content: labels(text: 'User Not Define...', color: AppColors.white),
      ),
    );
  }
}

class FireStoreServices {
  static saveUser(
    String name,
    String email,
    String uid,
    String phone,
    String pass,
  ) async {
    await fireStoreRef.doc(uid).set({
      'email': email,
      'name': name,
      'pass': pass,
      'phone': phone,
      'uid': uid,
    });
  }
}
