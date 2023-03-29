import 'package:smc/screens/dashboard/dashboard_screen.dart';
import 'package:smc/screens/google_map_screen.dart';
import 'package:smc/screens/help_page/help_screen.dart';
import 'package:smc/screens/home_page/home_screen.dart';
import 'package:smc/screens/login_page/log_in_screen.dart';
import 'package:smc/screens/registration_page/registration_screen.dart';
import '../main.dart';
import 'package:flutter/material.dart';

const String rootScreen = "/";
const String loginScreen = "LogInScreen";
const String registrationScreen = "RegistrationScreen";
const String dashboard = "Dashboard";
const String homeScreen = "HomeScreen";
const String subcategoryScreen = "SubcategoryScreen";
const String itemListScreen = "ItemListScreen";
const String googleMapScreen = "GoogleMap";
const String helpScreen = "Help";

Map<String, WidgetBuilder> routes = {
  rootScreen: (context) => const MyApp(),
  loginScreen: (context) => const LogInScreen(),
  registrationScreen: (context) => const RegistrationScreen(),
  dashboard: (context) => const Dashboard(),
  homeScreen: (context) => const HomeScreen(),
  googleMapScreen: (context) => const GoogleMapScreen(),
  helpScreen: (context) => const HelpScreen(),
};
