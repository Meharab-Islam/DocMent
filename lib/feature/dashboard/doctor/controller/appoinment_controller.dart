import 'package:docment/feature/dashboard/doctor/data/doctor_appoinment_data.dart';
import 'package:docment/feature/dashboard/doctor/model/doctor_appoinment_model.dart';
import 'package:get/get.dart';


class DoctorAppointmentController extends GetxController {
   var isLoading = true.obs;
  var appointmentData = DoctorAppointmentModel(status: '', data: AppointmentData(currentPage: 0, appointments: [], firstPageUrl: '', total: 0)).obs;

  final DoctorAppointmentService appointmentService;
   var treatedAppointments = <Appointment>[].obs; // List to hold treated appointments
  var treatedCount = 0.obs; // Count of treated appointments

  DoctorAppointmentController({required this.appointmentService});

  @override
  void onInit() {
    fetchAppointments();
    super.onInit();
  }

  void fetchAppointments() async {
    try {
      isLoading(true);
      appointmentData.value = await appointmentService.fetchAppointments();
      


for (var i = 0; i < appointmentData.value.data.total; i++) {
  if (appointmentData.value.data.appointments[i].alreadyTreated == 1) {
    treatedCount.value++;
  }
}

    } finally {
      isLoading(false);
    }
  }
}
