import 'package:docment/feature/about-us/presentation/about_us_screen.dart';
import 'package:docment/feature/appoinment/presentation/appoinment_screen.dart';
import 'package:docment/feature/home/presentation/home_presentation_screen.dart';
import 'package:flashy_tab_bar2/flashy_tab_bar2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/app_image.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;
  static TextStyle optionStyle =
      TextStyle(fontSize: 10, fontWeight: FontWeight.normal);

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePresentationScreen(),
    const AppoinmentScreen(),
    const AboutUsScreen(),
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
            primarySwatch: Colors.blue, primaryColor: Colors.redAccent,
            datePickerTheme: DatePickerThemeData(
            primaryColor: Colors.red, //Head background
            accentColor: Colors.red, //selection color
            dialogBackgroundColor: Colors.white, /
            )
            
            ),
        home: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              logo,
              height: 100.h,
              width: 120.w,
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.notifications_none_outlined),
              ),
            ],
          ),
          drawer: const Drawer(),
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
                  icon: Icon(Icons.home,
                      color: _selectedIndex == 0
                          ? Colors.blue
                          : Colors.grey), // Icon color
                  title: Text(
                    'Home',
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
                    'Date',
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: _selectedIndex == 1
                          ? Colors.blue
                          : Colors.grey, // Text color
                    ),
                  ),
                ),
                FlashyTabBarItem(
                  icon: Icon(Icons.business,
                      color: _selectedIndex == 2
                          ? Colors.blue
                          : Colors.grey), // Icon color
                  title: Text(
                    'Hospital',
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
