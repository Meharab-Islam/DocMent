import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class DoctorProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor Profile'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Doctor's Image
              Center(
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: NetworkImage(
                    'https://images.pexels.com/photos/4270375/pexels-photo-4270375.jpeg?auto=compress&cs=tinysrgb&w=600', // Replace with actual image URL
                  ),
                ),
              ).animate().scale(duration: 600.ms).fadeIn(),
              const SizedBox(height: 20),

              // Doctor's Name and Title
              const Text(
                'Dr. Sarah Johnson',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ).animate().fadeIn(duration: 800.ms).slide(),
              const SizedBox(height: 5),
              const Text(
                'Cardiologist',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ).animate().fadeIn(duration: 1000.ms).slide(),
              const SizedBox(height: 20),

              // Contact Info
            const  Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Contact Information',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ListTile(
                        leading: Icon(Icons.phone, color: Colors.blueAccent),
                        title: Text('+1 234 567 8900'),
                        subtitle: Text('Phone Number'),
                      ),
                      ListTile(
                        leading: Icon(Icons.email, color: Colors.blueAccent),
                        title: Text('dr.sarah@hospital.com'),
                        subtitle: Text('Email'),
                      ),
                      ListTile(
                        leading:
                            Icon(Icons.location_on, color: Colors.blueAccent),
                        title: Text('123 Main St, Cityville'),
                        subtitle: Text('Clinic Address'),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(duration: 1200.ms),
              const SizedBox(height: 20),

              // Experience and Specialization
            const  Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Experience & Specialization',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const ListTile(
                        leading: Icon(Icons.work, color: Colors.blueAccent),
                        title: Text('10+ years'),
                        subtitle: Text('Experience'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.school, color: Colors.blueAccent),
                        title: Text('Harvard Medical School'),
                        subtitle: Text('Education'),
                      ),
                      const ListTile(
                        leading: Icon(Icons.local_hospital,
                            color: Colors.blueAccent),
                        title: Text('Cardiology, Surgery'),
                        subtitle: Text('Specializations'),
                      ),
                    ],
                  ),
                ),
              ).animate().fadeIn(duration: 1400.ms),
              const SizedBox(height: 20),

              // Schedule and Appointments
              // Card(
              //   elevation: 5,
              //   child: Padding(
              //     padding: const EdgeInsets.all(16.0),
              //     child: Column(
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         const Text(
              //           'Schedule & Appointments',
              //           style: TextStyle(
              //             fontSize: 20,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.redAccent,
              //           ),
              //         ),
              //         const SizedBox(height: 10),
              //         const ListTile(
              //           leading: Icon(Icons.schedule, color: Colors.blueAccent),
              //           title: Text('Mon - Fri: 9:00 AM - 4:00 PM'),
              //           subtitle: Text('Working Hours'),
              //         ),
              //         const ListTile(
              //           leading: Icon(Icons.calendar_today,
              //               color: Colors.blueAccent),
              //           title: Text('Book an Appointment'),
              //           subtitle: Text('Online or via Phone'),
              //         ),
              //         const SizedBox(height: 10),
              //         ElevatedButton(
              //           onPressed: () {
              //             // Appointment booking logic here
              //           },
              //           style: ElevatedButton.styleFrom(
              //             foregroundColor: Colors.white,
              //             backgroundColor: Colors.redAccent, // Text color
              //           ),
              //           child: const Text('Book Appointment'),
              //         ),
              //       ],
              //     ),
              //   ),
              // ).animate().fadeIn(duration: 1600.ms),
              // const SizedBox(height: 20),

              // Edit Profile Button
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UpdateProfileScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.edit),
                label: Text(
                  "Edit Profile",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                ),
              ).animate().scale(duration: 800.ms),
            ],
          ),
        ),
      ),
    );
  }
}

// Update Profile Screen
class UpdateProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Profile"),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Edit Doctor Information',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Doctor Name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Specialization',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Contact Number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Clinic Address',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update profile logic here
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.redAccent,
              ),
              child: Text("Save Changes"),
            ),
          ],
        ),
      ),
    );
  }
}
