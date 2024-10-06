import 'package:docment/core/const_design.dart';
import 'package:docment/feature/authentication/doctor/controller/doctor_registration_controller.dart';
import 'package:docment/feature/authentication/doctor/presentation/login_screen.dart';
import 'package:docment/feature/authentication/widget/custom_dropdown_search.dart';
import 'package:docment/feature/authentication/widget/custom_textfield.dart';
import 'package:docment/feature/global/presentation/dropdown_search_button.dart';
import 'package:docment/feature/home/controller/department_controller.dart';
import 'package:docment/feature/home/controller/location_data_controller.dart';
import 'package:docment/feature/home/data/department_data.dart';
import 'package:docment/feature/home/data/location_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DoctorRegistrationScreen extends StatelessWidget {
  const DoctorRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
      final DepartmentController _departmentController = Get.put(DepartmentController(departmentService: DepartmentService()));
      final LocationController _locationController = Get.put(LocationController(locationService:  LocationService()));
      final DoctorRegisterController _doctorRegisterController = Get.put(DoctorRegisterController());




    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://images.pexels.com/photos/28318688/pexels-photo-28318688/free-photo-of-perf.jpeg?auto=compress&cs=tinysrgb&w=600'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              Color.fromARGB(188, 0, 0, 0),
              Color.fromARGB(225, 0, 0, 0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ListView(
                // mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  verticalGap(130.h),
                  Center(
                    child: Text(
                      'Register as Doctor',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Name',
                    isPassword: false,
                    controller: _doctorRegisterController.nameController,
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Designation',
                    isPassword: false,
                    controller: _doctorRegisterController.designationsController,
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Email',
                    isPassword: false,
                    controller: _doctorRegisterController.emailController,
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Phone',
                    isPassword: false,
                    controller: _doctorRegisterController.phoneController,
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Password',
                    isPassword: true,
                    controller: _doctorRegisterController.passwordController,
                  ),
                    verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Confirm Password',
                    isPassword: true,
                    controller: _doctorRegisterController.passwordConfirmationController,
                  ),
                
                  verticalGap(10.h),
                Obx((){
                    if (_departmentController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (_departmentController.departments.isEmpty) {
            return Center(child: Text("No departments available"));
          }
          return RegistrationDropDownField( 
            title: "Select Department",
                items: _departmentController.departments.map((department) {
                  return department.translations.isNotEmpty ? department.translations[0].name : "Unnamed Department";
                }).toList(),
                onItemSelected: (value) {
                  // Handle department selection
                  final selectedDepartment = _departmentController.departments.firstWhere((department) => department.translations[0].name == value);
                  print("Selected department: $value");
                  print("Selected department id: ${selectedDepartment.id}");

                  _doctorRegisterController.departmentController.text = selectedDepartment.id.toString();

                  // Fetch doctors based on the selected department ID
                
                
                },);
                }),
                
                  verticalGap(10.h),
                  Obx((){
                    if (_departmentController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          }

          if (_departmentController.departments.isEmpty) {
            return Center(child: Text("No departments available"));
          }
          return RegistrationDropDownField(title: "Select Location",  items: _locationController.location.map((location) {
                  return location.translations.isNotEmpty ? location.translations[0].name.toString(): "Unnamed Department";
                }).toList(),
                onItemSelected: (value) {
                  // Handle department selection
                  final selectedLocation = _locationController.location.firstWhere((location) => location.translations[0].name == value);
                  print("Selected department: $value");
                  print("Selected department id: ${selectedLocation.id}");

                  _doctorRegisterController.locationController.text = selectedLocation.id.toString();

                  // Fetch doctors based on the selected department ID
                
                },);
                }),
                  verticalGap(10.h),
                        
                  verticalGap(10.h),
                       Obx(() {
                      if (_doctorRegisterController.isLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      return Bounceable(
                          onTap: () {
                            if (_doctorRegisterController.emailController.text.isEmpty ||
                                _doctorRegisterController.passwordController.text.isEmpty ||_doctorRegisterController.passwordConfirmationController.text.isEmpty || _doctorRegisterController.nameController.text.isEmpty || _doctorRegisterController.designationsController.text.isEmpty || _doctorRegisterController.phoneController.text.isEmpty || _doctorRegisterController.departmentController.text.isEmpty || _doctorRegisterController.locationController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Input Fields cannot be empty'),
                                ),
                              );
                            } else {
                          

                             _doctorRegisterController.registerDoctor(context);

                              print(_doctorRegisterController.emailController.text);
                              print(_doctorRegisterController.passwordController.text);
                            }
                          },
                          child: Container(
                            height: 33.h,
                            // width: MediaQuery.of(context).size.width / 2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.redAccent,
                              borderRadius: BorderRadius.circular(3.r),
                            ),
                            child: Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ));
                    }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DoctorLoginScreen()));
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalGap(50.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
