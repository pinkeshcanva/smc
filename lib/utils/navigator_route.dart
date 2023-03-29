import 'package:smc/screens/awareness_event_page/awareness_event_screen.dart';
import 'package:smc/screens/cleanup_drive_page/cleanup_drive_screen.dart';
import 'package:smc/screens/dashboard/dashboard_screen.dart';
import 'package:smc/screens/food_bank_page/food_bank_screen.dart';
import 'package:smc/screens/google_map_screen.dart';
import 'package:smc/screens/help_page/help_screen.dart';
import 'package:smc/screens/home_page/home_screen.dart';
import 'package:smc/screens/login_page/log_in_screen.dart';
import 'package:smc/screens/registration_page/registration_screen.dart';
import 'package:smc/screens/teacher_teaching_page/teacher_teaching_screen.dart';
import 'package:smc/screens/tree_plantation_page/tree_plantation_screen.dart';
import '../main.dart';
import 'package:flutter/material.dart';

import '../screens/each_one_teach_one_page/each_one_teach_one_screen.dart';

const String rootScreen = "/";
const String loginScreen = "LogInScreen";
const String registrationScreen = "RegistrationScreen";
const String dashboard = "Dashboard";
const String homeScreen = "HomeScreen";
const String subcategoryScreen = "SubcategoryScreen";
const String itemListScreen = "ItemListScreen";
const String googleMapScreen = "GoogleMap";
const String helpScreen = "Help";
const String treePlantationScreen = "TreePlantationScreen";
const String cleanUpDriveScreen = "CleanUpDriveScreen";
const String awarenessEventScreen = "AwarenessEventScreen";
const String foodBankScreen = "FoodBankScreen";
const String eachOneTeachOneScreen = "EachOneTeachOneScreen";
const String teacherTeachingScreen = "TeacherTeachingScreen";

Map<String, WidgetBuilder> routes = {
  rootScreen: (context) => const MyApp(),
  loginScreen: (context) => const LogInScreen(),
  registrationScreen: (context) => const RegistrationScreen(),
  dashboard: (context) => const Dashboard(),
  homeScreen: (context) => const HomeScreen(),
  googleMapScreen: (context) => const GoogleMapScreen(),
  helpScreen: (context) => const HelpScreen(),
  treePlantationScreen: (context) => const TreePlantationScreen(),
  cleanUpDriveScreen: (context) => const CleanUpDriveScreen(),
  awarenessEventScreen: (context) => const AwarenessEventScreen(),
  foodBankScreen: (context) => const FoodBankScreen(),
  eachOneTeachOneScreen: (context) => const EachOneTeachOneScreen(),
  teacherTeachingScreen: (context) => const TeacherTeachingScreen(),
};
