// department_doctors_service.dart
import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/appoinment/model/department_doctors_model.dart';
import 'package:http/http.dart' as http;

class DepartmentDoctorsService {
  Future<List<DepartmentDoctorsModel>> fetchDoctors(int departmentId) async {
    // Make the API call here
    // Replace the following line with actual API call
    final response = await http.get(
        Uri.parse("$base_url+/get-department-doctor/:2"));

        

    if (response.statusCode == 200) {
      // Parse the JSON response
      final jsonResponse = json.decode(response.body);
      // Create a list of doctors
      print("Response status code: ${response.statusCode}");

      return (jsonResponse['data'] as List)
          .map((doctorJson) => DepartmentDoctorsModel.fromJson(doctorJson))
          .toList();

    } else {print("Response status code: ${response.statusCode}");

      throw Exception('Failed to load doctors');
    }
  }
}


