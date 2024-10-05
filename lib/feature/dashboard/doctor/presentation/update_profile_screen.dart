// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:docment/feature/dashboard/doctor/controller/doctor_profle_controller.dart';
// import 'package:docment/feature/dashboard/doctor/model/doctor_profile_model.dart';

// class UpdateProfileScreen extends StatelessWidget {
//   final DoctorProfileModel doctor;
//   final DoctorProfileController _doctorProfileController = Get.find();

//   UpdateProfileScreen(this.doctor);

//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController specializationController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     // Pre-fill form fields with existing data
//     nameController.text = doctor.name ?? '';
//     specializationController.text = doctor.specialization ?? '';
//     phoneController.text = doctor.phone ?? '';
//     emailController.text = doctor.email ?? '';
//     addressController.text = doctor.address ?? '';

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Edit Profile"),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Edit Doctor Information',
//                 style: TextStyle(
//                   fontSize: 22,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: nameController,
//                 decoration: InputDecoration(
//                   labelText: 'Doctor Name',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: specializationController,
//                 decoration: InputDecoration(
//                   labelText: 'Specialization',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: phoneController,
//                 decoration: InputDecoration(
//                   labelText: 'Contact Number',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   labelText: 'Email Address',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: addressController,
//                 decoration: InputDecoration(
//                   labelText: 'Clinic Address',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _doctorProfileController.updateDoctorProfile(
//                       DoctorProfileModel(
//                         id: doctor.id,
//                         name: nameController.text,
//                         specialization: specializationController.text,
//                         phone: phoneController.text,
//                         email: emailController.text,
//                         address: addressController.text,
//                       ),
//                     );
//                     Get.back();
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.redAccent,
//                 ),
//                 child: Text("Save Changes"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
