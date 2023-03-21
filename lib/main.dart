import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smc/utils/screen_utils.dart';
import 'networks/app_preference.dart';
import 'networks/db_constants.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/login_page/log_in_screen.dart';
import 'utils/navigator_route.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // await NotificationService().flutterLocalNotificationsPlugin.cancelAll();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Montserrat'),
      routes: routes,
      initialRoute: rootScreen,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool login = false;

  Future getUser() async {
    await AppPreference.inti();
    login = (AppPreference.prefs != null)
        ? AppPreference.prefs!.getBool(dbLogin) ?? false
        : false;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    Screen.setScreenSize(context);
    return login ? const Dashboard() : const LogInScreen();
  }
}
