
import 'package:docment/feature/authentication/doctor/data/doctor_login_data.dart';
import 'package:docment/feature/authentication/doctor/model/doctor_login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorLoginController extends GetxController {
  var isLoading = false.obs;
  var loginSuccess = false.obs;

  final DoctorLoginData loginData;

  DoctorLoginController({required this.loginData});

  Future<void> loginUser(DoctorLoginModel user, BuildContext context) async {
    isLoading.value = true; // Set loading state to true
    loginSuccess.value = false; // Reset success state

    loginSuccess.value = await loginData.loginDcotor(user, context);

    

    isLoading.value = false;
  }
}
