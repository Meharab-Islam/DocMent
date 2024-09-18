import 'package:docment/core/const_design.dart';
import 'package:docment/core/widget/squre_card_widgets.dart';
import 'package:docment/feature/about-us/presentation/about_us_details_screen.dart';
import 'package:docment/feature/about-us/presentation/work_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  squireCard(context: context, count: "500+", title:  "Patients", icon: Icons.people_alt_outlined),
                  squireCard(context: context, count: "16", title:  "Departments", icon: Icons.business_center_outlined),
                  squireCard(context: context, count: "50", title:  "Expert Doctors", icon: Icons.people_alt_outlined),
                  squireCard(context: context, count: "120", title:  "Total Labs", icon: Icons.favorite_border_outlined),
                  
                ],
              ),
            ),
            verticalGap(10.h),
            Bounceable(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsDetailsScreen()));
              },
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/2284169/pexels-photo-2284169.jpeg?auto=compress&cs=tinysrgb&w=600"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "About US",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Know about our mission and vision",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ).animate().moveX(
                  curve: Curves.linear,
                  begin: MediaQuery.of(context).size.width,
                  end: 0,
                  duration: const Duration(milliseconds: 1300),
                ),
            verticalGap(10.h),
            Bounceable(
              onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => const WorkDetailsScreen()));
              },
              child: Container(
                height: 100.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10.r),
                  image: const DecorationImage(
                    image: NetworkImage(
                        "https://images.pexels.com/photos/8376285/pexels-photo-8376285.jpeg?auto=compress&cs=tinysrgb&w=600"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Our Work",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "See how we work and what we do",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ).animate().moveX(
                  curve: Curves.linear,
                  begin: -MediaQuery.of(context).size.width,
                  end: 0,
                  duration: const Duration(milliseconds: 1300),
                ),
            verticalGap(20.h),
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage(
                      "https://images.pexels.com/photos/236380/pexels-photo-236380.jpeg?auto=compress&cs=tinysrgb&w=600"),
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.7),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Subscribe Us",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Lsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argumsum dolor sit amet, an labores explicari qui, eu nostrum copiosae argum",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      verticalGap(20.h),
                      Container(
                        padding: EdgeInsets.all(8.0.sp),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset:
                                  const Offset(0, 3), 
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16.0.sp),
                                  border: InputBorder.none,
                                  hintText: 'Enter your email',
                                ),
                              ),
                            ),
                            horizontalGap(
                                10.w), // Space between text field and button
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                foregroundColor: Colors.white,
                                backgroundColor: Colors.blue, // Text color
                                padding: EdgeInsets.symmetric(
                                    horizontal: 20.0.sp), // Adjust button width
                              ),
                              onPressed: () {
                                // Handle button press
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Something went wrong.')),
                                );
                              },
                              child: Text(
                                'Subscribe',
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            verticalGap(20.h),
          ],
        ),
      ),
    );
  }
}
