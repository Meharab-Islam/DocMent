// appointment_details_controller.dart
import 'package:docment/feature/appoinment/data/appoinment_details_data.dart';
import 'package:docment/feature/appoinment/model/appoinment_datails_model.dart';
import 'package:get/get.dart';


class AppointmentDetailsController extends GetxController {
  var isLoading = true.obs;
  var appointmentDetails = Rxn<AppointmentDetailsModel>();

  final AppointmentDetailsService _appointmentDetailsService = AppointmentDetailsService();

  void fetchAppointmentDetails(int appointmentId) async {
    try {
      isLoading(true);
      appointmentDetails.value = await _appointmentDetailsService.fetchAppointmentDetails(appointmentId);
    } catch (e) {
      // Handle error if needed
    } finally {
      isLoading(false);
    }
  }
}
