import 'package:docment/feature/home/data/location_data.dart';
import 'package:docment/feature/home/model/location_model.dart';

import 'package:get/get.dart';

class LocationController extends GetxController {
  var location = <LocationModel>[].obs;
  var isLoading = true.obs;

  final LocationService locationService;

  LocationController({required this.locationService});

  @override
  void onInit() {
    fetchDepartments();
    super.onInit();
  }

  Future<void> fetchDepartments() async {
    try {
      isLoading(true);
      final response = await locationService.getLocations();
      if (response['status'] == 'success') {
        location.value = (response['data'] as List)
            .map((e) => LocationModel.fromJson(e))
            .toList();
      } else {
        // Handle error case
        Get.snackbar("Error", "Failed to load departments");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
