import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:docment/core/api.dart';
import 'package:docment/feature/dashboard/doctor/model/doctor_profile_model.dart';

class DoctorProfileServices {
  final String doctortProfileUrl = doctor_profile_url;  // Update with your actual API

  GetStorage storage = GetStorage();

  Future<DoctorProfileModel> fetchDoctorData() async {
    String? _token = storage.read('doctor_auth_token');
    final response = await http.get(Uri.parse(doctortProfileUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer  " + _token!,
    });

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      print(jsonResponse);
      print(jsonResponse);
      return DoctorProfileModel.fromJson(jsonResponse['data']);
    } else {
      print('Request failed with status: ${response.statusCode}.');
      throw Exception('Failed to load patient data');
    }
  }
}
