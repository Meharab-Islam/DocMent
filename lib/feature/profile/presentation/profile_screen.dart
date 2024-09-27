import 'package:docment/feature/profile/domain/profile_screen_controller.dart';
import 'package:docment/feature/profile/presentation/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Profile Image with Animation
              Center(
                child: CircleAvatar(
                  radius: 70,
                  backgroundImage:
                      NetworkImage(controller.profile.profilePicture),
                ).animate().scale(duration: 700.ms).fadeIn(),
              ),
              const SizedBox(height: 20),

              // Profile Details Section with Icons
              _buildProfileCard('Name', controller.profile.name, Icons.person),
              _buildProfileCard('Email', controller.profile.email, Icons.email),
              _buildProfileCard('Phone', controller.profile.phone, Icons.phone),
              _buildProfileCard('Guardian Name',
                  controller.profile.guardianName, Icons.family_restroom),
              _buildProfileCard('Guardian Phone',
                  controller.profile.guardianPhone, Icons.phone_android),
              _buildProfileCard('Age', controller.profile.age, Icons.cake),
              _buildProfileCard(
                  'Occupation', controller.profile.occupation, Icons.work),
              _buildProfileCard('Gender', controller.profile.gender, Icons.wc),
              _buildProfileCard(
                  'Address', controller.profile.address, Icons.location_on),
              _buildProfileCard(
                  'Country', controller.profile.country, Icons.flag),
              _buildProfileCard(
                  'City', controller.profile.city, Icons.location_city),
              _buildProfileCard(
                  'Date of Birth', controller.profile.dateOfBirth, Icons.cake),
              _buildProfileCard(
                  'Weight', controller.profile.weight, Icons.fitness_center),
              _buildProfileCard(
                  'Height', controller.profile.height, Icons.height),
              _buildProfileCard(
                  'Health Insurance',
                  controller.profile.healthInsuranceNumber,
                  Icons.health_and_safety),
              _buildProfileCard('Health Card Number',
                  controller.profile.healthCardNumber, Icons.card_membership),
              _buildProfileCard('Health Provider',
                  controller.profile.healthCardProvider, Icons.local_hospital),
              _buildProfileCard('Blood Group', controller.profile.bloodGroup,
                  Icons.bloodtype),
              _buildProfileCard('Disabilities', controller.profile.disabilities,
                  Icons.accessibility),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(EditProfileScreen());
        },
        child: Icon(Icons.edit),
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
