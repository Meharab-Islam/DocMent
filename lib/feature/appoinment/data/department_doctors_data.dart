// department_doctors_service.dart
import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/appoinment/model/department_doctors_model.dart';
import 'package:http/http.dart' as http;

class DepartmentDoctorsService {
  final String apiUrl = doctor_search_by_department_id_url; // Replace with your API URL

  // Fetch doctors based on department or location (or any ID)
  Future<List<DepartmentDoctorsModel>> fetchDoctors(int id) async {
    print(id);
    final response = await http.get(Uri.parse('$apiUrl$id')); // Append ID to the URL

  
  print('Response status: ${response.statusCode}');
  print('Response body: ${response}');

  if (response.statusCode == 200) {
    if (response.body.isNotEmpty) {
      try {
        final data = json.decode(response.body);
        if (data.containsKey('data')) {
          List<DepartmentDoctorsModel> doctors = (data['data'] as List)
              .map((doctorJson) => DepartmentDoctorsModel.fromJson(doctorJson))
              .toList();
          return doctors;
        } else {
          throw Exception('Invalid response structure');
        }
      } catch (e) {
        throw Exception('Failed to parse JSON: $e');
      }
    } else {
      throw Exception('Empty response body');
    }
  } else if (response.statusCode == 404) {
    throw Exception('Data not found (404)');
  } else {
    throw Exception('Failed to load doctors, status code: ${response.statusCode}');
  }
  }
}