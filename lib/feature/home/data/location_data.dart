import 'dart:convert';
import 'package:docment/feature/home/model/location_model.dart';
import 'package:http/http.dart' as http;
import '../../../core/api.dart'; 

class LocationService {
  final String apiUrl = "${base_url}/locations?language=en";

  Future<List<Location>> fetchLocations() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);

      if (jsonResponse['status'] == 'success') {
        List<Location> locations = (jsonResponse['data'] as List)
            .map((data) => Location.fromJson(data))
            .toList();
        print(locations);
        return locations;
      } else {
        throw Exception('Failed to load locations');
      }
    } else {
      throw Exception('Failed to load data from the API');
    }
  }
}
