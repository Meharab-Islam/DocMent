// doctor_controller.dart
import 'package:docment/feature/home/data/doctor_data.dart';
import 'package:docment/feature/home/model/doctor_model.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
  var isLoading = true.obs;
  var doctorList = <DoctorModel>[].obs;
  var currentPage = 1;
  var totalPages = 1;

  final DoctorService _doctorService = DoctorService();

  DoctorController(DoctorService doctorService);

  @override
  void onInit() {
    fetchDoctors();
    super.onInit();
  }

  Future<void> fetchDoctors() async {
    try {
      isLoading(true);
      var doctors = await _doctorService.fetchDoctors(currentPage);
      doctorList.addAll(doctors);
      // Here, you can update totalPages and currentPage from the API response if needed
    } finally {
      isLoading(false);
    }
  }

  void loadMore() {
    if (currentPage < totalPages) {
      currentPage++;
      fetchDoctors();
    }
  }
}
