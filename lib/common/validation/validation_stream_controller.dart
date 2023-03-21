import 'validation_string.dart';

String emailValidationMsg(String email) {
  String pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern);
  if (email.isEmpty) {
    return errorRequiredEmail;
  } else if (regex.hasMatch(email)) {
    return errorValid;
  } else {
    return errorValidEmail;
  }
}

String passwordValidationMsg(String password) {
  if (password.isEmpty || password == "") {
    return errorRequiredPassword;
  } else if (password.length < 6) {
    return errorMinimum6Character;
  } else {
    return "";
  }
}

String mobileValidationMsg(String mobile) {
  if (mobile.isEmpty || mobile == "") {
    return errorRequiredMobileNumber;
  } else if (mobile.length < 10 || mobile.length > 10) {
    return errorValidMobileNumber;
  } else {
    return "";
  }
}

String nameValidationMsg(String name) =>
    name.isEmpty || name == "" ? errorRequiredName : "";

String ageValidationMsg(String age) =>
    age.isEmpty || age == "" ? errorRequiredAge : "";

String dobValidationMsg(String dob) =>
    dob.isEmpty || dob == "" ? errorRequiredDob : "";
