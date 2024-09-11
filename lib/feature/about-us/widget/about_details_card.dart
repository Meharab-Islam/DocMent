import 'package:docment/core/const_design.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AboutDetailsCard extends StatelessWidget {
  const AboutDetailsCard({super.key, required this.title, required this.description, required this.image});

  final String title;
  final String description;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
        // color: const Color.fromARGB(255, 209, 209, 209),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                image:  DecorationImage(
                    image: NetworkImage(
                        image),
                    fit: BoxFit.cover),
              ),
            ),
            verticalGap(10.h),
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              description,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.normal),
            ),
            verticalGap(20.h),
          ]),
    );
  }
}
