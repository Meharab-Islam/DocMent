import 'package:docment/core/app_image.dart';
import 'package:docment/core/widget/drower.dart';
import 'package:docment/feature/chat/presentation/chat_list.dart';
import 'package:docment/feature/dashboard/doctor/domain/navigationbar_controller.dart';
import 'package:docment/feature/dashboard/doctor/presentation/appoinment/dashboard_appoinment_screen.dart';
import 'package:docment/feature/dashboard/doctor/presentation/dashboard_landing_screen.dart';
import 'package:docment/feature/dashboard/doctor/presentation/payment/dashboard_payment_screen.dart';
import 'package:docment/feature/dashboard/doctor/presentation/dashboard_profile_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class DashboardMainScreen extends StatelessWidget {
  DashboardMainScreen({super.key});

  // Initialize the GetX controller
  final DashboardController dashboardController =
      Get.put(DashboardController());

  // Define widget options here
  final List<Widget> _widgetOptions = <Widget>[
    const DashboardLandingScreen(),
    DashBoardAppointmentsScreen(),
    PaymentScreen(),
    DoctorProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _buildAppBar(),
        drawer: MyDrawer(),
        body: _buildBody(),
        bottomNavigationBar: _buildBottomNavigationBar(),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Image.asset(
        logo,
        height: 100.h,
        width: 120.w,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Get.to(() => ChatListScreen());
          },
          icon: Icon(FontAwesomeIcons.message, size: 20.sp),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Obx(() {
      return Center(
        child: _widgetOptions[dashboardController.selectedIndex.value],
      );
    });
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() {
      return SizedBox(
        height: 55.h,
        child: FlashyTabBar(
          backgroundColor: Colors.white,
          animationCurve: Curves.linear,
          selectedIndex: dashboardController
              .selectedIndex.value, // Ensure this is bound to the controller
          iconSize: 25.sp,
          showElevation: true,
          onItemSelected: (index) {
            dashboardController.updateIndex(index); // Update index on tap
          },
          items: [
            _buildNavBarItem(Icons.dashboard, 'Dashboard', 0),
            _buildNavBarItem(Icons.calendar_month, 'Appointments', 1),
            _buildNavBarItem(Icons.money_rounded, 'Payment', 2),
            _buildNavBarItem(Icons.people, 'Profile', 3),
          ],
        ),
      );
    });
  }

  FlashyTabBarItem _buildNavBarItem(IconData icon, String title, int index) {
    return FlashyTabBarItem(
      icon: Icon(
        icon,
        color: dashboardController.selectedIndex.value == index
            ? Colors.blue
            : Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 14.sp,
          color: dashboardController.selectedIndex.value == index
              ? Colors.blue
              : Colors.grey,
        ),
      ),
    );
  }
}
