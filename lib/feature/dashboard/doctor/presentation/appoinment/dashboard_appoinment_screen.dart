import 'package:docment/feature/dashboard/doctor/controller/appoinment_controller.dart';
import 'package:docment/feature/dashboard/doctor/data/doctor_appoinment_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashBoardAppointmentsScreen extends StatelessWidget {
  final DoctorAppointmentController controller =
      Get.put(DoctorAppointmentController(appointmentService: DoctorAppointmentService()));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Appointments')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                // Cards for total appointments and treated count
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildStatCard('Total Appointments', controller.appointmentData.value.data.total.toString(), Colors.red),
                      _buildStatCard('Treated Appointments', controller.treatedCount.value.toString(), Colors.blue),
                    ],
                  ),
                ).animate().fadeIn(delay: 100.ms), // Add fade in animation
                // Scrollable table for appointment details
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        columns: [
                          DataColumn(label: Text('ID')),
                          DataColumn(label: Text('Date')),
                          DataColumn(label: Text('Fee')),
                          DataColumn(label: Text('Status')),
                          DataColumn(label: Text('Patient Name')),
                          DataColumn(label: Text('Email')),
                        ],
                        rows: controller.appointmentData.value.data.appointments
                            .map((appointment) => DataRow(cells: [
                                  DataCell(Text(appointment.id.toString())),
                                  DataCell(Text(appointment.date)),
                                  DataCell(Text('${appointment.appointmentFee} ${appointment.payableCurrency}')),
                                  DataCell(Text(appointment.status.toString())),
                                  DataCell(Text(appointment.user.name)),
                                  DataCell(Text(appointment.user.email)),
                                ]))
                            .toList(),
                      ).animate().fadeIn(delay: 200.ms), // Add fade in animation for the table
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }

  Widget _buildStatCard(String title, String value, Color cardColor) {
    return Card(
      elevation: 4,
      color: cardColor.withOpacity(0.8), // Set card color with opacity
      child: Container(
        padding: EdgeInsets.all(16),
        width: 150.w, // Fixed width for uniform size
        height: 100.h, // Fixed height for uniform size
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ).animate().scale(), // Scale animation for card
    );
  }
}

