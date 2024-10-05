// controllers/appointment_controller.dart

import 'package:docment/feature/appoinment/data/appointment_list_data.dart';
import 'package:docment/feature/appoinment/model/appointment_list_model.dart';
import 'package:get/get.dart';


class AppointmentListController extends GetxController {
  var appointments = <AppointmentListModel>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }

  void fetchAppointments() async {
    try {
      isLoading(true);
      var fetchedAppointments = await AppointmentListService().fetchAppointments();
      appointments.assignAll(fetchedAppointments);
    } finally {
      isLoading(false);
    }
  }
}
