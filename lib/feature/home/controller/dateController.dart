import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DateController extends GetxController {
  Rxn<DateTime> selectedDate = Rxn<DateTime>(); // Reactive nullable DateTime
  final DateFormat dateFormat = DateFormat('d MMMM yyyy');

  Future<void> selectDate(BuildContext context) async {
    DateTime currentDate = DateTime.now();
    DateTime initialDate = selectedDate.value ?? currentDate;
    DateTime firstDate = DateTime(currentDate.year - 100); // Example range
    DateTime lastDate = DateTime(currentDate.year + 100); // Example range

    DateTime? newSelectedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );

    if (newSelectedDate != null && newSelectedDate != initialDate) {
      selectedDate.value = newSelectedDate; // Update selected date reactively
    }
  }

  String formatSelectedDate() {
    return selectedDate.value != null
        ? dateFormat.format(selectedDate.value!)
        : 'Select Date';
  }
}
