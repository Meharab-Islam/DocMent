import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServiceController extends GetxController {
  // Define a list of services with specific types
  final services = [
    {
      "title": "Heart Surgery",
      "description": "Comprehensive heart surgery with expert surgeons.",
      "image":
          "https://images.pexels.com/photos/13697931/pexels-photo-13697931.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.favorite, // Icon for Heart Surgery
    },
    {
      "title": "DNA Testing",
      "description": "Advanced DNA testing for accurate results.",
      "image":
          "https://images.pexels.com/photos/3862632/pexels-photo-3862632.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.science, // Icon for DNA Testing
    },
    {
      "title": "General Treatment",
      "description": "Holistic treatments for common health conditions.",
      "image":
          "https://images.pexels.com/photos/5622251/pexels-photo-5622251.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.local_hospital, // Icon for General Treatment
    },
    {
      "title": "Eye Treatment",
      "description": "Comprehensive eye care and surgeries.",
      "image":
          "https://images.pexels.com/photos/5766071/pexels-photo-5766071.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.remove_red_eye, // Icon for Eye Treatment
    },
    {
      "title": "Dental Service",
      "description": "Expert dental care for all age groups.",
      "image":
          "https://images.pexels.com/photos/4269934/pexels-photo-4269934.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.medical_services, // Icon for Dental Service
    },
    {
      "title": "Ambulance Service",
      "description": "24/7 ambulance service available for emergencies.",
      "image":
          "https://images.pexels.com/photos/5364345/pexels-photo-5364345.jpeg?auto=compress&cs=tinysrgb&w=600",
      "icon": Icons.local_shipping, // Icon for Ambulance Service
    },
  ].obs;
}
