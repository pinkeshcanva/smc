import 'package:flutter/material.dart';
import 'package:smc/common/widgets/icon_and_images.dart';
import 'package:smc/common/widgets/text_and_styles.dart';
import 'package:smc/screens/dashboard/dashboard_screen_widget.dart';
import 'package:smc/screens/home_page/home_screen.dart';
import 'package:smc/screens/my_profile_page/my_profile_screen.dart';
import 'package:smc/utils/colors.dart';
import 'package:smc/utils/navigator_route.dart';
import 'package:smc/utils/strings.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  final List<Widget> _pageList = [
    const HomeScreen(),
    // Container(
    //   height: 100,
    //   width: 100,
    //   color: Colors.green,
    // ),
    // Container(
    //   height: 100,
    //   width: 100,
    //   color: Colors.blueAccent,
    // ),
    const MyProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: _pageList,
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: AppColors.iconTextColor,
        onPressed: () {
          Navigator.pushNamed(context, helpScreen);
        },
        label: labels(
          text: txtHelp,
          color: AppColors.white,
          size: 16,
        ),
      ),
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: <Widget>[
          donationPageTab,
          // courseAndTeacherTab,
          // ngosTab,
          profileTab,
        ],
        indicatorColor: AppColors.transparent,
        labelColor: AppColors.darkTextColor,
        unselectedLabelColor: AppColors.primaryColor,
      ),
    );
  }
}
