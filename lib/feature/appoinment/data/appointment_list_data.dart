// services/appointment_service.dart

import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/appoinment/model/appointment_list_model.dart';
import 'package:http/http.dart' as http;

class AppointmentListService {
    String apiUrl =  patient_appointment_url;

  Future<List<AppointmentListModel>> fetchAppointments() async {
    final response = await http.get(Uri.parse(apiUrl), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['data']['data'] as List;
      return data.map((appointment) => AppointmentListModel.fromJson(appointment)).toList();
    } else {
      throw Exception('Failed to load appointments');
    }
  }
}
