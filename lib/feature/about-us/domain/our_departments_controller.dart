import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OurDepartmentsController extends GetxController {
  // Define a list of services with specific types related to departments
  final departments = [
    {
      "title": "Neurology",
      "description": "Specialized care for neurological disorders.",
      "image":
          "https://images.pexels.com/photos/3769740/pexels-photo-3769740.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.grain, // Icon for Neurology
    },
    {
      "title": "Cardiology",
      "description": "Expert heart care and treatments.",
      "image":
          "https://images.pexels.com/photos/4386470/pexels-photo-4386470.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.favorite, // Icon for Cardiology
    },
    {
      "title": "Ophthalmology",
      "description": "Comprehensive eye care services.",
      "image":
          "https://images.pexels.com/photos/5766071/pexels-photo-5766071.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.remove_red_eye, // Icon for Ophthalmology
    },
    {
      "title": "Pediatrics",
      "description": "Dedicated care for infants and children.",
      "image":
          "https://images.pexels.com/photos/3620931/pexels-photo-3620931.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.child_care, // Icon for Pediatrics
    },
    {
      "title": "Radiology",
      "description": "Advanced imaging services for diagnostics.",
      "image":
          "https://images.pexels.com/photos/3862632/pexels-photo-3862632.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.image, // Icon for Radiology
    },
    {
      "title": "Urology",
      "description": "Expert care for urinary tract disorders.",
      "image":
          "https://images.pexels.com/photos/4255853/pexels-photo-4255853.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.local_hospital, // Icon for Urology
    },
  ].obs;
}
