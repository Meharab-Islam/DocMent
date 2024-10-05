// doctor_service.dart
import 'package:docment/feature/home/model/doctor_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class DoctorService {
  final String baseUrl = 'https://demo.websolutionus.com/finddoc/api';

  Future<List<DoctorModel>> fetchDoctors(int page) async {
    final response = await http.get(Uri.parse('$baseUrl/doctors?page=$page'));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      List<DoctorModel> doctors = (data['data']['data'] as List)
          .map((doctor) => DoctorModel.fromJson(doctor))
          .toList();
      return doctors;
    } else {
      throw Exception('Failed to load doctors');
    }
  }
}
