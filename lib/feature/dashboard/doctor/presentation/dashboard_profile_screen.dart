import 'package:docment/core/const_design.dart';
import 'package:docment/feature/dashboard/doctor/controller/doctor_profle_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class DoctorProfileScreen extends StatelessWidget {
  final DoctorProfileController _doctorProfileController = Get.put(DoctorProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (_doctorProfileController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        if (_doctorProfileController.doctorProfile.value!.data == null) {
          return Center(child: Text("No doctor data available"));
        }

        var doctor = _doctorProfileController.doctorProfile.value!.data!;
        var translation = doctor.translations![0];

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Doctor's Image
                Center(
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: NetworkImage(
                      doctor.image ?? 'https://images.pexels.com/photos/4270375/pexels-photo-4270375.jpeg?auto=compress&cs=tinysrgb&w=600',
                    ),
                  ),
                ).animate().scale(duration: 600.ms).fadeIn(),
                verticalGap(20.h),

                // Doctor's Name and Title
                Text(
                  doctor.name ?? "Unknown",
                  style: TextStyle(
                    fontSize: 28.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ).animate().fadeIn(duration: 800.ms).slide(),
                verticalGap(10.h),
                Text(
                  translation.designations ?? 'Unknown',
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.grey,
                  ),
                ).animate().fadeIn(duration: 1000.ms).slide(),
                verticalGap(20.h),

                // Contact Info
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Contact Information',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        verticalGap(10.h),
                        ListTile(
                          leading: Icon(Icons.phone, color: Colors.blueAccent),
                          title: Text(doctor.phone ?? 'N/A'),
                          subtitle: Text('Phone Number'),
                        ),
                        ListTile(
                          leading: Icon(Icons.email, color: Colors.blueAccent),
                          title: Text(doctor.email ?? 'N/A'),
                          subtitle: Text('Email'),
                        ),
                        ListTile(
                          leading: Icon(Icons.location_on, color: Colors.blueAccent),
                          title: Text(translation.address ?? 'N/A'),
                          subtitle: Text('Clinic Address'),
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(duration: 1200.ms),
                verticalGap(20.h),

                // Experience and Specialization
                Card(
                  elevation: 5,
                  child: Padding(
                    padding: EdgeInsets.all(16.0.sp),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Experience & Specialization',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        verticalGap(10.h),
                        ListTile(
                          leading: Icon(Icons.work, color: Colors.blueAccent),
                          title: Text(translation.experience ?? 'N/A'),
                          subtitle: Text('Experience'),
                        ),
                        ListTile(
                          leading: Icon(Icons.school, color: Colors.blueAccent),
                          title: Text(translation.educations ?? 'N/A'),
                          subtitle: Text('Education'),
                        ),
                        ListTile(
                          leading: Icon(Icons.local_hospital, color: Colors.blueAccent),
                          title: Text('Specialization Info'), // You can replace with relevant specialization field if available
                          subtitle: Text('Specializations'),
                        ),
                      ],
                    ),
                  ),
                ).animate().fadeIn(duration: 1400.ms),
                verticalGap(20.h),

                // Edit Profile Button
                ElevatedButton.icon(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UpdateProfileScreen(),
                    //   ),
                    // );
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
        );
      }),
    );
  }
}
