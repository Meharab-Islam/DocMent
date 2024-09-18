import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

squireCard(
    {required BuildContext context,
    required String count,
    required String title,
    required IconData icon}) {
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

  return Container(
    height: height,
    width: width,
    decoration: boxDecoration,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Colors.white,
          size: 40.sp,
        ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
        FittedBox(
          child: Text(
            count,
            style: TextStyle(
              color: Colors.white,
              fontSize: 40.sp,
              fontWeight: FontWeight.w500,
            ),
          ).animate().fade(duration: 200.ms).scale(delay: 200.ms),
        ),
        Text(
          title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal),
          textAlign: TextAlign.center,
        ).animate().fade(delay: 200.ms).scale(delay: 200.ms),
      ],
    ),
  );
}
