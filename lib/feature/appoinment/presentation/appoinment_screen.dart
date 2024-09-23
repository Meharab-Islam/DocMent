import 'package:docment/core/widget/button.dart';
import 'package:docment/feature/appoinment/domain/appoinment_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../core/const_design.dart';
import '../../../core/widget/text_style.dart';
import '../../../feature/authentication/patients/presentation/registration_screen.dart';

import '../../../feature/global/presentation/dropdown_search_button.dart';

class AppointmentScreen extends StatelessWidget {
  final AppointmentController controller = Get.put(AppointmentController());
  final DateFormat _dateFormat = DateFormat('d MMMM yyyy');

  Future<void> _selectDate(BuildContext context) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: currentDate,
      firstDate: currentDate,
      lastDate: DateTime(currentDate.year + 10),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.red,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: Colors.red,
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedDate != null) {
      controller.updateSelectedDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.5.w),
      child: ListView(
        children: [
          verticalGap(20.h),
          titleText(text: "Create Appointment", textAlign: TextAlign.center),
          verticalGap(20.h),

          // Department Dropdown
          DropDownField(
            title: "Select Department",
            items: const [
              "Neurologist",
              "Dermatologist",
              "Orthopedist",
              "Dentist"
            ],
            onItemSelected: (value) {
              controller.updateDepartment(value);
            },
          ),
          verticalGap(20.h),

          // Doctor Dropdown
          DropDownField(
            title: "Select Doctor",
            items: const ["Dr. John Doe", "Dr. Jack"],
            onItemSelected: (value) {
              controller.updateDoctor(value);
            },
          ),
          verticalGap(20.h),

          // Date Picker
          Obx(() => Bounceable(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                        color: const Color.fromARGB(255, 187, 187, 187)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        horizontalGap(15.w),
                        Text(
                          controller.selectedDate.value == DateTime.now()
                              ? 'Select Date'
                              : _dateFormat
                                  .format(controller.selectedDate.value),
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: const Color.fromARGB(255, 63, 63, 63)),
                        ),
                        const Spacer(),
                        Icon(
                          Icons.arrow_drop_down,
                          color: const Color.fromARGB(255, 126, 126, 126),
                          size: 34.sp,
                        ),
                        horizontalGap(15.w),
                      ],
                    ),
                  ),
                ),
              )),
          verticalGap(20.h),

          // Schedule Dropdown
          DropDownField(
            title: "Select Schedule",
            items: const ["11:00 AM", "11:30 AM", "12:00 PM", "12:30 PM"],
            onItemSelected: (value) {
              controller.updateSchedule(value);
            },
          ),
          verticalGap(20.h),

          // Submit Button
          SubmitButton(
            height: 33.h,
            width: MediaQuery.of(context).size.width / 2,
            text: "Search",
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const PatientRegistrationScreen();
              }));
            },
          ),
        ],
      ),
    );
  }
}
