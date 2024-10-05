import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../../core/api.dart';

class DepartmentService {
  final String apiUrl = department_url;
  Future<Map<String, dynamic>> getDepartments() async {
    final response = await http.get(Uri.parse(apiUrl)); // Replace with your actual API endpoint

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load departments');
    }
  }
}
