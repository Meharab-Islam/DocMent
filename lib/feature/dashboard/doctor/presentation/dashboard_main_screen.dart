import 'package:docment/feature/dashboard/doctor/presentation/dashboard_landing_screen.dart';
import 'package:docment/feature/dashboard/doctor/presentation/dashboard_payment_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({super.key});

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.normal);

  static final List<Widget> _widgetOptions = <Widget>[
    const DashboardLandingScreen(),
    Text(
      'Index 1: Appointment',
      style: optionStyle,
    ),
    DashboardPaymentScreen(),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 640),
      builder: (context, child) => MaterialApp(
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
        home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: _widgetOptions[_selectedIndex],
          ),
          bottomNavigationBar: SizedBox(
            height: 55.h,
            child: FlashyTabBar(
              backgroundColor: Colors.white, // Background color of the tab bar
              animationCurve: Curves.linear,
              selectedIndex: _selectedIndex,

              iconSize: 25.sp,
              showElevation: true, // Use this to remove appBar's elevation
              onItemSelected: (index) => setState(() {
                _selectedIndex = index;
              }),
              items: [
                FlashyTabBarItem(
                  icon: Icon(Icons.dashboard,
                      color: _selectedIndex == 0
                          ? Colors.blue
                          : Colors.grey), // Icon color
                  title: Text(
                    'DashBoard',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _selectedIndex == 0
                          ? Colors.blue
                          : Colors.grey, // Text color
                    ),
                  ),
                ),
                FlashyTabBarItem(
                  icon: Icon(Icons.calendar_month,
                      color: _selectedIndex == 1
                          ? Colors.blue
                          : Colors.grey), // Icon color
                  title: Text(
                    'Appointments',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _selectedIndex == 1
                          ? Colors.blue
                          : Colors.grey, // Text color
                    ),
                  ),
                ),
                FlashyTabBarItem(
                  icon: Icon(Icons.money_rounded,
                      color: _selectedIndex == 2
                          ? Colors.blue
                          : Colors.grey), // Icon color
                  title: Text(
                    'Payment',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _selectedIndex == 2
                          ? Colors.blue
                          : Colors.grey, // Text color
                    ),
                  ),
                ),
                FlashyTabBarItem(
                  icon: Icon(Icons.people,
                      color: _selectedIndex == 3
                          ? Colors.blue
                          : Colors.grey), // Icon color
                  title: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _selectedIndex == 3
                          ? Colors.blue
                          : Colors.grey, // Text color
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
