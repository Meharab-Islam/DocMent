import 'package:docment/feature/appoinment/data/department_doctors_data.dart';
import 'package:docment/feature/appoinment/model/department_doctors_model.dart';
import 'package:get/get.dart';

class DepartmentDoctorsController extends GetxController {
  var doctors = <DepartmentDoctorsModel>[].obs;
  var selectedDoctor = Rx<DepartmentDoctorsModel?>(null); // Store the selected doctor

  final DepartmentDoctorsService service = DepartmentDoctorsService();

  // Function to fetch doctors based on department ID
  void fetchDoctors(int departmentId) async {
    try {
      List<DepartmentDoctorsModel> fetchedDoctors = await service.fetchDoctors(departmentId);
      // Clear previous doctors and add the fetched ones
      if (fetchedDoctors.isNotEmpty) {
        doctors.assignAll(fetchedDoctors);
      } else {
        // Optionally handle the case when no doctors are returned
        print("No doctors available for the selected department.");
      }
    } catch (e) {
      print("Error fetching doctors: $e");
    }
  }

  void updateDoctor(DepartmentDoctorsModel? doctor) {
    selectedDoctor.value = doctor; // Directly store the selected doctor
  }
}
