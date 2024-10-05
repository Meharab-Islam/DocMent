import 'package:docment/feature/profile/data/patient_data.dart';
import 'package:docment/feature/profile/model/profile_data_model.dart';
import 'package:get/get.dart';


class PatientController extends GetxController {
  var isLoading = true.obs;
  var patient = Rxn<PatientModel>();  // Rxn allows null values

  final PatientService _patientService = PatientService();

  @override
  void onInit() {
    super.onInit();
    fetchPatient();
  }

  void fetchPatient() async {
    try {
      isLoading(true);
      PatientModel fetchedPatient = await _patientService.fetchPatientData();
      patient.value = fetchedPatient;
    } catch (e) {
      print("Error fetching patient data: $e");
    } finally {
      isLoading(false);
    }
  }
}
