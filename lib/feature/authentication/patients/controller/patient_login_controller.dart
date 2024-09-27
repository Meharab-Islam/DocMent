import 'package:docment/feature/authentication/patients/data/patient_login_data.dart';
import 'package:docment/feature/authentication/patients/model/patient_login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientLoginController extends GetxController {
  var isLoading = false.obs;
  var loginSuccess = false.obs;

  final PatientLoginData loginData;

  PatientLoginController({required this.loginData});

  Future<void> loginUser(PatientLoginModel user, BuildContext context) async {
    isLoading.value = true; // Set loading state to true
    loginSuccess.value = false; // Reset success state

    loginSuccess.value = await loginData.loginPatient(user, context);

    isLoading.value = false;
  }
}
