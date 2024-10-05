import 'package:docment/core/const_design.dart';
import 'package:docment/core/widget/text_style.dart';
import 'package:docment/feature/appoinment/controller/department_doctors_controller.dart';
import 'package:docment/feature/global/presentation/dropdown_search_button.dart';
import 'package:docment/feature/home/data/department_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../feature/home/controller/department_controller.dart';
import '../../../core/widget/button.dart';

class AppointmentScreen extends StatelessWidget {
  final DepartmentController _departmentController = Get.put(DepartmentController(departmentService: DepartmentService()));
  final DepartmentDoctorsController _departmentDoctorsController = Get.put(DepartmentDoctorsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.5.w),
        child: Obx(() {
          if (_departmentController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (_departmentController.departments.isEmpty) {
            return Center(child: Text("No departments available"));
          }

          return ListView(
            children: [
              verticalGap(20.h),
              titleText(text: "Create Appointment", textAlign: TextAlign.center),
              verticalGap(20.h),

              // Department Dropdown
              DropDownField(
                title: "Select Department",
                items: _departmentController.departments.map((department) {
                  return department.translations.isNotEmpty ? department.translations[0].name : "Unnamed Department";
                }).toList(),
                onItemSelected: (value) {
                  // Handle department selection
                  final selectedDepartment = _departmentController.departments.firstWhere((department) => department.translations[0].name == value);
                  print("Selected department: $value");
                  print("Selected department id: ${selectedDepartment.id}");

                  // Fetch doctors based on the selected department ID
                  _departmentDoctorsController.fetchDoctors(selectedDepartment.id);
                },
              ),
              verticalGap(10.h),

              // Doctors Dropdown
              Obx(() {
                if (_departmentDoctorsController.doctors.isEmpty) {
                  return Text("No doctors available for the selected department");
                }

                return DropDownField(
                  title: "Select Doctor",
                  items: _departmentDoctorsController.doctors.map((doctor) => doctor.name).toList(),
                  onItemSelected: (value) {
                    // Update the selected doctor in the controller
                    final selectedDoctor = _departmentDoctorsController.doctors.firstWhere((doctor) => doctor.name == value);
                    _departmentDoctorsController.updateDoctor(selectedDoctor);
                  },
                );
              }),

              verticalGap(20.h),

              // Submit Button
              SubmitButton(
                height: 33.h,
                width: MediaQuery.of(context).size.width / 2,
                text: "Search",
                onTap: () {
                  // Handle submit action
                },
              ),
            ],
          );
        }),
      ),
    );
  }
}
