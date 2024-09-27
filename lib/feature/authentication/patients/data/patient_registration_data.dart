// user_service.dart

import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/authentication/patients/model/patient_registration_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PatientRegistrationData {
  final String apiUrl = patient_registration_url; // Change to your API endpoint

  Future<bool> registerPatient(
      PatientRegistrationModel user, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      ); 
      print(response.body);

      if (response.statusCode == 201 || response.statusCode == 200) {
        // Successful registration
        print('User registered successfully');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User registered successfully'),
          ),
        );
        return true;
      } else {
        // Handle error (e.g., show error message)
        print('Registration failed');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(response.body),
          ),
        );
        return false;
      }
    } catch (e) {
      // Handle exception (e.g., show error message)
      print('Registration failed: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Registration failed: $e'),
        ),
      );
      return false;
    }
  }
}
