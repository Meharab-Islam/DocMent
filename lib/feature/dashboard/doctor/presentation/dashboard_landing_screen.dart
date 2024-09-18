import 'package:docment/core/const_design.dart';
import 'package:docment/core/widget/squre_card_widgets.dart';
import 'package:docment/feature/dashboard/doctor/widget/line_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DashboardLandingScreen extends StatelessWidget {
  const DashboardLandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: ListView(
          children: [
            verticalGap(10.h),
            Row(
              children: [
                CircleAvatar(
                  radius: 25.r,
                  backgroundImage: const NetworkImage(
                      "https://images.pexels.com/photos/19438558/pexels-photo-19438558/free-photo-of-docto.jpeg?auto=compress&cs=tinysrgb&w=600"),
                ),
                horizontalGap(10.w),
                Text(
                  "Welcome,".toUpperCase(),
                  style: TextStyle(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.w,
                      color: const Color.fromARGB(255, 136, 136, 136)),
                ),
                horizontalGap(5.w),
                Text(
                  "Jhon Doe".toUpperCase(),
                  style: TextStyle(
                    fontSize: 27.sp,
                    fontWeight: FontWeight.bold,
                    // letterSpacing: 2.w,
                    color: Colors.redAccent,
                  ),
                ),
                horizontalGap(5.w),
              ],
            ),
            verticalGap(10.h),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,
              runSpacing: 6.h,
              children: [
                squireCard(
                    context: context,
                    count: "0",
                    title: "Today Appointment",
                    icon: Icons.calendar_month_rounded),
                squireCard(
                    context: context,
                    count: "5",
                    title: "New Appointment",
                    icon: Icons.calendar_month_rounded),
                squireCard(
                    context: context,
                    count: "\$56554",
                    title: "Earnings",
                    icon: Icons.calendar_month_rounded),
                squireCard(
                    context: context,
                    count: "5",
                    title: "Successful Appointments",
                    icon: Icons.calendar_month_rounded),
              ],
            ),
            verticalGap(30.h),
            Text(
              "Earnings In September, 2024",
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 136, 136, 136)),
              textAlign: TextAlign.center,
            ),
            // verticalGap(7.h),
            LineChartSample2()
          ],
        ),
      ),
    );
  }
}
