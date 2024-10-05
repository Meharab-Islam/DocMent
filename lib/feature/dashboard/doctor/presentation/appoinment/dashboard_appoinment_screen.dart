import 'package:docment/feature/dashboard/doctor/controller/appoinment_controller.dart';
import 'package:docment/feature/dashboard/doctor/presentation/appoinment/appoinment_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashBoardAppointmentsScreen extends StatelessWidget {
  final DashBoardAppointmentController appointmentController =
      Get.put(DashBoardAppointmentController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Appointment Counts Cards
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildCountCard(
                  title: 'Upcoming',
                  count: appointmentController.countUpcomingAppointments(),
                  color: Colors.blue,
                ),
                _buildCountCard(
                  title: 'Cancelled',
                  count: appointmentController.countCancelledAppointments(),
                  color: Colors.red,
                ),
                _buildCountCard(
                  title: 'Past',
                  count: appointmentController.countPastAppointments(),
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Search Bar
            TextField(
              onChanged: (value) {
                appointmentController
                    .updateSearchQuery(value); // Update search query
              },
              decoration: InputDecoration(
                labelText: 'Search by Date',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ).animate().fadeIn(duration: 600.ms),

            const SizedBox(height: 20),

            // Filter Dropdown
            Obx(() => DropdownButtonFormField<String>(
                  value: appointmentController.selectedFilter.value,
                  onChanged: (value) {
                    if (value != null) {
                      appointmentController
                          .updateFilter(value); // Update filter
                    }
                  },
                  items: <String>["All", "Upcoming", "Past", "Cancelled"]
                      .map((String filter) {
                    return DropdownMenuItem<String>(
                      value: filter,
                      child: Text(filter),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    labelText: 'Filter by Status',
                    border: OutlineInputBorder(),
                  ),
                )).animate().fadeIn(duration: 600.ms),

            const SizedBox(height: 20),

            // Appointments List Table
            Expanded(
              child: SingleChildScrollView(
                child: Obx(() => DataTable(
                      columns: const [
                        DataColumn(label: Text('Date')),
                        DataColumn(label: Text('Time')),
                        DataColumn(label: Text('Status')),
                      ],
                      rows: appointmentController.filteredAppointments
                          .map((appointment) {
                        return DataRow(
                          cells: [
                            DataCell(Text(appointment["date"]!)),
                            DataCell(Text(appointment["time"]!)),
                            DataCell(
                              Text(
                                appointment["status"]!,
                                style: TextStyle(
                                  color: appointment["status"] == "Upcoming"
                                      ? Colors.blue
                                      : appointment["status"] == "Cancelled"
                                          ? Colors.red
                                          : Colors.grey,
                                ),
                              ),
                            ),
                          ],
                          onSelectChanged: (bool? selected) {
                            if (selected != null && selected) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppointmentDetailScreen(
                                      appointment: appointment),
                                ),
                              );
                            }
                          },
                        );
                      }).toList(),
                    )).animate().fadeIn(duration: 800.ms),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCountCard(
      {required String title, required int count, required Color color}) {
    return Card(
      
      color: color,
      elevation: 4,
      child: Padding(
        padding: EdgeInsets.all(16.0.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              count.toString(),
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
