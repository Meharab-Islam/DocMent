import 'package:docment/core/api.dart';
import 'package:docment/feature/authentication/patients/presentation/login_screen.dart';
import 'package:docment/feature/profile/controller/profile_screen_controller.dart';
import 'package:docment/feature/profile/presentation/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get_storage/get_storage.dart';

class ProfileScreen extends StatelessWidget {
  final PatientController controller = Get.put(PatientController());

  GetStorage _storage = GetStorage();



  @override
  Widget build(BuildContext context) {
    return  _storage.read('patient_auth_token') == null ? PatientLoginScreen() : Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Obx(() {
            // Ensure profile is loaded
            final profile = controller.patient.value;
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            }
            if (profile == null) {
              return Center(child: Text('No profile available'));
            }

            return Column(
              children: [
                // Profile Image with Animation
                Center(
                  child: Container(
                   
                    height: 150.h,
                    width: 150.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: profile.image != null ? NetworkImage("$url${profile.image!}",)
                        : const NetworkImage('https://images.pexels.com/photos/25185199/pexels-photo-25185199/free-photo-of-smiling-woman-with-yellow-wildflowers-in-her-hair.jpeg?auto=compress&cs=tinysrgb&w=600&lazy=load') as ImageProvider,
                        fit: BoxFit.cover,
                      ),
                    ),
                       
                  ).animate().scale(duration: 700.ms).fadeIn(),
                ),
                const SizedBox(height: 20),

                // Profile Details Section with Icons
                _buildProfileCard('Name', profile.name ?? 'N/A', Icons.person),
                _buildProfileCard('Email', profile.email ?? 'N/A', Icons.email),
                _buildProfileCard('Phone', profile.details.phone ?? 'N/A', Icons.phone),
                _buildProfileCard('Guardian Name', profile.details.guardianName ?? 'N/A', Icons.family_restroom),
                _buildProfileCard('Guardian Phone', profile.details.guardianPhone ?? 'N/A', Icons.phone_android),
                _buildProfileCard('Age', profile.details.age ?? 'N/A', Icons.cake),
                _buildProfileCard('Occupation', profile.details.occupation ?? 'N/A', Icons.work),
                _buildProfileCard('Gender', profile.details.gender ?? 'N/A', Icons.wc),
                _buildProfileCard('Address', profile.details.address ?? 'N/A', Icons.location_on),
                _buildProfileCard('Country', profile.details.country ?? 'N/A', Icons.flag),
                _buildProfileCard('City', profile.details.city ?? 'N/A', Icons.location_city),
                _buildProfileCard('Date of Birth', profile.details.dateOfBirth ?? 'N/A', Icons.cake),
                _buildProfileCard('Weight', profile.details.weight ?? 'N/A', Icons.fitness_center),
                _buildProfileCard('Height', profile.details.height ?? 'N/A', Icons.height),
                _buildProfileCard('Health Insurance', profile.details.healthInsuranceNumber ?? 'N/A', Icons.health_and_safety),
                _buildProfileCard('Health Card Number', profile.details.healthCardNumber ?? 'N/A', Icons.card_membership),
                _buildProfileCard('Health Provider', profile.details.healthCardProvider ?? 'N/A', Icons.local_hospital),
                _buildProfileCard('Blood Group', profile.details.bloodGroup ?? 'N/A', Icons.bloodtype),
                _buildProfileCard('Disabilities', profile.details.disabilities ?? 'N/A', Icons.accessibility),
              ],
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(EditProfileScreen());
        },
        child: const Icon(Icons.edit),
        backgroundColor: Colors.deepOrangeAccent,
      ),
    );
  }

  // Helper Method to Build Profile Card with Animations and Icons
  Widget _buildProfileCard(String label, String value, IconData icon) {
    return Card(
      elevation: 2,
      shadowColor: Colors.blueAccent.withOpacity(0.4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, color: Colors.deepOrangeAccent, size: 30)
                .animate()
                .scale(duration: 400.ms)
                .fadeIn(),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.blueAccent,
                    ),
                  ).animate().fadeIn(duration: 500.ms).slideX(),
                  const SizedBox(height: 8),
                  Text(
                    value,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ).animate().fadeIn(duration: 700.ms).slideY(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
