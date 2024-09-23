import 'package:docment/core/app_image.dart';
import 'package:docment/core/widget/drower.dart';
import 'package:docment/feature/chat/presentation/chat_list.dart';
import 'package:docment/feature/dashboard/doctor/domain/navigationbar_controller.dart';
import 'package:docment/feature/dashboard/doctor/presentation/dashboard_landing_screen.dart';
import 'package:docment/feature/dashboard/doctor/presentation/dashboard_payment_screen.dart';
import 'package:docment/feature/dashboard/doctor/presentation/dashboard_profile_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashboardMainScreen extends StatelessWidget {
  DashboardMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the GetX controller
    final DashboardController dashboardController =
        Get.put(DashboardController());

    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: (context, child) => Scaffold(
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
        body: Obx(() {
          return Center(
            child: _widgetOptions[dashboardController.selectedIndex.value],
          );
        }),
        bottomNavigationBar: SizedBox(
          height: 55.h,
          child: FlashyTabBar(
            backgroundColor: Colors.white, // Background color of the tab bar
            animationCurve: Curves.linear,
            selectedIndex: dashboardController.selectedIndex.value,
            iconSize: 25.sp,
            showElevation: true, // Use this to remove appBar's elevation
            onItemSelected: (index) {
              dashboardController.updateIndex(index);
            },
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.dashboard,
                    color: dashboardController.selectedIndex.value == 0
                        ? Colors.blue
                        : Colors.grey), // Icon color
                title: Text(
                  'DashBoard',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: dashboardController.selectedIndex.value == 0
                        ? Colors.blue
                        : Colors.grey, // Text color
                  ),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.calendar_month,
                    color: dashboardController.selectedIndex.value == 1
                        ? Colors.blue
                        : Colors.grey), // Icon color
                title: Text(
                  'Appointments',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: dashboardController.selectedIndex.value == 1
                        ? Colors.blue
                        : Colors.grey, // Text color
                  ),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.money_rounded,
                    color: dashboardController.selectedIndex.value == 2
                        ? Colors.blue
                        : Colors.grey), // Icon color
                title: Text(
                  'Payment',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: dashboardController.selectedIndex.value == 2
                        ? Colors.blue
                        : Colors.grey, // Text color
                  ),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.people,
                    color: dashboardController.selectedIndex.value == 3
                        ? Colors.blue
                        : Colors.grey), // Icon color
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: dashboardController.selectedIndex.value == 3
                        ? Colors.blue
                        : Colors.grey, // Text color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Define widget options here
  final List<Widget> _widgetOptions = <Widget>[
    const DashboardLandingScreen(),
    Text(
      'Index 1: Appointment',
      style: TextStyle(fontSize: 10, fontWeight: FontWeight.normal),
    ),
    PaymentScreen(),
    DoctorProfileScreen(),
  ];
}
