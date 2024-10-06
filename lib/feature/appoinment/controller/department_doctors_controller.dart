import 'package:docment/feature/appoinment/data/department_doctors_data.dart';
import 'package:docment/feature/appoinment/model/department_doctors_model.dart';
import 'package:get/get.dart';


class DepartmentDoctorsController extends GetxController {
 var doctors = <DepartmentDoctorsModel>[].obs; // Observable list for reactive UI
  var isLoading = true.obs; // Loading state

  final DepartmentDoctorsService doctorService;

  DepartmentDoctorsController({required this.doctorService});

  // Fetch doctors by passing the ID
  void fetchDoctors(int id) async {
    try {
      isLoading(true); // Set loading to true
      var doctorList = await doctorService.fetchDoctors(id);
      doctors.assignAll(doctorList); // Update observable list
    } finally {
      isLoading(false); // Set loading to false
    }
  }
}
