import 'package:docment/core/const_design.dart';
import 'package:docment/feature/appoinment/widget/dropdown_field.dart';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppoinmentScreen extends StatefulWidget {
  const AppoinmentScreen({super.key});

  @override
  State<AppoinmentScreen> createState() => _AppoinmentScreenState();
}

class _AppoinmentScreenState extends State<AppoinmentScreen> {
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('d MMMM yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime initialDate = _selectedDate ?? currentDate;
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(currentDate.year - 10),
      lastDate: DateTime(currentDate.year + 10),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            hintColor: Colors.blue,
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.5.w),
        child: ListView(children: [
          verticalGap(20.h),
          Text(
            "Create Appoinment",
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
            textAlign: TextAlign.center,
          ).animate().fadeIn(duration: 1500.ms),
          verticalGap(20.h),
          const AppoinmentDropDownField(
              title: "Select Department",
              items: ["Nurologist", "Dermatologist", "Orthopedist", "Dentist"]),
          verticalGap(20.h),
          const AppoinmentDropDownField(
              title: "Select Doctor", items: ["Dr. John Doe", "Dr. Jack"]),
          verticalGap(20.h),
          // const DropDownField(title: "Select Date", items: ["Time 1", "Time 2"]),
          Bounceable(
            onTap: () {
              _selectDate(context);
            },
            child: Container(
              height: 40.h,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color.fromARGB(255, 187, 187, 187),
                ),
                color: Colors.white,
              ),
              child: Center(
                child: Row(
                  children: [
                    horizontalGap(15.w),
                    Text(
                      _selectedDate == null
                          ? 'Select Date'
                          : _dateFormat.format(_selectedDate!),
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.black,
                      ),
                    ),
                    const Spacer(),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 34.sp,
                    ),
                    horizontalGap(15.w),
                  ],
                ),
              ),
            ),
          ),

          verticalGap(20.h),
          const AppoinmentDropDownField(
              title: "Select Schedule",
              items: ["11:00 AM", "11:30 AM", "12:00 PM", "12:30 PM"]),
          verticalGap(20.h),
          Bounceable(
              onTap: () {},
              child: Container(
                height: 33.h,
                width: MediaQuery.of(context).size.width / 2,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 104, 104),
                  borderRadius: BorderRadius.circular(3.r),
                ),
                child: Center(
                  child: Text(
                    "Search",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )),
        ]));
  }
}
