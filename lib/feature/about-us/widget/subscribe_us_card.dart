import 'package:docment/core/const_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubscribeUsCard extends StatelessWidget {
  const SubscribeUsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                              offset: const Offset(0, 3),
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
            );
  }
}