import 'package:docment/core/widget/drower.dart';
import 'package:docment/feature/about-us/presentation/about_us_screen.dart';
import 'package:docment/feature/appoinment/presentation/appoinment_screen.dart';
import 'package:docment/feature/chat/presentation/chat_list.dart';
import 'package:docment/feature/home/presentation/home_presentation_screen.dart';
import 'package:docment/feature/profile/presentation/profile_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'core/app_image.dart';
import 'feature/global/domain/navigationbar_tab_controller.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
  // runApp(const DashboardMainScreen());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Initialize ScreenUtil for responsive design
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red, // Main color theme
          colorScheme: const ColorScheme.light(
            primary: Colors.blue, // Header background color
            onPrimary: Colors.white, // Header text color
            onSurface: Color.fromARGB(255, 66, 66, 66), // Body text color
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.red, // Button text color
            ),
          ),
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  // Inject MyTabController
  final NavigationbarTabController tabController =
      Get.put(NavigationbarTabController());

  static TextStyle optionStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.normal);

  // Screens to show based on the selected index
  static final List<Widget> _widgetOptions = <Widget>[
    const HomePresentationScreen(),
    AppointmentScreen(),
    const AboutUsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Image.asset(
          logo, // Ensure this asset exists in pubspec.yaml
          height: 100.h,
          width: 120.w,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => ChatListScreen());
            },
            icon: const Icon(FontAwesomeIcons.facebookMessenger),
          ),
        ],
      ),
      drawer: MyDrawer(),
      body: Center(
        // Using Obx to observe changes in the selected index
        child: Obx(() => _widgetOptions[tabController.selectedIndex.value]),
      ),
      bottomNavigationBar: SizedBox(
        height: 55.h,
        child: Obx(
          () => FlashyTabBar(
            backgroundColor: Colors.white,
            animationCurve: Curves.linear,
            selectedIndex: tabController.selectedIndex.value,
            iconSize: 25.sp,
            showElevation: true,
            onItemSelected: (index) => tabController.changeTab(index),
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.home,
                    color: tabController.selectedIndex.value == 0
                        ? Colors.blue
                        : Colors.grey),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: tabController.selectedIndex.value == 0
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.calendar_month,
                    color: tabController.selectedIndex.value == 1
                        ? Colors.blue
                        : Colors.grey),
                title: Text(
                  'Date',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: tabController.selectedIndex.value == 1
                        ? Colors.blue
                        : Colors.grey,
                  ),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.business,
                    color: tabController.selectedIndex.value == 2
                        ? Colors.blue
                        : Colors.grey),
                title: Text(
                  'Hospital',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: tabController.selectedIndex.value == 2
                          ? Colors.blue
                          : Colors.grey),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.people,
                    color: tabController.selectedIndex.value == 3
                        ? Colors.blue
                        : Colors.grey),
                title: Text(
                  'Profile',
                  style: TextStyle(
                      fontSize: 14.sp,
                      color: tabController.selectedIndex.value == 3
                          ? Colors.blue
                          : Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
