import 'package:docment/feature/authentication/patients/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/const_design.dart';

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  DateTime? _selectedDate;
  final DateFormat _dateFormat = DateFormat('d MMMM yyyy');

  @override
  void dispose() {
    _selectedDate;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 200.h, // Adjust height as needed
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.close,
                  size: 20.sp,
                  color: Colors.black,
                )),
          ),
          Text(
            'Take a Date',
            style: TextStyle(
                fontSize: 28.sp,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent),
          ),
          verticalGap(20.h),
          Bounceable(
            onTap: () async {
              await _selectDate(context);
            },
            child: Container(
              height: 40.h,
              width: 320.w,
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
          Bounceable(
              onTap: () {
                Get.to(PatientLoginScreen());
              },
              child: Container(
                height: 33.h,
                // width: MediaQuery.of(context).size.width / 2,
                width: 130.w,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 104, 104),
                  borderRadius: BorderRadius.circular(3.r),
                ),
                child: Center(
                  child: Text(
                    "Appointment",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )),
        ],
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime initialDate = _selectedDate ?? currentDate;
    DateTime firstDate = DateTime(currentDate.year - 100); // Example range
    DateTime lastDate = DateTime(currentDate.year + 100); // Example range

    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (selectedDate != null && selectedDate != initialDate) {
      setState(() {
        _selectedDate = selectedDate;
      });
    }
  }
}
