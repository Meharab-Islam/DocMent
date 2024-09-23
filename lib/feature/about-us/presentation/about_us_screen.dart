// ignore_for_file: unused_local_variable

import 'package:docment/core/const_design.dart';
import 'package:docment/core/widget/squre_card_widgets.dart';
import 'package:docment/feature/about-us/presentation/about_us_details_screen.dart';
import 'package:docment/feature/about-us/presentation/our_department_screen.dart';
import 'package:docment/feature/about-us/presentation/our_service_screen.dart';
import 'package:docment/feature/about-us/presentation/work_details_screen.dart';
import 'package:docment/feature/about-us/widget/list_card%20design.dart';
import 'package:docment/feature/about-us/widget/subscribe_us_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = 130.h;
    double width = MediaQuery.of(context).size.width / 2.2;
    BoxDecoration boxDecoration = BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(10.r),
      // image: DecorationImage(
      //     image: NetworkImage(
      //         "https://images.pexels.com/photos/287227/pexels-photo-287227.jpeg?auto=compress&cs=tinysrgb&w=600"),
      //     fit: BoxFit.cover),
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.5.w),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                alignment: WrapAlignment.spaceBetween,

                runSpacing: 6.h,
                // spacing: 5.w,
                children: [
                  squireCard(
                      context: context,
                      count: "500+",
                      title: "Patients",
                      icon: Icons.people_alt_outlined),
                  squireCard(
                      context: context,
                      count: "16",
                      title: "Departments",
                      icon: Icons.business_center_outlined),
                  squireCard(
                      context: context,
                      count: "50",
                      title: "Expert Doctors",
                      icon: Icons.people_alt_outlined),
                  squireCard(
                      context: context,
                      count: "120",
                      title: "Total Labs",
                      icon: Icons.favorite_border_outlined),
                ],
              ),
            ),
            verticalGap(10.h),
            ListButtonCard(
              image:
                  "https://images.pexels.com/photos/2284169/pexels-photo-2284169.jpeg?auto=compress&cs=tinysrgb&w=600",
              title: "About Us",
              subtitle: " Know about our mission and vision",
              onTap: () {
                Get.to(AboutUsDetailsScreen());
              },
            ).animate().moveX(
                  curve: Curves.linear,
                  begin: MediaQuery.of(context).size.width,
                  end: 0,
                  duration: const Duration(milliseconds: 1300),
                ),
            verticalGap(10.h),
            ListButtonCard(
              image:
                  "https://images.pexels.com/photos/4489749/pexels-photo-4489749.jpeg?auto=compress&cs=tinysrgb&w=600",
              title: "Our Work",
              subtitle: "See how we work and what we do",
              onTap: () {
                Get.to(WorkDetailsScreen());
              },
            ).animate().moveX(
                  curve: Curves.linear,
                  begin: -MediaQuery.of(context).size.width,
                  end: 0,
                  duration: const Duration(milliseconds: 1300),
                ),
            verticalGap(10.h),
            ListButtonCard(
              image:
                  "https://images.pexels.com/photos/8376285/pexels-photo-8376285.jpeg?auto=compress&cs=tinysrgb&w=600",
              title: "Our Services",
              subtitle: "See how we work and what we do",
              onTap: () {
                Get.to(ServicePage());
              },
            ).animate().moveX(
                  curve: Curves.linear,
                  begin: MediaQuery.of(context).size.width,
                  end: 0,
                  duration: const Duration(milliseconds: 1300),
                ),
            verticalGap(10.h),
            ListButtonCard(
              image:
                  "https://images.pexels.com/photos/5699431/pexels-photo-5699431.jpeg?auto=compress&cs=tinysrgb&w=600",
              title: "Our Departments",
              subtitle: "See how we work and what we do",
              onTap: () {
                Get.to(OurDepartmentScreen());
              },
            ).animate().moveX(
                  curve: Curves.linear,
                  begin: -MediaQuery.of(context).size.width,
                  end: 0,
                  duration: const Duration(milliseconds: 1300),
                ),
            verticalGap(20.h),
            SubscribeUsCard(),
            verticalGap(20.h),
          ],
        ),
      ),
    );
  }
}
