import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

class SubmitButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final Color color;
  final double height;
  final double width;

  SubmitButton({
    Key? key,
    required this.text,
    required this.onTap,
    this.color = Colors.redAccent,
    required this.height,
    required this.width, // Default color
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounceable(
      onTap: onTap,
      child: Container(
        // height: 33.h,
        // width: MediaQuery.of(context).size.width / 2,
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3.r),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
