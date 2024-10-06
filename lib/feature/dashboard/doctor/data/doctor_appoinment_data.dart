import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/dashboard/doctor/model/doctor_appoinment_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class DoctorAppointmentService {
  final String apiUrl = doctor_all_appointment_url;



 Future<DoctorAppointmentModel> fetchAppointments() async {
    GetStorage _storage = GetStorage();
    String token = _storage.read('doctor_auth_token') ?? '';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);
        return DoctorAppointmentModel.fromJson(jsonData);
      } else {
        throw Exception('Failed to load appointments');
      }
    } catch (e) {
      throw Exception('Failed to load appointments: $e');
    }
  }





}
