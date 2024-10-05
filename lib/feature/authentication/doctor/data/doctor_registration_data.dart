import 'package:docment/core/api.dart';
import 'package:docment/feature/authentication/doctor/model/doctor_registration_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DoctorRegistrationData {

  // Function to post the user data to the API
  Future<bool> registerUser(DoctorRegistrationModel user) async {
    final url = Uri.parse(doctor_registration_url); // Adjust API endpoint accordingly

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(user.toJson()),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // Data sent successfully
        return true;
      } else {
        print('Error: ${response.body}');
        return false;
      }
    } catch (e) {
      print('Error occurred: $e');
      return false;
    }
  }
}
