// appointment_details_page.dart
import 'package:docment/core/api.dart';
import 'package:docment/feature/appoinment/controller/appoinment_details.controller.dart';
import 'package:docment/feature/appoinment/model/appoinment_datails_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';


class AppointmentDetailsPage extends StatelessWidget {
  final int appointmentId;
  final AppointmentDetailsController appointmentDetailsController = Get.put(AppointmentDetailsController());

  AppointmentDetailsPage({required this.appointmentId}) {
    // Fetch appointment details when the page is created
    appointmentDetailsController.fetchAppointmentDetails(appointmentId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Appointment Details")),
      body: Obx(() {
        if (appointmentDetailsController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          final details = appointmentDetailsController.appointmentDetails.value;
          if (details == null) {
            return Center(child: Text("No details available"));
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Appointment Information
                Text("Appointment ID: ${details.id}", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Date: ${details.date}"),
                Text("Appointment Fee: ${details.appointmentFee} ${details.payableCurrency}"),
                Text("Payment Status: ${details.paymentStatus == 0 ? 'Pending' : 'Completed'}"),
                Text("Payment Method: ${details.paymentMethod}"),
                const SizedBox(height: 20),

                // Patient Information
                Text("Patient Information", style: TextStyle(fontWeight: FontWeight.bold)),
                buildPatientInfo(details.user),
                const SizedBox(height: 20),

                // Doctor Information
                Text("Doctor Information", style: TextStyle(fontWeight: FontWeight.bold)),
                buildDoctorInfo(details.doctor),
                const SizedBox(height: 20),

                // Additional Information
                buildAdditionalInfo(details),
              ],
            ),
          ).animate().fadeIn(duration: 500.ms);
        }
      }),
    );
  }

  Widget buildPatientInfo(User user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailCard(
          title: "Patient Name: ${user.name}",
          subtitle: "Email: ${user.email}",
          imageUrl: url+user.image.toString(),
        ),
        buildDetail("Phone: ${user.details.phone}"),
        buildDetail("Address: ${user.details.address}"),
        buildDetail("City: ${user.details.city}"),
        buildDetail("Country: ${user.details.country}"),
        buildDetail("Occupation: ${user.details.occupation}"),
        buildDetail("Age: ${user.details.age}"),
        buildDetail("Gender: ${user.details.gender}"),
        buildDetail("Weight: ${user.details.weight}"),
      ],
    ).animate().slide(duration: 500.ms, begin: Offset(0, 0.1), end: Offset.zero);
  }

  Widget buildDoctorInfo(Doctor doctor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildDetailCard(
          title: "Doctor Name: ${doctor.name}",
          subtitle: "Email: ${doctor.email}",
          imageUrl:url+ doctor.image.toString(),
        ),
        buildDetail("Phone: ${doctor.phone}"),
        buildDetail("Fee: ${doctor.fee} USD"),
      ],
    ).animate().slide(duration: 500.ms, begin: Offset(0, 0.1), end: Offset.zero);
  }

  Widget buildAdditionalInfo(AppointmentDetailsModel details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (details.bloodPressure != null) buildDetail("Blood Pressure: ${details.bloodPressure}"),
        if (details.pulseRate != null) buildDetail("Pulse Rate: ${details.pulseRate}"),
        if (details.temperature != null) buildDetail("Temperature: ${details.temperature}"),
        if (details.problemDescription != null) buildDetail("Problem Description: ${details.problemDescription}"),
        if (details.habits != null) buildDetail("Habits: ${details.habits}"),
      ],
    ).animate().slide(duration: 500.ms, begin: Offset(0, 0.1), end: Offset.zero);
  }

  Widget buildDetail(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text(text),
    );
  }

  Widget buildDetailCard({required String title, required String subtitle, required String? imageUrl}) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            if (imageUrl != null)
              ClipOval(
                child: Image.network(imageUrl, width: 50, height: 50, fit: BoxFit.cover),
              ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(subtitle),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
