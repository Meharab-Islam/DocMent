import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

bodyText(
    {required String text,
    TextAlign textAlign = TextAlign.left,
    Color color = const Color.fromARGB(255, 66, 66, 66)}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
    ),
    textAlign: textAlign,
  );
}

titleText(
    {required String text,
    TextAlign textAlign = TextAlign.left,
    Color color = const Color.fromARGB(255, 66, 66, 66)}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 25.sp,
      fontWeight: FontWeight.bold,
    ),
    textAlign: textAlign,
  );
}

inputText(
    {required String text,
    TextAlign textAlign = TextAlign.left,
    Color color = const Color.fromARGB(255, 66, 66, 66)}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
    ),
    textAlign: textAlign,
  );
}
