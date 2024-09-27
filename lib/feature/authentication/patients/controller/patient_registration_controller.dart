// user_controller.dart

import 'package:docment/feature/authentication/patients/data/patient_registration_data.dart';
import 'package:docment/feature/authentication/patients/model/patient_registration_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PatientRegistrationController extends GetxController {
  var isLoading = false.obs; // To manage loading state
  var registrationSuccess = false.obs;

  final PatientRegistrationData registrationData;

  PatientRegistrationController(this.registrationData);

  Future<void> registerUser(PatientRegistrationModel user, BuildContext context) async {
    isLoading.value = true; // Set loading state to true
    registrationSuccess.value = false; // Reset success state

    registrationSuccess.value = await registrationData.registerPatient(user, context);

    isLoading.value = false; // Set loading state to false
  }
}
