import 'package:flutter/material.dart';

class AppointmentDetailScreen extends StatelessWidget {
  final Map<String, String> appointment;

  AppointmentDetailScreen({required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointment Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${appointment["date"]}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Time: ${appointment["time"]}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text('Status: ${appointment["status"]}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Description:', style: TextStyle(fontSize: 18)),
            SizedBox(height: 10),
            Text(appointment["description"] ?? 'No description available', style: TextStyle(fontSize: 16)),
            // Add more details as necessary
          ],
        ),
      ),
    );
  }
}
