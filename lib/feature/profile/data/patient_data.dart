import 'package:docment/core/api.dart';
import 'package:docment/feature/profile/model/profile_data_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class PatientService {
  final String patientProfileUrl = patient_profile_url;  // Update with your actual API

  Future<PatientModel> fetchPatientData() async {
    final response = await http.get(Uri.parse(patientProfileUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      return PatientModel.fromJson(jsonResponse['data']);
    } else {
      throw Exception('Failed to load patient data');
    }
  }
}
