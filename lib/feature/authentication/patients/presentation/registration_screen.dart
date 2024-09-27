// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'package:docment/core/const_design.dart';
import 'package:docment/feature/authentication/patients/controller/patient_registration_controller.dart';
import 'package:docment/feature/authentication/patients/data/patient_registration_data.dart';
import 'package:docment/feature/authentication/patients/model/patient_registration_model.dart';
import 'package:docment/feature/authentication/patients/presentation/login_screen.dart';
import 'package:docment/feature/authentication/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PatientRegistrationScreen extends StatelessWidget {
  const PatientRegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PatientRegistrationController registrationData =
        Get.put(PatientRegistrationController(PatientRegistrationData()));

    TextEditingController _nameController = TextEditingController();
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _confirmPasswordController = TextEditingController();

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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Register as User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 32.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Name',
                    isPassword: false,
                    controller: _nameController,
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Email',
                    isPassword: false,
                    controller: _emailController,
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Password',
                    isPassword: true,
                    controller: _passwordController,
                  ),
                  verticalGap(10.h),
                  CustomTextfield(
                    hint: 'Confirm Password',
                    isPassword: true,
                    controller: _confirmPasswordController,
                  ),
                  verticalGap(10.h),
                  Obx(() {
                    if (registrationData.isLoading.value) {
                      return CircularProgressIndicator();
                    }
                    return Bounceable(
                        onTap: () {
                          // FocusScope.of(context).unfocus();

                          if (_nameController.text.isEmpty ||
                              _emailController.text.isEmpty ||
                              _passwordController.text.isEmpty ||
                              _confirmPasswordController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Input Fields cannot be empty'),
                              ),
                            );
                            if (_passwordController.text !=
                                _confirmPasswordController.text) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Passwords do not match'),
                                ),
                              );
                            }
                          } else {
                            var patientData = PatientRegistrationModel(
                                name: _nameController.text,
                                email: _emailController.text,
                                password: _passwordController.text,
                                passwordConfirmation:
                                    _confirmPasswordController.text);

                            registrationData.registerUser(patientData, context);

                            print(_nameController.text);
                            print(_emailController.text);
                            print(_passwordController.text);
                            print(_confirmPasswordController.text);
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
                  Obx(() {
                    if (registrationData.registrationSuccess.value) {
                      return Text('Registration Successful!');
                    }
                    return SizedBox.shrink();
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
                                  builder: (context) =>
                                      const PatientLoginScreen()));
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
