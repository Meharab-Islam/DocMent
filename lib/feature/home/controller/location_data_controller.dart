import 'package:docment/feature/home/data/location_data.dart';
import 'package:docment/feature/home/model/location_model.dart';

import 'package:get/get.dart';

class LocationController extends GetxController {
  var locations = <String>[].obs; // Observable list for locations
  var selectedLocation = ''.obs; // Observable for selected location
  var is_loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchLocations();
  }

  // Method to fetch locations from API and set the dropdown items
  void fetchLocations() async {
    try {
      List<Location> locationList = await LocationService().fetchLocations();
      locations.value = locationList
          .map((location) => location.translations.first.name)
          .toList();
      print(locationList);
    } catch (e) {
      print("Error fetching locations: $e");
    }finally{
      is_loading.value = false;
    }
  }

  // Method to update the selected location
  void selectLocation(String location) {
    selectedLocation.value = location;
  }
}
