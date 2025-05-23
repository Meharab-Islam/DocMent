import 'dart:convert';
import 'package:docment/feature/home/model/location_model.dart';
import 'package:http/http.dart' as http;
import '../../../core/api.dart'; 

class LocationService {
  final String apiUrl = "${base_url}/get-locations?language=en";

   Future<Map<String, dynamic>> getLocations() async {
    final response = await http.get(Uri.parse(apiUrl)); // Replace with your actual API endpoint

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load departments');
    }
  }
}
