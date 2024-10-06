// services/appointment_service.dart

import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/appoinment/model/appointment_list_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

class AppointmentListService {
    String apiUrl =  patient_appointment_url;
    GetStorage _storage = GetStorage();

  Future<List<AppointmentListModel>> fetchAppointments() async {
    String _token = _storage.read('patient_auth_token') ?? '';
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': "Bearer " + _token,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']['data'] as List;
      return data.map((appointment) => AppointmentListModel.fromJson(appointment)).toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }
}
