import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownController extends GetxController {
  // Declare selectedValue as an RxString
  var selectedValue = ''.obs; 

  TextEditingController searchController = TextEditingController();

  // Method to update selectedValue
  void updateSelectedValue(String? value) {
    selectedValue.value = value ?? '';
  }

  // Clear search method
  void clearSearch() {
    searchController.clear();
  }
}
