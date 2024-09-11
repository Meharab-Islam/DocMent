import 'package:docment/feature/about-us/presentation/about_us_screen.dart';
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
    HomePresentationScreen(),
    Text(
      'Index 1: Appointments',
      style: optionStyle,
    ),
    AboutUsScreen(),
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
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Image.asset(
              logo,
              height: 100.h,
              width: 120.w,
            ),
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
          bottomNavigationBar: FlashyTabBar(
            animationCurve: Curves.linear,
            selectedIndex: _selectedIndex,
            iconSize: 25.sp,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) => setState(() {
              _selectedIndex = index;
            }),
            items: [
              FlashyTabBarItem(
                icon: Icon(Icons.home),
                title: Text(
                  'Home',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.calendar_month),
                title: Text(
                  'Date',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.business),
                title: Text(
                  'Hospital',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
              FlashyTabBarItem(
                icon: Icon(Icons.people),
                title: Text(
                  'Profile',
                  style: TextStyle(fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
