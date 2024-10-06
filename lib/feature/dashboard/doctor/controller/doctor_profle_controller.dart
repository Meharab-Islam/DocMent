// doctor_profile_controller.dart
import 'package:docment/feature/dashboard/doctor/data/doctor_profile_data.dart';
import 'package:docment/feature/dashboard/doctor/model/doctor_profile_model.dart';
import 'package:get/get.dart';

class DoctorProfileController extends GetxController {
  var isLoading = true.obs;
  var doctorProfile = Rxn<DoctorProfileModel>();  // Rxn allows null values

  final DoctorProfileServices _doctorService = DoctorProfileServices();

  @override
  void onInit() {
    super.onInit();
    fetchPatient();
  }

  void fetchPatient() async {
    try {
      isLoading(true);
      DoctorProfileModel fetchedDoctor = await _doctorService.fetchDoctorData();
      doctorProfile.value = fetchedDoctor;
      print(doctorProfile.value);
    } catch (e) {
      print("Error fetching patient data: $e");
    } finally {
      isLoading(false);
    }
  }
}
