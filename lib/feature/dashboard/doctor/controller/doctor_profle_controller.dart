// doctor_profile_controller.dart
import 'package:docment/feature/dashboard/doctor/data/doctor_profile_data.dart';
import 'package:docment/feature/dashboard/doctor/model/doctor_profile_model.dart';
import 'package:get/get.dart';

class DoctorProfileController extends GetxController {
  // Observable to hold the doctor profile data
  final Rx<DoctorProfileModel?> doctorProfile = Rx<DoctorProfileModel?>(null);
  
  // Observable to track loading state
  final RxBool isLoading = true.obs;
  
  // DoctorProfileServices instance to handle API requests
  final DoctorProfileServices service = DoctorProfileServices();

  // Method to fetch the doctor profile based on doctor ID
  Future<void> fetchDoctorProfile(int doctorId) async {
    // Setting loading state to true before API call
    isLoading.value = true;

    try {
      // Fetching doctor profile data from the API service
      DoctorProfileModel fetchedProfile = await service.fetchDoctorProfile(doctorId);
      
      // Updating the observable with fetched profile data
      doctorProfile.value = fetchedProfile;

      // Logging the fetched profile (can be removed in production)
      print('Fetched Doctor Profile: ${doctorProfile.value}');
    } catch (e, stackTrace) {
      // Logging the error with detailed information
      print('Error fetching doctor profile for ID $doctorId: $e');
      print('StackTrace: $stackTrace');
    } finally {
      // Setting loading state to false once the API call is complete
      isLoading.value = false;
    }
  }

  // Method to clear the fetched profile data (if needed)
  void clearProfile() {
    doctorProfile.value = null;
  }

  // This is called when the controller is removed from memory.
  @override
  void onClose() {
    super.onClose();
    // Perform any additional cleanup if needed
  }
}
