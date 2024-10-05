import 'package:docment/feature/appoinment/model/appoinment_datails_model.dart';
import 'package:docment/feature/authentication/doctor/data/doctor_registration_data.dart';
import 'package:docment/feature/authentication/doctor/model/doctor_registration_model.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DoctorRegisterController extends GetxController {
  var isLoading = false.obs;
  var registrationModel = DoctorRegistrationModel().obs;
  final DoctorRegistrationData apiService = DoctorRegistrationData();

  // TextEditingControllers to get data from form fields
  TextEditingController nameController = TextEditingController();
  TextEditingController designationsController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();

  // Method to register user
  Future<void> registerDoctor(context) async {



 if (emailController.text.isEmpty ||
                                passwordController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Input Fields cannot be empty'),
                                ),
                              );
                            } else {
                           
    isLoading(true); // Show loading spinner
    // Populate the user model from form controllers
    registrationModel.value = DoctorRegistrationModel(
      name: nameController.text,
      designations: designationsController.text,
      email: emailController.text,
      phone: phoneController.text,
      departmentId: departmentController.text,
      locationId: locationController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );

    bool success = await apiService.registerUser(registrationModel.value);

    if (success) {
      Get.snackbar('Success', 'User registered successfully',
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar('Error', 'Failed to register user',
          backgroundColor: Colors.red, colorText: Colors.white);
    }

    isLoading(false); // Hide loading spinner
                          
                          
                          
                            }

  }
}
