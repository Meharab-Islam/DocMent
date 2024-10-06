// pages/appointment_list_page.dart

import 'package:docment/core/api.dart';
import 'package:docment/feature/appoinment/controller/appoinment_list_controller.dart';
import 'package:docment/feature/appoinment/presentation/appoinment_details_screen.dart';
import 'package:docment/feature/appoinment/presentation/appoinment_screen.dart';
import 'package:docment/feature/authentication/patients/presentation/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AppointmentListPage extends StatelessWidget {
  final AppointmentListController controller = Get.put(AppointmentListController());

  GetStorage _storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return _storage.read('patient_auth_token') == null ? PatientLoginScreen() : Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.appointments.length,
          itemBuilder: (context, index) {
            final appointment = controller.appointments[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(url+ appointment.doctor.image),
              ),
              title: Text(appointment.doctor.name),
              subtitle: Text(appointment.date),
              trailing: Text(appointment.payableCurrency),
              onTap: () {
                // Navigate to details page (yet to implement)
               Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => AppointmentDetailsPage(appointmentId: appointment.id)),
);
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add new appointment (yet to implement)
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppointmentScreen()),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
