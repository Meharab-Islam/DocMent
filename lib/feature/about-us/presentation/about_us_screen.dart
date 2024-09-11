import 'package:docment/core/const_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
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
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: double.infinity,
            height: 200.h,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.spaceBetween,

              runSpacing: 6.h,
              // spacing: 5.w,
              children: [
                Container(
                  height: height,
                  width: width,
                  decoration: boxDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_alt_outlined,
                        color: Colors.white,
                        size: 40.sp,
                      ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
                      Text(
                        "500+",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).animate().fade(duration: 200.ms).scale(delay: 200.ms),
                      Text(
                        "Patients",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
                    ],
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: boxDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.business_center_outlined,
                        color: Colors.white,
                        size: 40.sp,
                      ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
                      Text(
                        "16",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).animate().fade(duration: 200.ms).scale(delay: 200.ms),
                      Text(
                        "Departments",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
                    ],
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: boxDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.people_alt_outlined,
                        color: Colors.white,
                        size: 40.sp,
                      ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
                      Text(
                        "50",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).animate().fade(duration: 200.ms).scale(delay: 200.ms),
                      Text(
                        "Expert Doctors",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
                    ],
                  ),
                ),
                Container(
                  height: height,
                  width: width,
                  decoration: boxDecoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.favorite_border_outlined,
                        color: Colors.white,
                        size: 40.sp,
                      ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
                      Text(
                        "120",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ).animate().fade(duration: 200.ms).scale(delay: 200.ms),
                      Text(
                        "Total Labs",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal),
                      ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
                    ],
                  ),
                ),
                // Container(
                //   height: height,
                //   width: width,
                //   decoration: boxDecoration,
                // ),
                // Container(
                //   height: height,
                //   width: width,
                //   decoration: boxDecoration,
                // ),
                // Container(
                //   height: height,
                //   width: width,
                //   decoration: boxDecoration,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
