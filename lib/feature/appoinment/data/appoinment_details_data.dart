// appointment_details_service.dart
import 'dart:convert';
import 'package:docment/core/api.dart';
import 'package:docment/feature/appoinment/model/appoinment_datails_model.dart';
import 'package:http/http.dart' as http;


class AppointmentDetailsService {
  Future<AppointmentDetailsModel> fetchAppointmentDetails(int appointmentId) async {
    final response = await http.get(Uri.parse(patient_appointment_detail_url+"$appointmentId"), headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token,
    });

    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      if (jsonResponse['status'] == 'success') {
        print("the data is " + response.body);
        return AppointmentDetailsModel.fromJson(jsonResponse['data']);

      } else {
        print("the data is " + response.body);
        throw Exception('Failed to load appointment details');
      }
    } else {
      print("the data is " + response.body);
      throw Exception('Failed to load appointment details');
    }
  }
}
