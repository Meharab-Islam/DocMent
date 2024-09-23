import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppointmentController extends GetxController {
  // Observables for dropdown values
  var selectedDepartment = ''.obs;
  var selectedDoctor = ''.obs;
  var selectedSchedule = ''.obs;

  // Observable for date selection
  var selectedDate = DateTime.now().obs;

  // TextEditingController for dropdown search
  TextEditingController searchController = TextEditingController();

  // Method to update selected department
  void updateDepartment(String? value) {
    selectedDepartment.value = value ?? '';
  }

  // Method to update selected doctor
  void updateDoctor(String? value) {
    selectedDoctor.value = value ?? '';
  }

  // Method to update selected schedule
  void updateSchedule(String? value) {
    selectedSchedule.value = value ?? '';
  }

  // Method to update selected date
  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }
}
