import 'package:docment/feature/authentication/doctor/presentation/login_screen.dart';
import 'package:docment/feature/authentication/doctor/presentation/registration_screen.dart';
import 'package:docment/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyDrawer extends StatelessWidget {
  GetStorage _storage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.white, // Background color of the drawer
        child: Column(
          children: [
            // Taller Header with Network Image
            Container(
              height: 200, // Set the desired height for the header
              width: double.infinity, // Use full width of the drawer
              child: DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.redAccent, // Header background color
                  gradient: LinearGradient(
                    colors: [Colors.redAccent, Colors.blue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    // Network Image
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://images.pexels.com/photos/3259629/pexels-photo-3259629.jpeg?auto=compress&cs=tinysrgb&w=600'), // Replace with your image URL
                    ),
                    SizedBox(height: 10),
                    Text(
                      'DocMent',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'App Version: 1.0.0',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            // Divider
            Divider(thickness: 1, color: Colors.grey[300]),

            // List of options
         _storage.read("doctor_auth_token") == null ?    ListTile(
              leading: Icon(Icons.person, color: Colors.deepOrange),
              title: Text('Doctor Login'),
              onTap: () {
                // Navigator.of(context).pushNamed('/doctor_login');
                Get.to(DoctorLoginScreen());
              },
            ):SizedBox(),
            // ListTile(
            //   leading: Icon(Icons.assignment, color: Colors.deepOrange),
            //   title: Text('Doctor Registration'),
            //   onTap: () {
            //     Get.to(DoctorRegistrationScreen());
            //   },
            // ),
            // ListTile(
            //   leading: Icon(Icons.login, color: Colors.deepOrange),
            //   title: Text('Login'),
            //   onTap: () {
            //     Navigator.of(context).pushNamed('/login');
            //   },
            // ),
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text('Logout'),
              onTap: () {
                _storage.remove('doctor_auth_token');
                Get.offAll(() => MyApp());
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Logged out')));
              },
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.deepOrange),
              title: Text('About App'),
              onTap: () {
                // Navigator.of(context).pushNamed('/about');
              },
            ),
            Spacer(), // Pushes the logout button to the bottom
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '© 2024 DocMent. All rights reserved.',
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
