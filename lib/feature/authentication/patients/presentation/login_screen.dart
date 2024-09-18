import 'package:docment/core/const_design.dart';
import 'package:docment/feature/authentication/patients/presentation/registration_screen.dart';
import 'package:docment/feature/authentication/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PatientLoginScreen extends StatelessWidget {
  const PatientLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              Container(
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
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Login as User',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32.0.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    verticalGap(10.h),
                    CustomTextfield(
                      hint: 'Email',
                      isPassword: false,
                      controller: TextEditingController(),
                    ),
                    verticalGap(10.h),
                    CustomTextfield(
                      hint: 'Password',
                      isPassword: true,
                      controller: TextEditingController(),
                    ),
                    verticalGap(10.h),
                    Bounceable(
                        onTap: () {},
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
                        )),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have any account',
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
                                        const PatientRegistrationScreen()));
                          },
                          child: Text(
                            'Register',
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
            ],
          ),
        ),
      ),
    );
  }
}
