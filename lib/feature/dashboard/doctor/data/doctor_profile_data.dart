import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:docment/core/api.dart';
import 'package:docment/feature/dashboard/doctor/model/doctor_profile_model.dart';

class DoctorProfileServices {
  // API endpoint for fetching doctor profile
  final String _apiUrl = doctor_profile_url;

  // Fetch doctor profile based on doctor ID
  Future<DoctorProfileModel> fetchDoctorProfile(int doctorId) async {
    final Uri url = Uri.parse(_apiUrl);

    try {
      // Making a GET request with necessary headers
      final http.Response response = await http.get(url, headers: _buildHeaders());

      // Checking the response status
      if (response.statusCode == 200) {
        // Successfully received response
        return DoctorProfileModel.fromJson(json.decode(response.body));
      } else {
        // Logging the error response for debugging
        print("Error fetching doctor profile: ${response.statusCode}, ${response.body}");
        throw Exception('Failed to load doctor profile: ${response.statusCode}');
      }
    } catch (e) {
      // Catching and throwing errors for external handling
      print('Error occurred while fetching doctor profile: $e');
      throw Exception('Error fetching doctor profile: $e');
    }
  }

  // Private helper function to build request headers
  Map<String, String> _buildHeaders() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': token, // Assuming the token is globally available
    };
  }
}
